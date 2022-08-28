#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
hype=read.csv('UHype-Dashboard_DATA_2022-03-04_1250.csv')
#Setting Labels

label(hype$id)="Record ID"
label(hype$redcap_repeat_instrument)="Repeat Instrument"
label(hype$redcap_repeat_instance)="Repeat Instance"
label(hype$age)="Age"
label(hype$sex)="Sex"
label(hype$relationship)="Marital Status"
label(hype$occup)="Worker"
label(hype$educ)="Highest education"
label(hype$financial_difficulties)="Financial difficulties with medication"
label(hype$herbs_for_hpt)="Herbal medications"
label(hype$bpm_meds_herbs)="Use of clinical drugs with herbal"
label(hype$diet_type_sugar)="Sugar"
label(hype$diet_type_salt)="Salt"
label(hype$diet_type_fats)="Saturated Fat"
label(hype$diet_type_vegies)="Vegatables"
label(hype$diet_type_fruits)="Fruits"
label(hype$diet_type_meat)="Meat"
label(hype$drink_alcohol)="Alcohol usage"
label(hype$fast_food)="Buy food outside home?"
label(hype$systol)="SBP"
label(hype$diastol)="DBP"
label(hype$insurance)="Health insurance?"
label(hype$has_hbp)="Do you have hig BP"
label(hype$hbp_know___1)="Health screening program"
label(hype$hbp_know___2)="A clinic visit"
label(hype$hbp_know___3)="At a pharmacy shop"
label(hype$hbp_know___4)="Admission or Emergency room visit"
label(hype$hbp_know___5)="I do not remember"
label(hype$hbp_know___6)="Self-diagnosis"
label(hype$hbp_know___7)="Others)"
label(hype$hbp_ctrl)="Is your BP controlled"
label(hype$detained_12mths)="Admitted or detained on account of BP"
label(hype$mea_bpm)="Measure BP between visits"
label(hype$bp_check_month)="BP check frequency"
label(hype$hpt_relative)="BP in the family"
label(hype$chd_hpt)="Other chronic disease"
label(hype$comorbs___0)="Diabetes"
label(hype$comorbs___1)="Chronic Kidney Disease"
label(hype$comorbs___2)="Heart Failure"
label(hype$comorbs___3)="Stroke"
label(hype$comorbs___4)="Dementia"
label(hype$comorbs___5)="Irregular heartbeat"
label(hype$comorbs___6)="Prostate disease"
label(hype$comorbs___7)="Coronary Artery Disease"
label(hype$comorbs___8)="Hyperlipidemia"
label(hype$comorbs___9)="Chronic Pain"
label(hype$comorbs___10)="Asthma"
label(hype$comorbs___12)="Sickle cell"
label(hype$hpt_meds)="BP medications"
label(hype$meds___1)="Amlodipine"
label(hype$meds___2)="Lisinopril"
label(hype$meds___3)="Losartan"
label(hype$meds___4)="Bendroflumethiazide"
label(hype$meds___5)="HCTZ"
label(hype$meds___6)="Atenolol"
label(hype$meds___7)="Bisoprolol"
label(hype$meds___8)="Methyldopa"
label(hype$meds___9)="Furosemide"
label(hype$meds___10)="Hydralazine"
label(hype$meds___11)="Nifedipine)"
label(hype$meds___12)="Unknown"
label(hype$meds___13)="Aspirin"
label(hype$bp_meds___1)="Medicine supply with insurance"
label(hype$bp_meds___2)="Medicine supply with part insurance)"
label(hype$bp_meds___3)="Medicinen supply with OOP"
label(hype$bp_meds_buy)="Are BP medication a  financial burden"
label(hype$lab_test)="Are laboratory cost a financial burden"
label(hype$insu_bp_visit)="Health insurance usage"
label(hype$facilities_attended)="Facilities for care"
label(hype$more_than_1_facility)="Facilities for BP meds"
label(hype$miss_appoint)="Miss BP appointment"
label(hype$diff_get_drugs)="Financial difficulties frequency"
label(hype$meds_concern)="Concerned about prescribed medication"
label(hype$med_assistance)="Require assistance with medications at home?"
label(hype$reasons_for_herbs)="Reason for herbal drugs usage"
label(hype$dietician)="Seen a dietician"
label(hype$health_rate_after_1yr)="Health since 1 year"
label(hype$hpt_reactions___1)="Worried about stroke"
label(hype$hpt_reactions___2)="Worried about heart attack"
label(hype$hpt_reactions___3)="Worried about diabetes"
label(hype$hpt_reactions___4)="Worried about being blind)"
label(hype$hpt_reactions___5)="Worried kidney problems"
label(hype$hpt_reactions___6)="Afraid of death)"
label(hype$hpt_reactions___7)="Feel sad"
label(hype$hpt_reactions___8)="I am safe"
label(hype$hpt_reactions___9)="Safe because BP is controlled"
label(hype$hpt_reactions___10)="Safe because of check-ups"
label(hype$health_rate)="My health is:"
#Setting Units


