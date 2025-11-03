# =======================================================
# FP3 Project: Perceived Risk and Marijuana Use (NSDUH 2023)
# Script: 01_data_cleaning.R
# Purpose: Keep only key variables and recode them for analysis
# =======================================================

# 1. Load needed package
library(dplyr)

# 2. Load raw dataset
load("/Users/ganyuliu/Desktop/FA2025/6009/assignment-1-RQ/NSDUH_2023.Rdata")
load("data_raw/NSDUH_2023.Rdata")

# Check what object loaded
ls()   # should show "data"

# If the object is named "data", rename it
nsduh_2023_raw <- data

# 3. Select the three variables
data_clean <- nsduh_2023_raw %>%
  select(RSKMRJWK, MJDAY30A, IRSEX)

# 4. Recode marijuana use (MJDAY30A)
# Recode MJDAY30A: 1–30 = any use (1), 91/93 = no use (0), 94/97/98 = missing
# 91 = never used marijuana; 93 = did not use in past 30 days
# 94/97/98 = missing or refused
data_clean <- data_clean %>%
  mutate(
    MJDAY30A = case_when(
      MJDAY30A %in% c(91, 93) ~ 0,
      MJDAY30A %in% 1:30 ~ 1,
      TRUE ~ NA_real_
    )
  )

# 5. Save the cleaned dataset
save(data_clean, file = "data_clean/nsduh_2023_clean.Rdata")
write.csv(data_clean, "data_clean/nsduh_2023_clean.csv", row.names = FALSE)

# 6. Quick check
summary(data_clean)
table(data_clean$MJDAY30A, useNA = "ifany")
