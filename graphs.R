library(bayestestR)
options(mc.cores = parallel::detectCores())
library(rstanarm)
library(modelbased)
library(gtsummary)
library(ggpubr)
library(tidyverse)

bmod <- uhype %>% 
  stan_glm(bp_meds_buy ~ sex + age + systol + related + comob + ins_type___1 + drugs, data = ., family = binomial(), iter = 50000, chain = 3, prior = cauchy()) #%>% 

params <- bmod %>% describe_posterior(centrality = "median", test = c("pd", "ROPE", "BF"))

params
estimate_prediction(bmod) %>%  
  ggscatter(x = "b_year_i" , y = "Predicted", facet.by = "h_bieeding_c_u", palette = c("#003f5c", "#bc5090"), cor.coef = T, cor.method = "pearson", color = "outcome",
            title = "Predicting the probability of death from LOS and bleeding", ylab = "Probability of death", xlab = "Age", 
            legend.title = "Outcome")

tbl_regression(bmod, intercept = T, 
               exponentiate = T, 
               tidy_fun = broom.helpers::tidy_parameters,
               label = list(los ~ "Length of stay", h_bieeding_c_u ~ "Bleeding episode", b_year_i ~ "Age in completed years"))%>% 
  modify_footnote(list(ci ~ "CI = Credible Interval", pd ~ "Probability Direction"), abbreviation = T) %>% 
  modify_header(pd = "PD") %>% 
  write_rds("outcome model.rds")

to.pred <- dset %>% 
  mutate(
    h_partbitten_c_u = fct_lump_min(h_partbitten_c_u, min = 9)
  ) %>% 
  filter(is.na(outcome)) %>% 
  select(
    b_record_id_a_i, b_year_i, h_bieeding_c_u, los
  ) %>% 
  drop_na()

estimate_prediction(bmod, to.pred) #%>% 
write_rds("predicted outcome.rds")


t.test(delay ~ nhis, data = dset)

dset %>% 
  count(year) %>% 
  pull(n) %>% 
  median()
