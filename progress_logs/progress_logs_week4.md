# Week 4 Progress Log
This week I finalized the analytic dataset for completed case analysis, created updated descriptive tables, and ran the unadjusted and adjusted logistic regression models. I also generated the proportional bar chart and saved all model outputs for use in the final report.

## Tasks
- Reloaded the cleaned NSDUH dataset (nsduh_2023_clean.RData) and checked variable structures.
- Re-coded the outcome variable (MJDAY30A) as a factor with labels (“No use”, “Used”).
- Produced updated descriptive tables:
  - Frequency tables for RSKMRJWK, MJDAY30A, and IRSEX.
  - Cross-tabulation of perceived risk × marijuana use.
  - Row percentages for comparison across risk groups.
- Saved the descriptive cross-tab as table1_risk_vs_use.csv.
- Created the complete-case analytic dataset by excluding missing values in key variables.
- Fitted logistic regression models:
  - Unadjusted model: marijuana use ~ perceived risk
  - Adjusted model: added sex (IRSEX)
- Reviewed coefficient estimates and odds ratios using `summary()` and `odds.n.ends()`.
- Created a proportional bar chart showing perceived risk vs. marijuana use and saved the figure.
- Saved all model objects for reproducibility.