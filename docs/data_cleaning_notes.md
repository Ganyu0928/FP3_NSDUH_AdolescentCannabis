# Data Cleaning Notes for NSDUH Adolescent Cannabis Analysis
This document summarizes all data cleaning steps applied to the NSDUH 2023 dataset before analysis. The goal was to make the dataset easy to work with and remove invalid or missing cases.

## 1. Restricting the sample
- Kept only **adolescents ages 12–17**.
- Removed everyone outside this age range.

## 2. Handling missing and invalid codes
NSDUH uses special codes for invalid responses:
- 85 = bad data
- 94 = don’t know
- 97 = refused
- 98 = blank
- 99 = valid skip (if present)
Example:
na_codes <- c(85, 94, 97, 98, 99)




















