#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('UHype-Dashboard_DATA_2022-03-04_1250.csv')
#Setting Labels

label(data$id)="Record ID"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$age)="Age"
label(data$sex)="Sex"
label(data$relationship)="Marital Status"
label(data$occup)="Are you involved in any work activity you get paid for?"
label(data$educ)="Highest education"
label(data$financial_difficulties)="Do you have financial difficulties with acquiring your medication(s)?"
label(data$herbs_for_hpt)="Have you ever taken herbal preparations for high blood pressure?"
label(data$bpm_meds_herbs)="While you were using the herbal preparation, what did you do with your regular blood pressure medications?"
label(data$diet_type_sugar)="Sugar"
label(data$diet_type_salt)="Salt"
label(data$diet_type_fats)="Saturated Fat"
label(data$diet_type_vegies)="Vegatables"
label(data$diet_type_fruits)="Fruits"
label(data$diet_type_meat)="Meat"
label(data$drink_alcohol)="Do you drink alcohol?"
label(data$fast_food)="How often do you buy cooked food outside your home?"
label(data$systol)="Systolic blood pressure"
label(data$diastol)="Diastolic blood pressure"
label(data$insurance)="Do you have any form of health insurance?"
label(data$has_hbp)="Do you have a high blood pressure"
label(data$hbp_know___1)="How did you come to know that you have high blood pressure (choice=Health screening program)"
label(data$hbp_know___2)="How did you come to know that you have high blood pressure (choice=A clinic visit)"
label(data$hbp_know___3)="How did you come to know that you have high blood pressure (choice=At a pharmacy shop)"
label(data$hbp_know___4)="How did you come to know that you have high blood pressure (choice=Admission or Emergency room visit)"
label(data$hbp_know___5)="How did you come to know that you have high blood pressure (choice=I do not remember)"
label(data$hbp_know___6)="How did you come to know that you have high blood pressure (choice=Self-diagnosis)"
label(data$hbp_know___7)="How did you come to know that you have high blood pressure (choice=Others)"
label(data$hbp_ctrl)="Is your blood pressure under control now"
label(data$detained_12mths)="In the last 24 months, have you been admitted or detained in any hospital on account of high blood pressure?"
label(data$mea_bpm)="Do you measure your blood pressure in between clinic visits?"
label(data$bp_check_month)="How often do you check your blood pressure in a month at home in between visits"
label(data$hpt_relative)="Does any of your parents, siblings, or children have high blood pressure?"
label(data$chd_hpt)="Do you have any other chronic disease?"
label(data$comorbs___0)="Kindly select (choice=Diabetes)"
label(data$comorbs___1)="Kindly select (choice=Chronic Kidney Disease)"
label(data$comorbs___2)="Kindly select (choice=Heart Failure)"
label(data$comorbs___3)="Kindly select (choice=Stroke)"
label(data$comorbs___4)="Kindly select (choice=Dementia)"
label(data$comorbs___5)="Kindly select (choice=Irregular heartbeat)"
label(data$comorbs___6)="Kindly select (choice=Prostate disease)"
label(data$comorbs___7)="Kindly select (choice=Coronary Artery Disease)"
label(data$comorbs___8)="Kindly select (choice=Hyperlipidemia)"
label(data$comorbs___9)="Kindly select (choice=Chronic Pain)"
label(data$comorbs___10)="Kindly select (choice=Asthma)"
label(data$comorbs___11)="Kindly select (choice=Others)"
label(data$comorbs___12)="Kindly select (choice=Sickle cell)"
label(data$hpt_meds)="Are you on medications for high blood pressure? "
label(data$meds___1)="Select the drugs (choice=Amlodipine)"
label(data$meds___2)="Select the drugs (choice=Lisinopril)"
label(data$meds___3)="Select the drugs (choice=Losartan)"
label(data$meds___4)="Select the drugs (choice=Bendroflumethiazide)"
label(data$meds___5)="Select the drugs (choice=HCTZ)"
label(data$meds___6)="Select the drugs (choice=Atenolol)"
label(data$meds___7)="Select the drugs (choice=Bisoprolol)"
label(data$meds___8)="Select the drugs (choice=Methyldopa)"
label(data$meds___9)="Select the drugs (choice=Furosemide)"
label(data$meds___10)="Select the drugs (choice=Hydralazine)"
label(data$meds___11)="Select the drugs (choice=Nifedipine)"
label(data$meds___12)="Select the drugs (choice=Unknown)"
label(data$meds___13)="Select the drugs (choice=Aspirin)"
label(data$meds___14)="Select the drugs (choice=Others)"
label(data$bp_meds___1)="Where do you get your medications for BP after your clinic visit?  (choice=All supplied with insurance)"
label(data$bp_meds___2)="Where do you get your medications for BP after your clinic visit?  (choice=Partly supplied with insurance)"
label(data$bp_meds___3)="Where do you get your medications for BP after your clinic visit?  (choice=Out of pocket payment for all the drugs)"
label(data$bp_meds_buy)="Does the cost of Blood pressure medication pose a  financial burden for you?"
label(data$lab_test)="Does the cost laboratory testing pose a financial burden on you?"
label(data$insu_bp_visit)="Do you attend your BP visits with a form of health insurance? "
label(data$facilities_attended)="How many different facilities do you attend for your healthcare needs regularly (not just BP alone)?"
label(data$more_than_1_facility)="How many of these facilities do you receive BP medications from?"
label(data$miss_appoint)="How often do you miss an appointment for BP review?"
label(data$diff_get_drugs)="How often to you have the financial difficulties?"
label(data$meds_concern)="Do you have any concerns that stop you from taking your medication as prescribed?  "
label(data$med_assistance)="Do you require someone to assist you with taking your medications prescribed at home?"
label(data$reasons_for_herbs)="If yes, what made you use herbal preparation for blood pressure control? "
label(data$dietician)="Have you ever seen a dietician in relation to your blood pressure control?"
label(data$health_rate_after_1yr)="Compared to one year ago, how would you rate your health in general now?"
label(data$hpt_reactions___1)="How do you feel about your health, as it relates to your high blood pressure? (choice=I am worried that I could get a stroke)"
label(data$hpt_reactions___2)="How do you feel about your health, as it relates to your high blood pressure? (choice=I am worried that I could get a heart attack)"
label(data$hpt_reactions___3)="How do you feel about your health, as it relates to your high blood pressure? (choice=I am worried that I could get diabetes)"
label(data$hpt_reactions___4)="How do you feel about your health, as it relates to your high blood pressure? (choice=I am worried that I could get blind)"
label(data$hpt_reactions___5)="How do you feel about your health, as it relates to your high blood pressure? (choice=I am worried that I could get kidney problems)"
label(data$hpt_reactions___6)="How do you feel about your health, as it relates to your high blood pressure? (choice=I am afraid I will die early)"
label(data$hpt_reactions___7)="How do you feel about your health, as it relates to your high blood pressure? (choice=I feel sad)"
label(data$hpt_reactions___8)="How do you feel about your health, as it relates to your high blood pressure? (choice=I dont think anything will happen)"
label(data$hpt_reactions___9)="How do you feel about your health, as it relates to your high blood pressure? (choice=I feel safe because my pressure is under control)"
label(data$hpt_reactions___10)="How do you feel about your health, as it relates to your high blood pressure? (choice=I feel safe because I report regularly for a check-up)"
label(data$health_rate)="In general, would you say your health is:"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("patients_chart_review"))
data$sex.factor = factor(data$sex,levels=c("1","2"))
data$relationship.factor = factor(data$relationship,levels=c("1","2","3","4","5"))
data$occup.factor = factor(data$occup,levels=c("1","0"))
data$educ.factor = factor(data$educ,levels=c("1","2","3","4","5","6","7","8","9","10","11"))
data$financial_difficulties.factor = factor(data$financial_difficulties,levels=c("1","0"))
data$herbs_for_hpt.factor = factor(data$herbs_for_hpt,levels=c("1","0"))
data$bpm_meds_herbs.factor = factor(data$bpm_meds_herbs,levels=c("1","2","3","4","5"))
data$diet_type_sugar.factor = factor(data$diet_type_sugar,levels=c("1","0","2","3"))
data$diet_type_salt.factor = factor(data$diet_type_salt,levels=c("1","0","2","3"))
data$diet_type_fats.factor = factor(data$diet_type_fats,levels=c("1","0","2","3"))
data$diet_type_vegies.factor = factor(data$diet_type_vegies,levels=c("1","0","2","3"))
data$diet_type_fruits.factor = factor(data$diet_type_fruits,levels=c("1","0","2","3"))
data$diet_type_meat.factor = factor(data$diet_type_meat,levels=c("1","0","2","3"))
data$drink_alcohol.factor = factor(data$drink_alcohol,levels=c("1","0","3"))
data$fast_food.factor = factor(data$fast_food,levels=c("1","2","3","4","5"))
data$insurance.factor = factor(data$insurance,levels=c("1","0"))
data$has_hbp.factor = factor(data$has_hbp,levels=c("0","1"))
data$hbp_know___1.factor = factor(data$hbp_know___1,levels=c("0","1"))
data$hbp_know___2.factor = factor(data$hbp_know___2,levels=c("0","1"))
data$hbp_know___3.factor = factor(data$hbp_know___3,levels=c("0","1"))
data$hbp_know___4.factor = factor(data$hbp_know___4,levels=c("0","1"))
data$hbp_know___5.factor = factor(data$hbp_know___5,levels=c("0","1"))
data$hbp_know___6.factor = factor(data$hbp_know___6,levels=c("0","1"))
data$hbp_know___7.factor = factor(data$hbp_know___7,levels=c("0","1"))
data$hbp_ctrl.factor = factor(data$hbp_ctrl,levels=c("1","0","2"))
data$detained_12mths.factor = factor(data$detained_12mths,levels=c("1","0"))
data$mea_bpm.factor = factor(data$mea_bpm,levels=c("1","0"))
data$hpt_relative.factor = factor(data$hpt_relative,levels=c("1","2","0"))
data$chd_hpt.factor = factor(data$chd_hpt,levels=c("1","0"))
data$comorbs___0.factor = factor(data$comorbs___0,levels=c("0","1"))
data$comorbs___1.factor = factor(data$comorbs___1,levels=c("0","1"))
data$comorbs___2.factor = factor(data$comorbs___2,levels=c("0","1"))
data$comorbs___3.factor = factor(data$comorbs___3,levels=c("0","1"))
data$comorbs___4.factor = factor(data$comorbs___4,levels=c("0","1"))
data$comorbs___5.factor = factor(data$comorbs___5,levels=c("0","1"))
data$comorbs___6.factor = factor(data$comorbs___6,levels=c("0","1"))
data$comorbs___7.factor = factor(data$comorbs___7,levels=c("0","1"))
data$comorbs___8.factor = factor(data$comorbs___8,levels=c("0","1"))
data$comorbs___9.factor = factor(data$comorbs___9,levels=c("0","1"))
data$comorbs___10.factor = factor(data$comorbs___10,levels=c("0","1"))
data$comorbs___11.factor = factor(data$comorbs___11,levels=c("0","1"))
data$comorbs___12.factor = factor(data$comorbs___12,levels=c("0","1"))
data$hpt_meds.factor = factor(data$hpt_meds,levels=c("1","0"))
data$meds___1.factor = factor(data$meds___1,levels=c("0","1"))
data$meds___2.factor = factor(data$meds___2,levels=c("0","1"))
data$meds___3.factor = factor(data$meds___3,levels=c("0","1"))
data$meds___4.factor = factor(data$meds___4,levels=c("0","1"))
data$meds___5.factor = factor(data$meds___5,levels=c("0","1"))
data$meds___6.factor = factor(data$meds___6,levels=c("0","1"))
data$meds___7.factor = factor(data$meds___7,levels=c("0","1"))
data$meds___8.factor = factor(data$meds___8,levels=c("0","1"))
data$meds___9.factor = factor(data$meds___9,levels=c("0","1"))
data$meds___10.factor = factor(data$meds___10,levels=c("0","1"))
data$meds___11.factor = factor(data$meds___11,levels=c("0","1"))
data$meds___12.factor = factor(data$meds___12,levels=c("0","1"))
data$meds___13.factor = factor(data$meds___13,levels=c("0","1"))
data$meds___14.factor = factor(data$meds___14,levels=c("0","1"))
data$bp_meds___1.factor = factor(data$bp_meds___1,levels=c("0","1"))
data$bp_meds___2.factor = factor(data$bp_meds___2,levels=c("0","1"))
data$bp_meds___3.factor = factor(data$bp_meds___3,levels=c("0","1"))
data$bp_meds_buy.factor = factor(data$bp_meds_buy,levels=c("1","2"))
data$lab_test.factor = factor(data$lab_test,levels=c("0","1"))
data$insu_bp_visit.factor = factor(data$insu_bp_visit,levels=c("1","0"))
data$miss_appoint.factor = factor(data$miss_appoint,levels=c("0","1","2","3","4"))
data$diff_get_drugs.factor = factor(data$diff_get_drugs,levels=c("1","2","3"))
data$meds_concern.factor = factor(data$meds_concern,levels=c("1","0"))
data$med_assistance.factor = factor(data$med_assistance,levels=c("1","0"))
data$reasons_for_herbs.factor = factor(data$reasons_for_herbs,levels=c("1","2","3","4","5"))
data$dietician.factor = factor(data$dietician,levels=c("1","0"))
data$health_rate_after_1yr.factor = factor(data$health_rate_after_1yr,levels=c("5","4","3","2","1"))
data$hpt_reactions___1.factor = factor(data$hpt_reactions___1,levels=c("0","1"))
data$hpt_reactions___2.factor = factor(data$hpt_reactions___2,levels=c("0","1"))
data$hpt_reactions___3.factor = factor(data$hpt_reactions___3,levels=c("0","1"))
data$hpt_reactions___4.factor = factor(data$hpt_reactions___4,levels=c("0","1"))
data$hpt_reactions___5.factor = factor(data$hpt_reactions___5,levels=c("0","1"))
data$hpt_reactions___6.factor = factor(data$hpt_reactions___6,levels=c("0","1"))
data$hpt_reactions___7.factor = factor(data$hpt_reactions___7,levels=c("0","1"))
data$hpt_reactions___8.factor = factor(data$hpt_reactions___8,levels=c("0","1"))
data$hpt_reactions___9.factor = factor(data$hpt_reactions___9,levels=c("0","1"))
data$hpt_reactions___10.factor = factor(data$hpt_reactions___10,levels=c("0","1"))
data$health_rate.factor = factor(data$health_rate,levels=c("5","4","3","2","1"))

