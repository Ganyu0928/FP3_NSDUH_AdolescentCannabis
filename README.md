# FP3_NSDUH_AdolescentCannabis
FP3 project analyzing perceived risk and marijuana use among adolescents using 2023 NSDUH data.

# FP3_NSDUH_AdolescentCannabis
This project analyzes the association between **perceived risk of marijuana use** and **past 30-day marijuana use** among U.S. adolescents (ages 12–17) using the 2023 **National Survey on Drug Use and Health (NSDUH)** dataset.  

---

## Background
Research has shown that adolescents’ perceptions of the risk of using marijuana are closely related to their likelihood of use. However, few recent studies have examined this association using nationally representative data collected after widespread legalization and shifting attitudes toward cannabis.

---

## Objectives
1. **Primary Objective:** Examine the association between reporting little or no perceived risk of smoking marijuana once or twice a week and any 30-day marijuana use among adolescents.  
2. **Secondary Objective:** Examine whether this relationship differs by **sex**, testing an interaction between perceived risk and gender.

---

## Data Source
- **Dataset:** 2023 National Survey on Drug Use and Health (NSDUH)
- **Source:** [SAMHSA NSDUH Data Files](https://www.samhsa.gov/data/data-we-collect/nsduh-national-survey-drug-use-and-health/datafiles)
- **Variables:**  
  - `RSKMRJWK` – Perceived risk of smoking marijuana once or twice a week  
  - `MJDAY30A` – Marijuana use in past 30 days  
  - `IRSEX` – Respondent’s sex  
  
## Folder structure
FP3_NSDUH_AdolescentCannabis/
├── data_raw/                # Contains original NSDUH_2023.Rdata (not uploaded)
├── data_clean/              # Cleaned datasets (nsduh_2023_clean.Rdata / .csv)
├── scripts/                 # Analysis scripts (ordered 00–05)
│     ├── 00_setup.R
│     ├── 01_data_cleaning.R
│     ├── 02_descriptive_analysis.R
│     ├── 03_modeling.R
│     └── 04_interaction_model.R
├── output/                  # Tables and results
├── docs/                    # PICOT, DAG, reproducibility plan, progress logs
└── README.md

## Analysis Scripts
Analysis Scripts
01_data_cleaning.R

Imports NSDUH data, applies initial cleaning, recodes needed variables, and produces the first analytic dataset.

02_descriptive_analysis.R

Runs descriptive summaries for demographic variables, perceived risk categories, and marijuana use, including frequency tables and cross-tabulations.

03_modeling.R

Contains all inferential models:

unadjusted logistic regression

adjusted logistic regression with covariates
Outputs include regression tables and model summary files.

## Progress Logs (Weeks 2–4)
Week 2 Progress Log

This week I imported the raw 2023 NSDUH data and began initial data. I reviewed the codebook, identified required variables for the exposure, outcome, and covariates, and outlined the cleaning plan for the analytic dataset. I also drafted the PICOT question, confirmed the inclusion criteria (adolescents ages 12–17), and created the preliminary folder structure for the GitHub repository in preparation for subsequent weeks.

Week 3 Progress Log

During Week 3, I completed the majority of the data cleaning steps and finalized the operational definitions for perceived risk, marijuana use, and demographic variables. I recoded the NSDUH missing-value codes, created initial descriptive summaries, and verified that the cleaned dataset matched expected sample sizes. I added the cleaned dataset to the GitHub repository and updated the project structure to ensure reproducibility.

Week 4 Progress Log

This week I finalized the analytic dataset and completed descriptive and bivariate analyses. I generated frequency tables, cross-tabulations, and a proportional bar chart illustrating the inverse association between perceived risk and marijuana use. I ran both unadjusted and adjusted logistic regression models, with results showing a strong negative association between perceived risk and marijuana use. All tables, figures, and model outputs were added to GitHub, and the Week 4 analytic dataset was saved for use in Week 5 modeling.

## Reproducibility Workflow
