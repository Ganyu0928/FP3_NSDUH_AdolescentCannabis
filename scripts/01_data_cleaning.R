# =======================================================
# Project: Perceived Risk and Marijuana Use (NSDUH 2023)
# Script: 01_data_cleaning.R
# Purpose: Keep only key variables and recode them for analysis (Week 2)
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
  select(RSKMRJWK, MJDAY30A, IRSEX, AGE3,
         YEPMJMO, YFLMJMO, NEWRACE2)

# 4. Keeping only adolescents age 12-17
data_clean <- data_clean %>%
  filter(AGE3 %in% c(1,2,3))

# 5. Recode marijuana use (MJDAY30A)
# Recode MJDAY30A: 1–30 = any use (1), 91/93 = no use (0), 94/97/98 = missing
# 91 = never used marijuana; 93 = did not use in past 30 days
# 94/97/98 = missing or refused
data_clean <- data_clean %>%
  mutate(
    MJDAY30A = case_when(
      MJDAY30A %in% c(91, 93) ~ 0,  # no use
      MJDAY30A %in% 1:30 ~ 1,       # any use
      MJDAY30A %in% c(94,97,98) ~ NA_real_
    )
  )

# 6. Recode RSKMRJWK (perceived risk)
data_clean <- data_clean %>%
  mutate(
    RSKMRJWK = ifelse(RSKMRJWK %in% c(85,94,97,98), NA, RSKMRJWK),
    RSKMRJWK = factor(RSKMRJWK,
                      levels=c(1,2,3,4),
                      labels=c("No risk","Slight risk","Moderate risk","Great risk"))
  )

# 7. Recode IRSEX (sex at birth)
data_clean <- data_clean %>%
  mutate(
    IRSEX = factor(IRSEX,
                   levels=c(1,2),
                   labels=c("Male","Female"))
  )

# 8. Recode YEPMJMO (parent disapproval)
data_clean <- data_clean %>%
  mutate(
    YEPMJMO = case_when(
      YEPMJMO %in% c(2,3) ~ 1,                # disapprove
      YEPMJMO == 1 ~ 0,                       # neutral
      YEPMJMO %in% c(85,94,97,98,99) ~ NA_real_
    )
  )

# 9. Recode YFLMJMO (peer disapproval)
data_clean <- data_clean %>%
  mutate(
    YFLMJMO = case_when(
      YFLMJMO == 1 ~ 1,   # disapprove
      YFLMJMO == 2 ~ 0,   # neutral/permissive
      TRUE ~ NA_real_
    )
  )

# 10. Save the cleaned dataset
save(data_clean, file = "data_clean/nsduh_2023_clean.Rdata")
write.csv(data_clean, "data_clean/nsduh_2023_clean.csv", row.names = FALSE)

# 11. Quick check
summary(data_clean)
table(data_clean$MJDAY30A, useNA = "ifany")
table(data_clean$RSKMRJWK, useNA = "ifany")

