# =======================================================
# FP3 Project: Perceived Risk and Marijuana Use (NSDUH 2023)
# Script: 02_descriptive_analysis.R
# Purpose: Descriptive and bivariate analysis (Week 3)
# =======================================================

# 1. Load the data -----------------------------------------------------------
load("/Users/ganyuliu/Desktop/FA2025/6009/assignment-1-RQ/NSDUH_2023.Rdata")

# Check dataset
summary(data_clean)
head(data_clean)

# 2. Frequency tables for each variable -------------------------------------
# Perceived risk of smoking marijuana once/twice a week
table(data_clean$RSKMRJWK, useNA = "ifany")

# Marijuana use in the past 30 days (0 = no, 1 = yes)
table(data_clean$MJDAY30A, useNA = "ifany")

# Sex (0 = male, 1 = female)
table(data_clean$IRSEX, useNA = "ifany")

# 3. Bivariate (cross-tabulation) -------------------------------------------
# Relationship between perceived risk and 30-day marijuana use
table(data_clean$RSKMRJWK, data_clean$MJDAY30A)

# Optional: Cross-tab by sex
table(data_clean$RSKMRJWK, data_clean$MJDAY30A, data_clean$IRSEX)

# 4. Save main descriptive output -------------------------------------------
# Convert to a simple table and export as CSV
write.csv(as.data.frame(table(data_clean$RSKMRJWK, data_clean$MJDAY30A)),
          "output/descriptive_table1.csv", row.names = FALSE)

# Optional: save stratified by sex
write.csv(as.data.frame(table(data_clean$RSKMRJWK, data_clean$MJDAY30A, data_clean$IRSEX)),
          "output/descriptive_table2.csv", row.names = FALSE)