#Setting Factors(will create new variable for factors)
hype$redcap_repeat_instrument = factor(hype$redcap_repeat_instrument,levels=c("patients_chart_review"))
hype$sex = factor(hype$sex,levels=c("1","2"))
hype$relationship = factor(hype$relationship,levels=c("1","2","3","4","5"))
hype$occup = factor(hype$occup,levels=c("1","0"))
hype$educ = factor(hype$educ,levels=c("1","2","3","4","5","6","7","8","9","10","11"))
hype$financial_difficulties = factor(hype$financial_difficulties,levels=c("1","0"))
hype$herbs_for_hpt = factor(hype$herbs_for_hpt,levels=c("1","0"))
hype$bpm_meds_herbs = factor(hype$bpm_meds_herbs,levels=c("1","2","3","4","5"))
hype$diet_type_sugar = factor(hype$diet_type_sugar,levels=c("1","0","2","3"))
hype$diet_type_salt = factor(hype$diet_type_salt,levels=c("1","0","2","3"))
hype$diet_type_fats = factor(hype$diet_type_fats,levels=c("1","0","2","3"))
hype$diet_type_vegies = factor(hype$diet_type_vegies,levels=c("1","0","2","3"))
hype$diet_type_fruits = factor(hype$diet_type_fruits,levels=c("1","0","2","3"))
hype$diet_type_meat = factor(hype$diet_type_meat,levels=c("1","0","2","3"))
hype$drink_alcohol = factor(hype$drink_alcohol,levels=c("1","0","3"))
hype$fast_food = factor(hype$fast_food,levels=c("1","2","3","4","5"))
hype$insurance = factor(hype$insurance,levels=c("1","0"))
hype$has_hbp = factor(hype$has_hbp,levels=c("0","1"))
hype$hbp_know___1 = factor(hype$hbp_know___1,levels=c("0","1"))
hype$hbp_know___2 = factor(hype$hbp_know___2,levels=c("0","1"))
hype$hbp_know___3 = factor(hype$hbp_know___3,levels=c("0","1"))
hype$hbp_know___4 = factor(hype$hbp_know___4,levels=c("0","1"))
hype$hbp_know___5 = factor(hype$hbp_know___5,levels=c("0","1"))
hype$hbp_know___6 = factor(hype$hbp_know___6,levels=c("0","1"))
hype$hbp_know___7 = factor(hype$hbp_know___7,levels=c("0","1"))
hype$hbp_ctrl = factor(hype$hbp_ctrl,levels=c("1","0","2"))
hype$detained_12mths = factor(hype$detained_12mths,levels=c("1","0"))
hype$mea_bpm = factor(hype$mea_bpm,levels=c("1","0"))
hype$hpt_relative = factor(hype$hpt_relative,levels=c("1","2","0"))
hype$chd_hpt = factor(hype$chd_hpt,levels=c("1","0"))
hype$comorbs___0 = factor(hype$comorbs___0,levels=c("0","1"))
hype$comorbs___1 = factor(hype$comorbs___1,levels=c("0","1"))
hype$comorbs___2 = factor(hype$comorbs___2,levels=c("0","1"))
hype$comorbs___3 = factor(hype$comorbs___3,levels=c("0","1"))
hype$comorbs___4 = factor(hype$comorbs___4,levels=c("0","1"))
hype$comorbs___5 = factor(hype$comorbs___5,levels=c("0","1"))
hype$comorbs___6 = factor(hype$comorbs___6,levels=c("0","1"))
hype$comorbs___7 = factor(hype$comorbs___7,levels=c("0","1"))
hype$comorbs___8 = factor(hype$comorbs___8,levels=c("0","1"))
hype$comorbs___9 = factor(hype$comorbs___9,levels=c("0","1"))
hype$comorbs___10 = factor(hype$comorbs___10,levels=c("0","1"))
hype$comorbs___11 = factor(hype$comorbs___11,levels=c("0","1"))
hype$comorbs___12 = factor(hype$comorbs___12,levels=c("0","1"))
hype$hpt_meds = factor(hype$hpt_meds,levels=c("1","0"))
hype$meds___1 = factor(hype$meds___1,levels=c("0","1"))
hype$meds___2 = factor(hype$meds___2,levels=c("0","1"))
hype$meds___3 = factor(hype$meds___3,levels=c("0","1"))
hype$meds___4 = factor(hype$meds___4,levels=c("0","1"))
hype$meds___5 = factor(hype$meds___5,levels=c("0","1"))
hype$meds___6 = factor(hype$meds___6,levels=c("0","1"))
hype$meds___7 = factor(hype$meds___7,levels=c("0","1"))
hype$meds___8 = factor(hype$meds___8,levels=c("0","1"))
hype$meds___9 = factor(hype$meds___9,levels=c("0","1"))
hype$meds___10 = factor(hype$meds___10,levels=c("0","1"))
hype$meds___11 = factor(hype$meds___11,levels=c("0","1"))
hype$meds___12 = factor(hype$meds___12,levels=c("0","1"))
hype$meds___13 = factor(hype$meds___13,levels=c("0","1"))
hype$meds___14 = factor(hype$meds___14,levels=c("0","1"))
hype$bp_meds___1 = factor(hype$bp_meds___1,levels=c("0","1"))
hype$bp_meds___2 = factor(hype$bp_meds___2,levels=c("0","1"))
hype$bp_meds___3 = factor(hype$bp_meds___3,levels=c("0","1"))
hype$bp_meds_buy = factor(hype$bp_meds_buy,levels=c("1","2"))
hype$lab_test = factor(hype$lab_test,levels=c("0","1"))
hype$insu_bp_visit = factor(hype$insu_bp_visit,levels=c("1","0"))
hype$miss_appoint = factor(hype$miss_appoint,levels=c("0","1","2","3","4"))
hype$diff_get_drugs = factor(hype$diff_get_drugs,levels=c("1","2","3"))
hype$meds_concern = factor(hype$meds_concern,levels=c("1","0"))
hype$med_assistance = factor(hype$med_assistance,levels=c("1","0"))
hype$reasons_for_herbs = factor(hype$reasons_for_herbs,levels=c("1","2","3","4","5"))
hype$dietician = factor(hype$dietician,levels=c("1","0"))
hype$health_rate_after_1yr = factor(hype$health_rate_after_1yr,levels=c("5","4","3","2","1"))
hype$hpt_reactions___1 = factor(hype$hpt_reactions___1,levels=c("0","1"))
hype$hpt_reactions___2 = factor(hype$hpt_reactions___2,levels=c("0","1"))
hype$hpt_reactions___3 = factor(hype$hpt_reactions___3,levels=c("0","1"))
hype$hpt_reactions___4 = factor(hype$hpt_reactions___4,levels=c("0","1"))
hype$hpt_reactions___5 = factor(hype$hpt_reactions___5,levels=c("0","1"))
hype$hpt_reactions___6 = factor(hype$hpt_reactions___6,levels=c("0","1"))
hype$hpt_reactions___7 = factor(hype$hpt_reactions___7,levels=c("0","1"))
hype$hpt_reactions___8 = factor(hype$hpt_reactions___8,levels=c("0","1"))
hype$hpt_reactions___9 = factor(hype$hpt_reactions___9,levels=c("0","1"))
hype$hpt_reactions___10 = factor(hype$hpt_reactions___10,levels=c("0","1"))
hype$health_rate = factor(hype$health_rate,levels=c("5","4","3","2","1"))

