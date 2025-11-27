# =======================================================
# Project: Perceived Risk and Marijuana Use (NSDUH 2023)
# Script: 02_descriptive_analysis.R
# Purpose: Descriptive and bivariate analysis (Week 3)
# =======================================================

# 1. Load dataset
load("data_clean/nsduh_2023_clean.Rdata")

# Check that the object exists
ls() # data/ data_clean/ nsduh_2023_raw

# Optional: view first few rows
str(data_clean)
head(data_clean)

# 2. Frequency table
# Perceived risk (RSKMRJWK)
table(data_clean$RSKMRJWK, useNA = "ifany")

# 30-day marijuana use (MJDAY30A: 0 = No, 1 = Yes)
table(data_clean$MJDAY30A, useNA = "ifany")

# Sex (IRSEX: 0 = Male, 1 = Female)
table(data_clean$IRSEX, useNA = "ifany")

# 3. Cross-tabulations  -
# Perceived risk × marijuana use
risk_use <- table(data_clean$RSKMRJWK, data_clean$MJDAY30A)
risk_use

# Row percentages
round(prop.table(risk_use, margin = 1)* 100, 1)

# Perceived risk × marijuana use × sex (optional)
risk_use_sex <- with(data_clean, table(RSKMRJWK, MJDAY30A, IRSEX))
risk_use_sex

# 4. Save results to /output -
write.csv(as.data.frame(risk_use),
          "output/descriptive_table1.csv",
          row.names = FALSE)

write.csv(as.data.frame(risk_use_sex),
          "output/descriptive_table2.csv",
          row.names = FALSE)
