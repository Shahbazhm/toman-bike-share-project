# 🚲 Bike Share Data Dictionary

**Database:** Bike Share Analytics  
**Generated:** April 2026  
**Description:** This data dictionary documents all tables used in the bike share analysis project, including bike sharing hourly data and cost information.

---

## 📊 Executive Summary

| Metric | Count |
|--------|-------|
| **Total Tables** | 3 |
| **Total Columns** | 33 |
| **Data Coverage** | 2021-2022 (yr_0, yr_1) |

---

## 📑 Table of Contents

- [bike_share_yr_0](#bike_share_yr_0)
- [bike_share_yr_1](#bike_share_yr_1)
- [cost_table](#cost_table)

---

## 📋 bike_share_yr_0

**Description:** Bike sharing data for Year 0 (2021). Contains hourly rental records including weather conditions, temporal information, and rider counts.

**Row Count:** 17,290 records (24 hours × 365 days)

### Columns

| Column | Data Type | Nullable | Description |
|--------|-----------|----------|-------------|
| dteday | nvarchar(50) | NO | Date of the rental record (format: YYYY-MM-DD) |
| season | nvarchar(50) | NO | Season: 1=Spring, 2=Summer, 3=Fall, 4=Winter |
| yr | nvarchar(50) | NO | Year: 0=2021, 1=2022 |
| mnth | nvarchar(50) | NO | Month (1-12) |
| hr | nvarchar(50) | NO | Hour of day (0-23) |
| holiday | nvarchar(50) | NO | Holiday indicator: 0=No holiday, 1=Holiday |
| weekday | nvarchar(50) | NO | Day of week (0=Sunday through 6=Saturday) |
| workingday | nvarchar(50) | NO | Working day indicator: 0=Weekend/Holiday, 1=Working day |
| weathersit | nvarchar(50) | NO | Weather situation: 1=Clear, 2=Mist/Cloudy, 3=Light Rain/Snow, 4=Heavy Rain/Snow |
| temp | float | NO | Normalized temperature in Celsius (0-1 scale) |
| atemp | float | NO | Normalized "feels like" temperature (0-1 scale) |
| hum | nvarchar(50) | NO | Normalized humidity (0-1 scale) |
| windspeed | nvarchar(50) | NO | Normalized wind speed (0-1 scale) |
| rider_type | nvarchar(50) | NO | Type of rider: 'casual' or 'registered' |
| riders | nvarchar(50) | NO | Number of riders (count) |

---

## 📋 bike_share_yr_1

**Description:** Bike sharing data for Year 1 (2022). Contains hourly rental records including weather conditions, temporal information, and rider counts.

**Row Count:** 17,468 records (24 hours × 366 days - leap year)

### Columns

| Column | Data Type | Nullable | Description |
|--------|-----------|----------|-------------|
| dteday | nvarchar(50) | NO | Date of the rental record (format: YYYY-MM-DD) |
| season | nvarchar(50) | NO | Season: 1=Spring, 2=Summer, 3=Fall, 4=Winter |
| yr | nvarchar(50) | NO | Year: 0=2021, 1=2022 |
| mnth | nvarchar(50) | NO | Month (1-12) |
| hr | nvarchar(50) | NO | Hour of day (0-23) |
| holiday | nvarchar(50) | NO | Holiday indicator: 0=No holiday, 1=Holiday |
| weekday | nvarchar(50) | NO | Day of week (0=Sunday through 6=Saturday) |
| workingday | nvarchar(50) | NO | Working day indicator: 0=Weekend/Holiday, 1=Working day |
| weathersit | nvarchar(50) | NO | Weather situation: 1=Clear, 2=Mist/Cloudy, 3=Light Rain/Snow, 4=Heavy Rain/Snow |
| temp | float | NO | Normalized temperature in Celsius (0-1 scale) |
| atemp | float | NO | Normalized "feels like" temperature (0-1 scale) |
| hum | nvarchar(50) | NO | Normalized humidity (0-1 scale) |
| windspeed | nvarchar(50) | NO | Normalized wind speed (0-1 scale) |
| rider_type | nvarchar(50) | NO | Type of rider: 'casual' or 'registered' |
| riders | nvarchar(50) | NO | Number of riders (count) |

---

## 📋 cost_table

**Description:** Cost and pricing information for bike share operations. Contains financial metrics for profitability analysis.

**Row Count:** 2 records (one per year)

### Columns

| Column | Data Type | Nullable | Description |
|--------|-----------|----------|-------------|
| yr | nvarchar(50) | NO | Year identifier: 0=2021, 1=2022 |
| price | float | NO | Rental price per ride (monetary value) |
| COGS | float | NO | Cost of Goods Sold - Operating cost per ride |

---

## 📖 Appendix: Value Mappings

### Season Values
| Value | Meaning |
|-------|---------|
| 1 | Spring |
| 2 | Summer |
| 3 | Fall |
| 4 | Winter |

### Weather Situation Values
| Value | Meaning |
|-------|---------|
| 1 | Clear, Few clouds, Partly cloudy |
| 2 | Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist |
| 3 | Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds |
| 4 | Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog |

### Holiday & Working Day Indicators
| Value | Meaning |
|-------|---------|
| 0 | No (Not a holiday / Weekend) |
| 1 | Yes (Is a holiday / Working day) |

---

## 🔍 Notes

- **Data Types:** All numeric columns except `dteday` and `rider_type` are stored as nvarchar but contain numeric values
- **Year Reference:** `yr=0` = 2021, `yr=1` = 2022
- **Temperature Scale:** Values are normalized between 0-1 (actual temperature can be calculated as: temp * 41°C)
- **Row Counts:** Approximate based on hourly data collection

---

## 📝 Usage Example

```sql
-- Get total riders by season for 2022
SELECT 
    b.season,
    SUM(CAST(b.riders AS INT)) as total_riders,
    c.price * SUM(CAST(b.riders AS INT)) as revenue
FROM bike_share_yr_1 b
JOIN cost_table c ON b.yr = c.yr
WHERE b.rider_type = 'registered'
GROUP BY b.season;
