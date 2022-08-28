#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
uhype=read.csv('UHype-CostExposure_DATA_2022-08-23_2337.csv')

#Setting Units


#Setting Factors(will create new variable for factors)
uhype$redcap_repeat_instrument = factor(uhype$redcap_repeat_instrument,levels=c("patients_chart_review"))
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
uhype$chd_hpt = factor(uhype$chd_hpt,levels=c("1","0"))
uhype$comorbs___0 = factor(uhype$comorbs___0,levels=c("0","1"))
uhype$comorbs___1 = factor(uhype$comorbs___1,levels=c("0","1"))
uhype$comorbs___2 = factor(uhype$comorbs___2,levels=c("0","1"))
uhype$comorbs___3 = factor(uhype$comorbs___3,levels=c("0","1"))
uhype$comorbs___4 = factor(uhype$comorbs___4,levels=c("0","1"))
uhype$comorbs___5 = factor(uhype$comorbs___5,levels=c("0","1"))
uhype$comorbs___6 = factor(uhype$comorbs___6,levels=c("0","1"))
uhype$comorbs___7 = factor(uhype$comorbs___7,levels=c("0","1"))
uhype$comorbs___8 = factor(uhype$comorbs___8,levels=c("0","1"))
uhype$comorbs___9 = factor(uhype$comorbs___9,levels=c("0","1"))
uhype$comorbs___10 = factor(uhype$comorbs___10,levels=c("0","1"))
uhype$comorbs___11 = factor(uhype$comorbs___11,levels=c("0","1"))
uhype$comorbs___12 = factor(uhype$comorbs___12,levels=c("0","1"))
uhype$hpt_meds = factor(uhype$hpt_meds,levels=c("1","0"))
uhype$meds___1 = factor(uhype$meds___1,levels=c("0","1"))
uhype$meds___2 = factor(uhype$meds___2,levels=c("0","1"))
uhype$meds___3 = factor(uhype$meds___3,levels=c("0","1"))
uhype$meds___4 = factor(uhype$meds___4,levels=c("0","1"))
uhype$meds___5 = factor(uhype$meds___5,levels=c("0","1"))
uhype$meds___6 = factor(uhype$meds___6,levels=c("0","1"))
uhype$meds___7 = factor(uhype$meds___7,levels=c("0","1"))
uhype$meds___8 = factor(uhype$meds___8,levels=c("0","1"))
uhype$meds___9 = factor(uhype$meds___9,levels=c("0","1"))
uhype$meds___10 = factor(uhype$meds___10,levels=c("0","1"))
uhype$meds___11 = factor(uhype$meds___11,levels=c("0","1"))
uhype$meds___12 = factor(uhype$meds___12,levels=c("0","1"))
uhype$meds___13 = factor(uhype$meds___13,levels=c("0","1"))
uhype$meds___14 = factor(uhype$meds___14,levels=c("0","1"))
uhype$med_hsp = factor(uhype$med_hsp,levels=c("1","2","0"))
uhype$no_meds_reason = factor(uhype$no_meds_reason,levels=c("1","2","3","4","5","6"))
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

levels(uhype$redcap_repeat_instrument)=c("Patients Chart Review")
levels(uhype$sex)=c("Female","Male")
levels(uhype$relationship)=c("Single","Married","Separated","Co-habiting","Widowed")
levels(uhype$occup)=c("Yes","No")
levels(uhype$occup_type)=c("Formal sector","Informal sector")
levels(uhype$no_occup)=c("Student","Unemployed","Retired","Ill-health","Lack of interest in working","No reason to work","legal reason","other")
levels(uhype$educ)=c("None or did not complete primary","Completed primary","Completed JHS","Completed SHS","Certificate or Diploma holder","Completed college","Technical","Vocational","O level","A level","Form 4")
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
levels(uhype$chd_hpt)=c("Yes","No")
levels(uhype$comorbs___0)=c("No","Yes")
levels(uhype$comorbs___1)=c("No","Yes")
levels(uhype$comorbs___2)=c("No","Yes")
levels(uhype$comorbs___3)=c("No","Yes")
levels(uhype$comorbs___4)=c("No","Yes")
levels(uhype$comorbs___5)=c("No","Yes")
levels(uhype$comorbs___6)=c("No","Yes")
levels(uhype$comorbs___7)=c("No","Yes")
levels(uhype$comorbs___8)=c("No","Yes")
levels(uhype$comorbs___9)=c("No","Yes")
levels(uhype$comorbs___10)=c("No","Yes")
levels(uhype$comorbs___11)=c("No","Yes")
levels(uhype$comorbs___12)=c("No","Yes")
levels(uhype$hpt_meds)=c("Yes","No")
levels(uhype$meds___1)=c("No","Yes")
levels(uhype$meds___2)=c("No","Yes")
levels(uhype$meds___3)=c("No","Yes")
levels(uhype$meds___4)=c("No","Yes")
levels(uhype$meds___5)=c("No","Yes")
levels(uhype$meds___6)=c("No","Yes")
levels(uhype$meds___7)=c("No","Yes")
levels(uhype$meds___8)=c("No","Yes")
levels(uhype$meds___9)=c("No","Yes")
levels(uhype$meds___10)=c("No","Yes")
levels(uhype$meds___11)=c("No","Yes")
levels(uhype$meds___12)=c("No","Yes")
levels(uhype$meds___13)=c("No","Yes")
levels(uhype$meds___14)=c("No","Yes")
levels(uhype$med_hsp)=c("Yes (All of them)","Yes (Some of them)","No")
levels(uhype$no_meds_reason)=c("Too early to eat","Time for medication is not yet up","Forgot","Out of stock","Side effect/Not tolerating drug","Others")
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

