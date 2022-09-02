#Load Hmisc library
library(Hmisc)
library(tidyverse)
#Read Data
uhype=read.csv('UHype-CostExposure_DATA_2022-09-01_0358.csv')
#Setting Labels

#uhype <- 
uhype <- (uhype %>% 
  filter(redcap_repeat_instrument == "") %>% 
  select(-c(providers_comment___1:current_med___13), -contains("redcap"))) %>% 
  full_join(
     uhype %>% 
  filter(redcap_repeat_instrument != "") %>% 
  select(id, c(providers_comment___1:current_med___13)) %>% 
  pivot_longer(-id) %>% 
  filter(value >= 0) %>% 
  pivot_wider(id_cols = id, names_from = name, values_from = value, values_fn = max)
  ) %>% 
 rowwise() %>% 
  mutate(
    comorbidity = sum(across(chronic_med___1 : chronic_med___14), na.rm = T),
    multidrug = sum(across(contains("current_med")), na.rm = T),
    worry = sum(across(hpt_reactions___1: hpt_reactions___7)),
    safe =  sum(across(hpt_reactions___8:hpt_reactions___10))
  ) %>% 
  ungroup() %>% 
  mutate(
    comob = if_else(comorbidity > 2, 3L, comorbidity),
    comob = factor(comob, levels = 0:3, labels = c("None", "One", "Two", "More than 2")),
    drugs = if_else(multidrug > 2, 3L, multidrug),
    drugs = factor(drugs, labels = c("No", "One", "Two", "More than 2"), levels = 0:3),
    related = chronic_med___1 + chronic_med___2 + chronic_med___3 + chronic_med___4,
    related = if_else(related > 1, 1L, related),
    related = factor(related, labels = c("Yes", "No"), levels = 1:0),
    feeling = (safe/3) >= (worry/7),
    feeling = factor(feeling, labels = c("Postive", "Negative"), levels = c(T,F))
  ) 