levels(hype$redcap_repeat_instrument)=c("Patients Chart Review")
levels(hype$sex)=c("Female","Male")
levels(hype$relationship)=c("Single","Married","Separated","Co-habiting","Widowed")
levels(hype$occup)=c("Yes","No")
levels(hype$educ)=c("None or did not complete primary","Completed primary","Completed JHS","Completed SHS","Certificate or Diploma holder","Completed college","Technical","Vocational","O level","A level","Form 4")
levels(hype$financial_difficulties)=c("Yes","No")
levels(hype$herbs_for_hpt)=c("Yes","No")
levels(hype$bpm_meds_herbs)=c("I was not on BP medications then","I stopped taking them","I took them together","I stopped taking them at some time and took them together at another time","Others")
levels(hype$diet_type_sugar)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(hype$diet_type_salt)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(hype$diet_type_fats)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(hype$diet_type_vegies)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(hype$diet_type_fruits)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(hype$diet_type_meat)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(hype$drink_alcohol)=c("Yes","No","Quit")
levels(hype$fast_food)=c("Once a week","Daily","More than half of the days in a week","Less than half of the days in a week","Rarely")
levels(hype$insurance)=c("Yes","No")
levels(hype$has_hbp)=c("No","Yes")
levels(hype$hbp_know___1)=c("No","Yes")
levels(hype$hbp_know___2)=c("No","Yes")
levels(hype$hbp_know___3)=c("No","Yes")
levels(hype$hbp_know___4)=c("No","Yes")
levels(hype$hbp_know___5)=c("No","Yes")
levels(hype$hbp_know___6)=c("No","Yes")
levels(hype$hbp_know___7)=c("No","Yes")
levels(hype$hbp_ctrl)=c("Yes","No","I dont know")
levels(hype$detained_12mths)=c("Yes","No")
levels(hype$mea_bpm)=c("Yes","No")
levels(hype$hpt_relative)=c("Yes","I dont know","No")
levels(hype$chd_hpt)=c("Yes","No")
levels(hype$comorbs___0)=c("No","Yes")
levels(hype$comorbs___1)=c("No","Yes")
levels(hype$comorbs___2)=c("No","Yes")
levels(hype$comorbs___3)=c("No","Yes")
levels(hype$comorbs___4)=c("No","Yes")
levels(hype$comorbs___5)=c("No","Yes")
levels(hype$comorbs___6)=c("No","Yes")
levels(hype$comorbs___7)=c("No","Yes")
levels(hype$comorbs___8)=c("No","Yes")
levels(hype$comorbs___9)=c("No","Yes")
levels(hype$comorbs___10)=c("No","Yes")
levels(hype$comorbs___11)=c("No","Yes")
levels(hype$comorbs___12)=c("No","Yes")
levels(hype$hpt_meds)=c("Yes","No")
levels(hype$meds___1)=c("No","Yes")
levels(hype$meds___2)=c("No","Yes")
levels(hype$meds___3)=c("No","Yes")
levels(hype$meds___4)=c("No","Yes")
levels(hype$meds___5)=c("No","Yes")
levels(hype$meds___6)=c("No","Yes")
levels(hype$meds___7)=c("No","Yes")
levels(hype$meds___8)=c("No","Yes")
levels(hype$meds___9)=c("No","Yes")
levels(hype$meds___10)=c("No","Yes")
levels(hype$meds___11)=c("No","Yes")
levels(hype$meds___12)=c("No","Yes")
levels(hype$meds___13)=c("No","Yes")
levels(hype$meds___14)=c("No","Yes")
levels(hype$bp_meds___1)=c("No","Yes")
levels(hype$bp_meds___2)=c("No","Yes")
levels(hype$bp_meds___3)=c("No","Yes")
levels(hype$bp_meds_buy)=c("Yes","No")
levels(hype$lab_test)=c("No","Yes")
levels(hype$insu_bp_visit)=c("Yes","No")
levels(hype$miss_appoint)=c("Never","Few times","Some times","Most times","All times")
levels(hype$diff_get_drugs)=c("Less than half the time","About half the time","All the time")
levels(hype$meds_concern)=c("Yes","No")
levels(hype$med_assistance)=c("Yes","No")
levels(hype$reasons_for_herbs)=c("Advice from friends and relatives","Advertisement on mass media","Self decision","Advice from health professionals","Other reasons")
levels(hype$dietician)=c("Yes","No")
levels(hype$health_rate_after_1yr)=c("Much better now than one year ago","Somewhat better now than one year ago","About the same","Somewhat worse now than one year ago","Much worse than one year ago")
levels(hype$hpt_reactions___1)=c("No","Yes")
levels(hype$hpt_reactions___2)=c("No","Yes")
levels(hype$hpt_reactions___3)=c("No","Yes")
levels(hype$hpt_reactions___4)=c("No","Yes")
levels(hype$hpt_reactions___5)=c("No","Yes")
levels(hype$hpt_reactions___6)=c("No","Yes")
levels(hype$hpt_reactions___7)=c("No","Yes")
levels(hype$hpt_reactions___8)=c("No","Yes")
levels(hype$hpt_reactions___9)=c("No","Yes")
levels(hype$hpt_reactions___10)=c("No","Yes")
levels(hype$health_rate)=c("Excellent","Very Good","Good","Fair","Poor")
