library(gtsummary)
library(tidyverse)

uhype2 <- uhype %>% 
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
  ) %>% 
  select(same_doctor) %>% 
  table()

uhype2 %>% 
  select(
    site, 
    age, 
    sex, 
    relationship, 
    occup, 
    educ, 
    insurance, 
    financial_difficulties,
    contains("meds__"),
    bp_meds_buy) %>% 
  tbl_uvregression(
    y = bp_meds_buy,
    method = glm,
    exponentiate = T,
    method.args = list(family = "binomial")
    #add_estimate_to_reference_rows = T
  )

  as_tibble

(((hypertension[Title]) OR (high blood pressure[Title]) ) AND (2010:2022[pdat])) AND (((cost*[Title]) or (finance[Title])))