#Setting Factors(will create new variable for factors)
uhype$sex = factor(uhype$sex,levels=c("1","2"))
uhype$relationship = factor(uhype$relationship,levels=c("1","2","3","4","5"))
uhype$occup = factor(uhype$occup,levels=c("1","0"))
uhype$occup_type = factor(uhype$occup_type,levels=c("1","2"))
uhype$no_occup = factor(uhype$no_occup,levels=c("1","8","2","3","4","5","6","7"))
uhype$educ = factor(uhype$educ,levels=c("1","2","3","4","5","6","7","8","9","10","11"))
uhype$insurance = factor(uhype$insurance,levels=c("1","0"))
uhype$insurance_type___1 = factor(uhype$insurance_type___1,levels=c("0","1"))
uhype$insurance_type___2 = factor(uhype$insurance_type___2,levels=c("0","1"))
uhype$insurance_type___3 = factor(uhype$insurance_type___3,levels=c("0","1"))
uhype$insurance_type___4 = factor(uhype$insurance_type___4,levels=c("0","1"))
uhype$detained_12mths = factor(uhype$detained_12mths,levels=c("1","0"))
uhype$mbp___1 = factor(uhype$mbp___1,levels=c("0","1"))
uhype$mbp___2 = factor(uhype$mbp___2,levels=c("0","1"))
uhype$mbp___3 = factor(uhype$mbp___3,levels=c("0","1"))
uhype$mbp___4 = factor(uhype$mbp___4,levels=c("0","1"))
uhype$hpt_relative = factor(uhype$hpt_relative,levels=c("1","2","0"))
uhype$med_hsp = factor(uhype$med_hsp,levels=c("1","2","0"))
uhype$bp_meds___1 = factor(uhype$bp_meds___1,levels=c("0","1"))
uhype$bp_meds___2 = factor(uhype$bp_meds___2,levels=c("0","1"))
uhype$bp_meds___3 = factor(uhype$bp_meds___3,levels=c("0","1"))
uhype$bp_meds_buy = factor(uhype$bp_meds_buy,levels=c("1","2"))
uhype$lab_test = factor(uhype$lab_test,levels=c("0","1"))
uhype$insu_bp_visit = factor(uhype$insu_bp_visit,levels=c("1","0"))
uhype$ins_type___1 = factor(uhype$ins_type___1,levels=c("0","1"))
uhype$ins_type___2 = factor(uhype$ins_type___2,levels=c("0","1"))
uhype$ins_type___3 = factor(uhype$ins_type___3,levels=c("0","1"))
uhype$ins_type___4 = factor(uhype$ins_type___4,levels=c("0","1"))
uhype$same_doctor = factor(uhype$same_doctor,levels=c("0","1","2","3","4"))
uhype$hpt_special_clinic = factor(uhype$hpt_special_clinic,levels=c("1","0","2"))
uhype$med_runout = factor(uhype$med_runout,levels=c("0","1","2","3","4"))
uhype$financial_difficulties = factor(uhype$financial_difficulties,levels=c("1","0"))
uhype$diff_get_drugs = factor(uhype$diff_get_drugs,levels=c("1","2","3"))
uhype$meds_concern = factor(uhype$meds_concern,levels=c("1","0"))
uhype$meds_concern_reason = factor(uhype$meds_concern_reason,levels=c("1","2","3","4","5"))
uhype$herbs_for_hpt = factor(uhype$herbs_for_hpt,levels=c("1","0"))
uhype$special_diet = factor(uhype$special_diet,levels=c("1","0"))
uhype$mea_bpm = factor(uhype$mea_bpm,levels=c("1","0"))
uhype$bp_counsel_other_staff = factor(uhype$bp_counsel_other_staff,levels=c("0","1","2","3","4"))
uhype$miss_appoint = factor(uhype$miss_appoint,levels=c("0","1","2","3","4"))
uhype$reasons_for_herbs = factor(uhype$reasons_for_herbs,levels=c("1","2","3","4","5"))
uhype$dietician = factor(uhype$dietician,levels=c("1","0"))
uhype$health_rate = factor(uhype$health_rate,levels=c("5","4","3","2","1"))
uhype$health_rate_after_1yr = factor(uhype$health_rate_after_1yr,levels=c("5","4","3","2","1"))
uhype$hpt_reactions___1 = factor(uhype$hpt_reactions___1,levels=c("0","1"))
uhype$hpt_reactions___2 = factor(uhype$hpt_reactions___2,levels=c("0","1"))
uhype$hpt_reactions___3 = factor(uhype$hpt_reactions___3,levels=c("0","1"))
uhype$hpt_reactions___4 = factor(uhype$hpt_reactions___4,levels=c("0","1"))
uhype$hpt_reactions___5 = factor(uhype$hpt_reactions___5,levels=c("0","1"))
uhype$hpt_reactions___6 = factor(uhype$hpt_reactions___6,levels=c("0","1"))
uhype$hpt_reactions___7 = factor(uhype$hpt_reactions___7,levels=c("0","1"))
uhype$hpt_reactions___8 = factor(uhype$hpt_reactions___8,levels=c("0","1"))
uhype$hpt_reactions___9 = factor(uhype$hpt_reactions___9,levels=c("0","1"))
uhype$hpt_reactions___10 = factor(uhype$hpt_reactions___10,levels=c("0","1"))
uhype$providers_comment___1 = factor(uhype$providers_comment___1,levels=c("0","1"))
uhype$providers_comment___2 = factor(uhype$providers_comment___2,levels=c("0","1"))
uhype$providers_comment___3 = factor(uhype$providers_comment___3,levels=c("0","1"))
uhype$providers_comment___4 = factor(uhype$providers_comment___4,levels=c("0","1"))
uhype$providers_comment___5 = factor(uhype$providers_comment___5,levels=c("0","1"))
uhype$chronic_med___1 = factor(uhype$chronic_med___1,levels=c("0","1"))
uhype$chronic_med___2 = factor(uhype$chronic_med___2,levels=c("0","1"))
uhype$chronic_med___3 = factor(uhype$chronic_med___3,levels=c("0","1"))
uhype$chronic_med___4 = factor(uhype$chronic_med___4,levels=c("0","1"))
uhype$chronic_med___5 = factor(uhype$chronic_med___5,levels=c("0","1"))
uhype$chronic_med___6 = factor(uhype$chronic_med___6,levels=c("0","1"))
uhype$chronic_med___7 = factor(uhype$chronic_med___7,levels=c("0","1"))
uhype$chronic_med___8 = factor(uhype$chronic_med___8,levels=c("0","1"))
uhype$chronic_med___9 = factor(uhype$chronic_med___9,levels=c("0","1"))
uhype$chronic_med___10 = factor(uhype$chronic_med___10,levels=c("0","1"))
uhype$chronic_med___11 = factor(uhype$chronic_med___11,levels=c("0","1"))
uhype$chronic_med___12 = factor(uhype$chronic_med___12,levels=c("0","1"))
uhype$chronic_med___13 = factor(uhype$chronic_med___13,levels=c("0","1"))
uhype$chronic_med___14 = factor(uhype$chronic_med___14,levels=c("0","1"))
uhype$current_med___1 = factor(uhype$current_med___1,levels=c("0","1"))
uhype$current_med___2 = factor(uhype$current_med___2,levels=c("0","1"))
uhype$current_med___3 = factor(uhype$current_med___3,levels=c("0","1"))
uhype$current_med___4 = factor(uhype$current_med___4,levels=c("0","1"))
uhype$current_med___5 = factor(uhype$current_med___5,levels=c("0","1"))
uhype$current_med___6 = factor(uhype$current_med___6,levels=c("0","1"))
uhype$current_med___7 = factor(uhype$current_med___7,levels=c("0","1"))
uhype$current_med___8 = factor(uhype$current_med___8,levels=c("0","1"))
uhype$current_med___9 = factor(uhype$current_med___9,levels=c("0","1"))
uhype$current_med___10 = factor(uhype$current_med___10,levels=c("0","1"))
uhype$current_med___11 = factor(uhype$current_med___11,levels=c("0","1"))
uhype$current_med___12 = factor(uhype$current_med___12,levels=c("0","1"))
uhype$current_med___13 = factor(uhype$current_med___13,levels=c("0","1"))

