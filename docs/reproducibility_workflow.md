# Reproducibility Workflow
This document explains how reproduce the entire analysis from start to finish. All steps use the scripts and folders included in this repository.

## 1. Software and Setup
- R (version 4.3+ recommended)
- RStudio 
- Required packages:
  - tidyverse
  - haven
  - janitor
  - broom
  - car
  - lmtest
  - odds.n.ends
  - jtools
  - gtsummary
  
Install packages if needed:
install.packages(c("tidyverse", "haven", "janitor", "broom", 
                   "car", "lmtest", "jtools", "gtsummary"))

## 2. Project Folder 
The project uses a consistent folder structure for organization:
FP3_NSDUH_AdolescentCannabis:
- data_raw/
- data_clean/
_ scripts/
- output/
- docs/
- progress_logs

## 3. How to Reproduce the Analysis
Step 1: Open the project:
- Open the .Rproj file, or set your own working directory to the project root.
- The project will run when your working directory is the top-level folder.

Step 2: Run data cleaning
scripts/01_data_cleaning.R
- Imports the raw NSDUH 2023 dataset
- Restricts to ages 12–17
- Applies missing code rules
- Recodes:
    - MJDAY30A → binary outcome
    - RSKMRJWK → 4-level factor
    - IRSEX → male/female
    - AGE3 → age categories
    - YFLMJMO → peer disapproval
    - YEPMJMO → parental disapproval
- Saves cleaned dataset to data_clean/FP3_analytic_week4.RData
- When the script finishes, the cleaned dataset is ready for analysis.

Step 3: Run descriptive analysis
scripts/02_descriptive_analysis.R
- Loads the cleaned analytic dataset
- Creates frequency tables and cross-tabs
- Produces a proportional bar chart
- Saves all outputs into /output/

Step 4: Run logistic regression models
- scripts/03_logistic_modeling.R
- Unadjusted logistic regression
- Sex-adjusted logistic regression
- VIF checks
- Influence diagnostics (Cook’s D)
- Refit model after removing influential points
- Generates predicted probability plots
- Generates ROC curves
- Saves all model objects to /output/

Step 5: Run interaction model
scripts/04_interaction_model.R
- Tests effect modification by sex (RSKMRJWK * IRSEX)
- Runs likelihood ratio test comparing main-effects vs interaction model
- Produces predicted probability plots with interaction
- Saves the interaction model to /output/

## 4. Outputs Generated
After running all scripts:
/data_clean/: 
- FP3_analytic_week4.RData (the final analytic dataset)
/output/:
- Descriptive tables
- Proportional bar chart
- Model 1 (unadjusted) .rds
- Model 2 (adjusted) .rds
- Cook’s-D refit model .rds
- Interaction model .rds
- Predicted probability plots
- ROC curves

## 5. Documentation
- docs/codebook_notes.md — official NSDUH meanings
- docs/data_cleaning_notes.md — how variables were cleaned
- docs/variable_dictionary.md — final analytic variables
- progress_logs/ — Week 2–5 logs documenting project progress

## 6. Notes and Restrictions
- Raw NSDUH data cannot be uploaded to Github due to copyright restrictions.
- All scripts assume the user has the raw dataset stored locally in data_raw/.
- If any folders' names have changed, the updated file paths must show in the scripts. 
