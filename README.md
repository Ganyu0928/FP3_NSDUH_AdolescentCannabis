# FP3_NSDUH_AdolescentCannabis
FP3 project analyzing perceived risk and marijuana use among adolescents using 2023 NSDUH data.

# FP3_NSDUH_AdolescentCannabis
This project analyzes the association between **perceived risk of marijuana use** and **past 30-day marijuana use** among U.S. adolescents (ages 12–17) using the 2023 **National Survey on Drug Use and Health (NSDUH)** dataset.  

---

## Background
Adolescent marijuana use remains stable nationally, but perceived harm has steadily declined. This project examines how perceived risk relates to recent marijuana use and evaluates whether this association differs by sex.

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

---

## Folder structure
FP3_NSDUH_AdolescentCannabis/
├── data_raw/                # Contains original NSDUH_2023.Rdata (not uploaded)
├── data_clean/              # Cleaned datasets (nsduh_2023_clean.Rdata / .csv)
├── scripts/                 # Analysis scripts 
│     ├── 01_data_cleaning.R
│     ├── 02_descriptive_analysis.R
│     ├── 03_modeling.R
│     └── 04_interaction_model.R
├── output/                  # Tables and results
├── docs/                    # PICOT, DAG, reproducibility plan, progress logs
├── progress_logs/           # Weekly logs 
└── README.md

---

## Reproduce the Analysis
1. Clone the repository
2. Open Rstudio with the project file
3. Run scripts in order: 
│     ├── 01_data_cleaning.R
│     ├── 02_descriptive_analysis.R
│     ├── 03_modeling.R
│     └── 04_interaction_model.R
4. Outputs will be saved automatically into /output/.

---

## Documentation
progress logs: /progress_logs/
PICOT, DAG, Codebook notes, Workflow: /docs/

