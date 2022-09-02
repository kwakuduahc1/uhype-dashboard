library(gtsummary)
library(tidyverse)

uhype <- uhype %>% 
  # select(-c(no_occp_1, redcap_repeat_instrument, redcap_repeat_instance, other_meds)) %>% 
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
    ),
    #same_doctor = fct_anon(.)
  ) 

rpt <- uhype %>% 
  filter(redcap_repeat_instance >1)
rpt %>% 
  mutate(
    across(-id, as.character)
  ) %>% 
  pivot_longer(-id) %>% 
  drop_na() %>% 
  filter(value == 1)

main <- uhype %>% 
  filter(redcap_repeat_instrument == "") %>% 
  select(-c(providers_comment___1:current_med___13), -contains("redcap"))


docs <- uhype %>% 
  filter(redcap_repeat_instrument != "") %>% 
  select(id, c(providers_comment___1:current_med___13)) %>% 
  pivot_longer(-id) %>% 
  filter(value >= 0) %>% 
  pivot_wider(id_cols = id, names_from = name, values_from = value, values_fn = max)

main %>% 
  full_join(docs)


uhype %>% 
  select(-contains("hpt_reactions"), -c(id, no_occp_1, assistance, comorbidity, multidrug, health_rate, providers_comment___5, others), -contains("redcap")) %>% 
  tbl_summary(
    missing = "no",
    type = list(
      everything() ~ "categorical",
      c(age, facilities_attended, more_than_1_facility, bp_check_month, hpt_follow_up) ~ "continuous"
    )
  )
# (((Ghana) AND ((Hypertension) OR (High Blood Pressure)) AND (Expenditure))[Abstract])