levels(uhype$sex)=c("Female","Male")
levels(uhype$relationship)=c("Single","Married","Separated","Co-habiting","Widowed")
levels(uhype$occup)=c("Yes","No")
levels(uhype$occup_type)=c("Formal sector","Informal sector")
levels(uhype$no_occup)=c("Student","Unemployed","Retired","Ill-health","Lack of interest in working","No reason to work","Legal reason","Other")
levels(uhype$educ)=c("None or did not complete primary","Completed primary","Completed JHS","Completed SHS","Post-secondary Certificate or Diploma","Completed college","Technical","Vocational","O level","A level","Form 4")
levels(uhype$insurance)=c("Yes","No")
levels(uhype$insurance_type___1)=c("No","Yes")
levels(uhype$insurance_type___2)=c("No","Yes")
levels(uhype$insurance_type___3)=c("No","Yes")
levels(uhype$insurance_type___4)=c("No","Yes")
levels(uhype$detained_12mths)=c("Yes","No")
levels(uhype$mbp___1)=c("No","Yes")
levels(uhype$mbp___2)=c("No","Yes")
levels(uhype$mbp___3)=c("No","Yes")
levels(uhype$mbp___4)=c("No","Yes")
levels(uhype$hpt_relative)=c("Yes","I dont know","No")
levels(uhype$med_hsp)=c("Yes (All of them)","Yes (Some of them)","No")
levels(uhype$bp_meds___1)=c("No","Yes")
levels(uhype$bp_meds___2)=c("No","Yes")
levels(uhype$bp_meds___3)=c("No","Yes")
levels(uhype$bp_meds_buy)=c("Yes","No")
levels(uhype$lab_test)=c("No","Yes")
levels(uhype$insu_bp_visit)=c("Yes","No")
levels(uhype$ins_type___1)=c("No","Yes")
levels(uhype$ins_type___2)=c("No","Yes")
levels(uhype$ins_type___3)=c("No","Yes")
levels(uhype$ins_type___4)=c("No","Yes")
levels(uhype$same_doctor)=c("Never","Few times","Some times","Most times","All times")
levels(uhype$hpt_special_clinic)=c("Yes","No","I dont know")
levels(uhype$med_runout)=c("Never","Few times","Some times","Most times","All times")
levels(uhype$financial_difficulties)=c("Yes","No")
levels(uhype$diff_get_drugs)=c("Less than half the time","About half the time","All the time")
levels(uhype$meds_concern)=c("Yes","No")
levels(uhype$meds_concern_reason)=c("Reactions to drugs","Frequently forget","No improvement","I Have been told it is not safe to take it all the time","Other")
levels(uhype$herbs_for_hpt)=c("Yes","No")
levels(uhype$special_diet)=c("Yes","No")
levels(uhype$mea_bpm)=c("Yes","No")
levels(uhype$bp_counsel_other_staff)=c("Never","Few times","Some times","Most times","All times")
levels(uhype$miss_appoint)=c("Never","Few times","Some times","Most times","All times")
levels(uhype$reasons_for_herbs)=c("Advice from friends and relatives","Advertisement on mass media","Self decision","Advice from health professionals","Other reasons")
levels(uhype$dietician)=c("Yes","No")
levels(uhype$health_rate)=c("Excellent","Very Good","Good","Fair","Poor")
levels(uhype$health_rate_after_1yr)=c("Much better now than one year ago","Somewhat better now than one year ago","About the same","Somewhat worse now than one year ago","Much worse than one year ago")
levels(uhype$hpt_reactions___1)=c("No","Yes")
levels(uhype$hpt_reactions___2)=c("No","Yes")
levels(uhype$hpt_reactions___3)=c("No","Yes")
levels(uhype$hpt_reactions___4)=c("No","Yes")
levels(uhype$hpt_reactions___5)=c("No","Yes")
levels(uhype$hpt_reactions___6)=c("No","Yes")
levels(uhype$hpt_reactions___7)=c("No","Yes")
levels(uhype$hpt_reactions___8)=c("No","Yes")
levels(uhype$hpt_reactions___9)=c("No","Yes")
levels(uhype$hpt_reactions___10)=c("No","Yes")
levels(uhype$providers_comment___1)=c("No","Yes")
levels(uhype$providers_comment___2)=c("No","Yes")
levels(uhype$providers_comment___3)=c("No","Yes")
levels(uhype$providers_comment___4)=c("No","Yes")
levels(uhype$providers_comment___5)=c("No","Yes")
levels(uhype$chronic_med___1)=c("No","Yes")
levels(uhype$chronic_med___2)=c("No","Yes")
levels(uhype$chronic_med___3)=c("No","Yes")
levels(uhype$chronic_med___4)=c("No","Yes")
levels(uhype$chronic_med___5)=c("No","Yes")
levels(uhype$chronic_med___6)=c("No","Yes")
levels(uhype$chronic_med___7)=c("No","Yes")
levels(uhype$chronic_med___8)=c("No","Yes")
levels(uhype$chronic_med___9)=c("No","Yes")
levels(uhype$chronic_med___10)=c("No","Yes")
levels(uhype$chronic_med___11)=c("No","Yes")
levels(uhype$chronic_med___12)=c("No","Yes")
levels(uhype$chronic_med___13)=c("No","Yes")
levels(uhype$chronic_med___14)=c("No","Yes")
levels(uhype$current_med___1)=c("No","Yes")
levels(uhype$current_med___2)=c("No","Yes")
levels(uhype$current_med___3)=c("No","Yes")
levels(uhype$current_med___4)=c("No","Yes")
levels(uhype$current_med___5)=c("No","Yes")
levels(uhype$current_med___6)=c("No","Yes")
levels(uhype$current_med___7)=c("No","Yes")
levels(uhype$current_med___8)=c("No","Yes")
levels(uhype$current_med___9)=c("No","Yes")
levels(uhype$current_med___10)=c("No","Yes")
levels(uhype$current_med___11)=c("No","Yes")
levels(uhype$current_med___12)=c("No","Yes")
levels(uhype$current_med___13)=c("No","Yes")

