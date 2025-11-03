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
├── data_raw/ # Contains original NSDUH_2023.Rdata
├── data_clean/ # Cleaned datasets (nsduh_2023_clean.Rdata / .csv)
├── scripts/ # Analysis scripts (01_data_cleaning.R, 02_descriptive_analysis.R)
├── output/ # Tables and results (e.g., descriptive_table1.csv)
└── README.md # Project documentation