#Setting Labels

label(uhype$id)="Record ID"
label(uhype$redcap_repeat_instrument)="Repeat Instrument"
label(uhype$redcap_repeat_instance)="Repeat Instance"
label(uhype$site)="Site"
label(uhype$age)="Age"
label(uhype$sex)="Sex"
label(uhype$relationship)="Marital Status"
label(uhype$occup)="Occupation"
label(uhype$occup_type)="Primary area of work"
label(uhype$no_occup)="Unemployment reason"
label(uhype$no_occp_1)="Kindly specify why you do not work"
label(uhype$educ)="Highest education"
label(uhype$insurance)="Health insurance"
label(uhype$insurance_type___1)="NHIS"
label(uhype$insurance_type___2)="Private insurance"
label(uhype$insurance_type___3)="Employer-paid program"
label(uhype$insurance_type___4)="Other"
label(uhype$detained_12mths)="Admission due to HBP (24mths)"
label(uhype$mbp___1)="BP check (BP machine at home)"
label(uhype$mbp___2)="BP check (Neighborhood facility)"
label(uhype$mbp___3)="BP check (Pharmacy shop)"
label(uhype$mbp___4)="BP check (Street vendors with BP apparatus)"
label(uhype$hpt_relative)="Does any of your parents, siblings, or children have high blood pressure?"
label(uhype$chd_hpt)="Co-morbidity"
label(uhype$comorbs___0)="Diabetes"
label(uhype$comorbs___1)="Chronic Kidney Disease"
label(uhype$comorbs___2)="Heart Failure"
label(uhype$comorbs___3)="Stroke"
label(uhype$comorbs___4)="Dementia"
label(uhype$comorbs___5)="Irregular heartbeat"
label(uhype$comorbs___6)="Prostate disease"
label(uhype$comorbs___7)="Coronary Artery Disease"
label(uhype$comorbs___8)="Hyperlipidemia"
label(uhype$comorbs___9)="Chronic Pain"
label(uhype$comorbs___10)="Asthma"
label(uhype$comorbs___11)="Others"
label(uhype$comorbs___12)="Sickle cell"
label(uhype$hpt_meds)="HBP Medications"
label(uhype$meds___1)="Amlodipine"
label(uhype$meds___2)="Lisinopril"
label(uhype$meds___3)="Losartan"
label(uhype$meds___4)="Bendroflumethiazide"
label(uhype$meds___5)="HCTZ)"
label(uhype$meds___6)="Atenolol"
label(uhype$meds___7)="Bisoprolol"
label(uhype$meds___8)="Methyldopa"
label(uhype$meds___9)="Furosemide"
label(uhype$meds___10)="Hydralazine"
label(uhype$meds___11)="Nifedipine"
label(uhype$meds___12)="Unknown"
label(uhype$meds___13)="Aspirin"
label(uhype$meds___14)="Others"
label(uhype$other_meds)="Other BP meds"
label(uhype$med_hsp)="Medications before coming to the hospital today"
label(uhype$no_meds_reason)="Resoan, if none or some"
label(uhype$no_meds_others)="Others reasons"
label(uhype$bp_meds___1)="Insurance provided (full)"
label(uhype$bp_meds___2)="Insurance provided (partial)"
label(uhype$bp_meds___3)="OOP"
label(uhype$bp_meds_buy)="Financial burden due to BP medications"
label(uhype$lab_test)="Financial burden due to labs"
label(uhype$insu_bp_visit)="Usage of insurance during BP visits"
label(uhype$ins_type___1)="NHIS"
label(uhype$ins_type___2)="Private insurance"
label(uhype$ins_type___3)="Employer-paid program"
label(uhype$ins_type___4)="Other"
label(uhype$facilities_attended)="Number of facilities for healthcare"
label(uhype$more_than_1_facility)="Facilities providing BP medications"
label(uhype$same_doctor)="Review by same doctor"
label(uhype$hpt_special_clinic)="Special clinics for BP care"
label(uhype$med_runout)="Frequency of running out of medications"
label(uhype$financial_difficulties)="Financial difficulties acquiring medication(s)?"
label(uhype$diff_get_drugs)="Frequency of financial difficulties"
label(uhype$meds_concern)="Concerns about medication"
label(uhype$meds_concern_reason)="Reasons for concern"
label(uhype$assistance)="Other concern reasons"
label(uhype$herbs_for_hpt)="Herbal preparations for HBP"
label(uhype$special_diet)="Dieting"