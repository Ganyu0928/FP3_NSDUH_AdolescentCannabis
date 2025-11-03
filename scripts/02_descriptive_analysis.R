# =======================================================
# FP3 Project: Perceived Risk and Marijuana Use (NSDUH 2023)
# Script: 02_descriptive_analysis.R
# Purpose: Descriptive and bivariate analysis (Week 3)
# =======================================================

# 1. Load dataset
load("data_clean/nsduh_2023_clean.Rdata")

# Check that the object exists
ls() # data/ data_clean/ nsduh_2023_raw

# Optional: view first few rows
head(data_clean)
# RSK 1,1,3...; MJDAY 0,0,0,; IRSEX 1,1,2,

# 2. Frequency table
# Perceived risk (RSKMRJWK)
table(data_clean$RSKMRJWK, useNA = "ifany")
# 1     2     3     4    85    94    97    98 
# 12735 17167 13234 12624     2   666    82   195 

# 30-day marijuana use (MJDAY30A: 0 = No, 1 = Yes)
table(data_clean$MJDAY30A, useNA = "ifany")
#    0     1  <NA> 
# 46686  9660   359 

# Sex (IRSEX: 0 = Male, 1 = Female)
table(data_clean$IRSEX, useNA = "ifany")
# 1     2 
# 26145 30560 

# 3. Cross-tabulations  -
# Perceived risk × marijuana use
risk_use <- table(data_clean$RSKMRJWK, data_clean$MJDAY30A)
risk_use
#          0     1
# 1   7614  4983
# 2  13531  3522
# 3  12298   877
# 4  12374   222
# 85     1     1
# 94   638    18
# 97    70     4
# 98   160    33

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