uhype <- uhype %>% 
  mutate(
    relationship = 
      fct_collapse(
        relationship, 
        "Single" = c("Separated", "Widowed"),
        "Partnership" = c("Co-habiting", "Married")
      ),
    no_occup = fct_lump_min(no_occup, min = 50),
    educ = fct_collapse(
      educ,
      "Primary school and JHS" = c("Completed JHS", "Completed primary"),
      "Senior/Technical/Vocation/Middle school" = c("Completed SHS", "Vocational", "O level", "A level", "Form 4", "Technical"),
      "Tertiary" = "Completed college"
    )
  )

label(uhype$id)="Record ID"
label(uhype$site)="Site"
label(uhype$age)="Age"
label(uhype$sex)="Sex"
label(uhype$relationship)="Marital Status"
label(uhype$occup)="Do you work"
label(uhype$occup_type)="Type of work"
label(uhype$no_occup)="Reason for not working"
label(uhype$no_occp_1)="Reason for not working"
label(uhype$educ)="Highest education"
label(uhype$insurance)="Health insurance"
label(uhype$insurance_type___1)="NHIS"
label(uhype$insurance_type___2)="Private insurance"
label(uhype$insurance_type___3)="Employer-paid program"
label(uhype$insurance_type___4)="Other"
label(uhype$detained_12mths)="Admission due to HBP"
label(uhype$mbp___1)="BP machine at home"
label(uhype$mbp___2)="Neighborhood facility"
label(uhype$mbp___3)="Pharmacy shop"
label(uhype$mbp___4)="Street vendors with BP apparatus"
label(uhype$hpt_relative)="Family history"
label(uhype$med_hsp)="Took medications today"
label(uhype$bp_meds___1)="All supplied with insurance"
label(uhype$bp_meds___2)="Partly supplied with insurance"
label(uhype$bp_meds___3)="Out of pocket payment"
label(uhype$bp_meds_buy)="Are BP medication financially burdening"
label(uhype$lab_test)="Are lab costs financially burdening"
label(uhype$insu_bp_visit)="Usage of insurance during facility visits"
label(uhype$ins_type___1)="NHIS"
label(uhype$ins_type___2)="Private insurance"
label(uhype$ins_type___3)="Employer-paid program"
label(uhype$ins_type___4)="Other"
label(uhype$facilities_attended)="Number of facilities used for healthcare"
label(uhype$more_than_1_facility)="Facilities providing BP meds"
label(uhype$same_doctor)="Same doctor"
label(uhype$hpt_special_clinic)="Special clinics"
label(uhype$med_runout)="Stock outs"
label(uhype$financial_difficulties)="Financial difficulties acquiring medication"
label(uhype$diff_get_drugs)="Frequency of financial difficulty"
label(uhype$meds_concern)="Concerns about drugs"
label(uhype$meds_concern_reason)="Concerns"
label(uhype$assistance)="If other, kindly specify"
label(uhype$herbs_for_hpt)="Herbal Medications"
label(uhype$special_diet)="Special diet for BP control"
label(uhype$mea_bpm)="Measure BP between visits"
label(uhype$bp_check_month)="BP checks in a month"
label(uhype$bp_counsel_other_staff)="HCW counseling"
label(uhype$miss_appoint)="Missed appointments"
label(uhype$hpt_follow_up)="Distance to facility (km)"
label(uhype$reasons_for_herbs)="Reason for herbal"
label(uhype$dietician)="Dieticiand for BP control"
label(uhype$health_rate)="State of health"
label(uhype$health_rate_after_1yr)="State of health a year ago"
label(uhype$hpt_reactions___1)="Worried about stroke"
label(uhype$hpt_reactions___2)="Worried about heart attack"
label(uhype$hpt_reactions___3)="Worried about diabetes"
label(uhype$hpt_reactions___4)="Worried about blindness"
label(uhype$hpt_reactions___5)="Worried about kidney problems"
label(uhype$hpt_reactions___6)="Worried about death"
label(uhype$hpt_reactions___7)= "Sadness"
label(uhype$hpt_reactions___8)="Not worried"
label(uhype$hpt_reactions___9)="Not worried due to controlled BP"
label(uhype$hpt_reactions___10)="Not worried due to regula check-up"
label(uhype$providers_comment___1)="Controlled BP"
label(uhype$providers_comment___2)="Uncontrolled"
label(uhype$providers_comment___3)="Medication non-adherence"
label(uhype$providers_comment___4)="None"
label(uhype$providers_comment___5)="Others"
label(uhype$chronic_med___1)="Diabetes"
label(uhype$chronic_med___2)="Chronic Kidney Disease"
label(uhype$chronic_med___3)="Heart Failure"
label(uhype$chronic_med___4)="Stroke"
label(uhype$chronic_med___5)="Dementia"
label(uhype$chronic_med___6)="Irregular heartbeat"
label(uhype$chronic_med___7)="Prostate disease"
label(uhype$chronic_med___8)="Coronary Artery Disease"
label(uhype$chronic_med___9)="Hyperlipidemia"
label(uhype$chronic_med___10)="Chronic Pain"
label(uhype$chronic_med___11)="Asthma"
label(uhype$chronic_med___12)="Sickle cell"
label(uhype$chronic_med___13)="None"
label(uhype$chronic_med___14)="Others"
label(uhype$current_med___1)="Amlodipine"
label(uhype$current_med___2)="Lisinopril"
label(uhype$current_med___3)="Losartan"
label(uhype$current_med___4)="Bendroflumethiazide"
label(uhype$current_med___5)="HCTZ"
label(uhype$current_med___6)="Atenolol"
label(uhype$current_med___7)="Bisoprolol"
label(uhype$current_med___8)="Methyldopa"
label(uhype$current_med___9)="Furosemide"
label(uhype$current_med___10)="Hydralazine"
label(uhype$current_med___11)="Nifedipine"
label(uhype$current_med___12)="Others"
label(uhype$current_med___13)="Aspirin"
label(uhype$provider_comment_reason)="If other, specify"
label(uhype$others)="If others, please specify"
label(uhype$related)="HBP related morbidities"
label(uhype$comob)="Presence of a comorbidity"
label(uhype$comorbidity)="Number of comorbidities"
label(uhype$multidrug)="Number of medications"
label(uhype$drugs)="Multi-drug treatment"
label(uhype$safe)="Feeling of safety"
label(uhype$worry)="Worried about condtion"
label(uhype$feeling)="Computed general feeling"
#Setting Units