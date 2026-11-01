//! Deterministic UTC date handling and explicit source-review state.
use crate::model::{SourceReview, SourceReviewCheck};
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Clone, Copy, Debug, Eq, PartialEq, Ord, PartialOrd)]
pub struct Date {
    year: u32,
    month: u32,
    day: u32,
}
impl Date {
    pub fn parse(text: &str) -> Result<Self, String> {
        let bytes = text.as_bytes();
        if bytes.len() != 10
            || bytes[4] != b'-'
            || bytes[7] != b'-'
            || !bytes
                .iter()
                .enumerate()
                .all(|(i, c)| i == 4 || i == 7 || c.is_ascii_digit())
        {
            return Err("Date must use YYYY-MM-DD".into());
        }
        let year = text[..4].parse::<u32>().map_err(|_| "Invalid date")?;
        let month = text[5..7].parse::<u32>().map_err(|_| "Invalid date")?;
        let day = text[8..].parse::<u32>().map_err(|_| "Invalid date")?;
        let leap = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
        let max = match month {
            1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
            4 | 6 | 9 | 11 => 30,
            2 => {
                if leap {
                    29
                } else {
                    28
                }
            }
            _ => 0,
        };
        if !(1970..=9999).contains(&year) || day == 0 || day > max {
            return Err("Invalid calendar date".into());
        }
        Ok(Self { year, month, day })
    }
    pub fn utc_today() -> Result<Self, String> {
        let days = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .map_err(|_| "UTC clock unavailable")?
            .as_secs()
            / 86400;
        Self::from_unix_days(days)
    }
    fn from_unix_days(mut days: u64) -> Result<Self, String> {
        // At most 8,030 iterations; no timezone, locale, or extra dependency.
        for year in 1970..=9999 {
            let leap = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
            let year_days = if leap { 366 } else { 365 };
            if days >= year_days {
                days -= year_days;
                continue;
            }
            for (index, length) in [
                31,
                if leap { 29 } else { 28 },
                31,
                30,
                31,
                30,
                31,
                31,
                30,
                31,
                30,
                31,
            ]
            .iter()
            .enumerate()
            {
                if days >= *length {
                    days -= *length;
                } else {
                    return Ok(Self {
                        year,
                        month: index as u32 + 1,
                        day: days as u32 + 1,
                    });
                }
            }
        }
        Err("UTC clock outside supported range".into())
    }
    pub fn iso(self) -> String {
        format!("{:04}-{:02}-{:02}", self.year, self.month, self.day)
    }
}

pub fn source_check(review: &SourceReview, as_of: Date) -> SourceReviewCheck {
    let status = match review.status.as_str() {
        "conflict" => "conflict",
        "withdrawn" => "withdrawn",
        "unreviewed" => "unreviewed",
        "reviewed" => match (
            review
                .reviewed_on
                .as_deref()
                .and_then(|v| Date::parse(v).ok()),
            review
                .valid_through
                .as_deref()
                .and_then(|v| Date::parse(v).ok()),
        ) {
            (Some(start), Some(end)) if start <= end && start <= as_of && as_of <= end => "current",
            (Some(start), Some(end)) if start <= end && as_of > end => "expired",
            (Some(start), Some(end)) if start <= end && as_of < start => "review_date_in_future",
            _ => "invalid_review_metadata",
        },
        _ => "invalid_review_metadata",
    };
    SourceReviewCheck {
        source_id: review.source_id.clone(),
        status: status.into(),
        review_required: status != "current",
        evidence_locator: review.evidence_locator.clone(),
        note: review.review_note.clone(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn utc_dates_cover_leap_years_and_reject_invalid_input() {
        for invalid in [
            "2026-02-29",
            "2100-02-29",
            "2026-13-01",
            "2026-00-10",
            "2026-10-00",
            "2026-10-32",
            "2026-1-01",
            "invalid",
        ] {
            assert!(Date::parse(invalid).is_err());
        }
        assert!(Date::parse("2000-02-29").is_ok());
        assert_eq!(Date::from_unix_days(0).unwrap().iso(), "1970-01-01");
        assert_eq!(Date::from_unix_days(11016).unwrap().iso(), "2000-02-29");
        assert_eq!(Date::from_unix_days(20752).unwrap().iso(), "2026-10-26");
    }
}