levels(data$redcap_repeat_instrument.factor)=c("Patients Chart Review")
levels(data$sex.factor)=c("Female","Male")
levels(data$relationship.factor)=c("Single","Married","Separated","Co-habiting","Widowed")
levels(data$occup.factor)=c("Yes","No")
levels(data$educ.factor)=c("None or did not complete primary","Completed primary","Completed JHS","Completed SHS","Certificate or Diploma holder","Completed college","Technical","Vocational","O level","A level","Form 4")
levels(data$financial_difficulties.factor)=c("Yes","No")
levels(data$herbs_for_hpt.factor)=c("Yes","No")
levels(data$bpm_meds_herbs.factor)=c("I was not on BP medications then","I stopped taking them","I took them together","I stopped taking them at some time and took them together at another time","Others")
levels(data$diet_type_sugar.factor)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(data$diet_type_salt.factor)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(data$diet_type_fats.factor)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(data$diet_type_vegies.factor)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(data$diet_type_fruits.factor)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(data$diet_type_meat.factor)=c("Reduced intake","No change","Increased intake","Stopped/discontinued")
levels(data$drink_alcohol.factor)=c("Yes","No","Quit")
levels(data$fast_food.factor)=c("Once a week","Daily","More than half of the days in a week","Less than half of the days in a week","Rarely")
levels(data$insurance.factor)=c("Yes","No")
levels(data$has_hbp.factor)=c("No","Yes")
levels(data$hbp_know___1.factor)=c("Unchecked","Checked")
levels(data$hbp_know___2.factor)=c("Unchecked","Checked")
levels(data$hbp_know___3.factor)=c("Unchecked","Checked")
levels(data$hbp_know___4.factor)=c("Unchecked","Checked")
levels(data$hbp_know___5.factor)=c("Unchecked","Checked")
levels(data$hbp_know___6.factor)=c("Unchecked","Checked")
levels(data$hbp_know___7.factor)=c("Unchecked","Checked")
levels(data$hbp_ctrl.factor)=c("Yes","No","I dont know")
levels(data$detained_12mths.factor)=c("Yes","No")
levels(data$mea_bpm.factor)=c("Yes","No")
levels(data$hpt_relative.factor)=c("Yes","I dont know","No")
levels(data$chd_hpt.factor)=c("Yes","No")
levels(data$comorbs___0.factor)=c("Unchecked","Checked")
levels(data$comorbs___1.factor)=c("Unchecked","Checked")
levels(data$comorbs___2.factor)=c("Unchecked","Checked")
levels(data$comorbs___3.factor)=c("Unchecked","Checked")
levels(data$comorbs___4.factor)=c("Unchecked","Checked")
levels(data$comorbs___5.factor)=c("Unchecked","Checked")
levels(data$comorbs___6.factor)=c("Unchecked","Checked")
levels(data$comorbs___7.factor)=c("Unchecked","Checked")
levels(data$comorbs___8.factor)=c("Unchecked","Checked")
levels(data$comorbs___9.factor)=c("Unchecked","Checked")
levels(data$comorbs___10.factor)=c("Unchecked","Checked")
levels(data$comorbs___11.factor)=c("Unchecked","Checked")
levels(data$comorbs___12.factor)=c("Unchecked","Checked")
levels(data$hpt_meds.factor)=c("Yes","No")
levels(data$meds___1.factor)=c("Unchecked","Checked")
levels(data$meds___2.factor)=c("Unchecked","Checked")
levels(data$meds___3.factor)=c("Unchecked","Checked")
levels(data$meds___4.factor)=c("Unchecked","Checked")
levels(data$meds___5.factor)=c("Unchecked","Checked")
levels(data$meds___6.factor)=c("Unchecked","Checked")
levels(data$meds___7.factor)=c("Unchecked","Checked")
levels(data$meds___8.factor)=c("Unchecked","Checked")
levels(data$meds___9.factor)=c("Unchecked","Checked")
levels(data$meds___10.factor)=c("Unchecked","Checked")
levels(data$meds___11.factor)=c("Unchecked","Checked")
levels(data$meds___12.factor)=c("Unchecked","Checked")
levels(data$meds___13.factor)=c("Unchecked","Checked")
levels(data$meds___14.factor)=c("Unchecked","Checked")
levels(data$bp_meds___1.factor)=c("Unchecked","Checked")
levels(data$bp_meds___2.factor)=c("Unchecked","Checked")
levels(data$bp_meds___3.factor)=c("Unchecked","Checked")
levels(data$bp_meds_buy.factor)=c("Yes","No")
levels(data$lab_test.factor)=c("No","Yes")
levels(data$insu_bp_visit.factor)=c("Yes","No")
levels(data$miss_appoint.factor)=c("Never","Few times","Some times","Most times","All times")
levels(data$diff_get_drugs.factor)=c("Less than half the time","About half the time","All the time")
levels(data$meds_concern.factor)=c("Yes","No")
levels(data$med_assistance.factor)=c("Yes","No")
levels(data$reasons_for_herbs.factor)=c("Advice from friends and relatives","Advertisement on mass media","Self decision","Advice from health professionals","Other reasons")
levels(data$dietician.factor)=c("Yes","No")
levels(data$health_rate_after_1yr.factor)=c("Much better now than one year ago","Somewhat better now than one year ago","About the same","Somewhat worse now than one year ago","Much worse than one year ago")
levels(data$hpt_reactions___1.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___2.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___3.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___4.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___5.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___6.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___7.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___8.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___9.factor)=c("Unchecked","Checked")
levels(data$hpt_reactions___10.factor)=c("Unchecked","Checked")
levels(data$health_rate.factor)=c("Excellent","Very Good","Good","Fair","Poor")
