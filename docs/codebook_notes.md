# Codebook Notes for project NSDUH Adolescent Cannabis Analysis
- Information is referred from the NSDUH 2023 Codebook. 

## **1. MJDAY30A – Past 30-Day Marijuana Use (Outcome)**  
Original NSDUH meaning:
number of days the respondent used marijuana in the past 30 days. 
**Original NSDUH Codes**
- 1–30 = days used  
- 91 = never used  
- 93 = did not use in past 30 days  
- 94 = don’t know  
- 97 = refused  
- 98 = blank (no answer)
**Recoded codes**
- **0 = no use** (codes 91 and 93)  
- **1 = any use** (codes 1–30)  
- **NA = 94, 97, 98**

## **2. RSKMRJWK – Perceived Risk of Smoking Marijuana Weekly (Exposure)**  
Original meaning:
Risk of harm if a person smokes marijuana once or twice a week  
**Original NSDUH codes:**  
- 1 = no risk  
- 2 = slight risk  
- 3 = moderate risk  
- 4 = great risk  
- 85 = bad data  
- 94 = don’t know  
- 97 = refused  
- 98 = blank
**Recode codes:**
- **Keep codes 1–4 as a four-level categorical variable**  
- **NA = 85, 94, 97, 98**

## **3. AGE3 – Age Group (Covariate)**  
**Original meaning:** 
Adolescent age categories  
**Original NSDUH codes:**  
- 1 = ages 12–13  
- 2 = ages 14–15  
- 3 = ages 16–17
**Recode codes:**
- **Kept as 1, 2, 3 (no changes)**

## **4. IRSEX – Sex of Respondent (Covariate / Effect Modifier)** 
**Original meaning:** 
Respondent’s sex  
**Original NSDUH codes:**  
- 1 = male  
- 2 = female
**Recode codes:**
- **0 = male**  
- **1 = female**

## **5. YFLMJMO – Peer Attitudes Toward Marijuana Use (Covariate)**  
**Original meaning:** 
Close friends’ approval/disapproval of youth marijuana use  
**Original NSDUH codes:**  
- 1 = strongly/somewhat disapprove  
- 2 = neither approve nor disapprove  
- . = unknown or aged 18+
**Recode codes:**
- **1 = disapprove** (original code 1)  
- **0 = neutral/permissive** (original code 2)  
- **NA = unknown or ineligible (.)**

## **6. YEPMJMO – Parental Disapproval of Marijuana Use (Covariate)**  
**Original meaning:** 
Parents’ attitudes toward the youth smoking marijuana  
**Original NSDUH codes:**  
- 1 = neither approve nor disapprove  
- 2 = somewhat disapprove  
- 3 = strongly disapprove  
- 85 = bad data  
- 94 = don’t know  
- 97 = refused  
- 98 = blank  
- 99 = legitimate skip
**Recode codes:**
- **1 = disapprove** (codes 2 or 3)  
- **0 = neutral** (code 1)  
- **NA = 85, 94, 97, 98, 99**


