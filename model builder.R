uhype2 <- uhype %>% 
mutate(
  bp_meds_buy = fct_relevel(bp_meds_buy, "No", "Yes")
) %>% 
  select(id, age, sex, herbs_for_hpt, drugs, comob, med_runout, ins_type___2, same_doctor, related, systol, comob, drugs, miss_appoint, feeling, systol, bp_meds_buy) %>% 
  drop_na()


set.seed(200)
train <- slice_sample(uhype2, prop = .90, weight_by = sex)
test <- uhype %>% 
  anti_join(
    train, by = c("id" = "id")
  )

mod <- glm(formula = bp_meds_buy ~ sex*age + sex * systol  + age + drugs,
           family = binomial, data = train)
mod %>% 
  summary()

pred <- predict(mod, newdata = test, type = "response") %>% as_tibble()
# hist(pred$value)
pred <- pred %>% 
  mutate(
    value = if_else(value > .55, 1, 0),
    value = factor(value, labels = c("Difficulty", "No difficulty"),
                   levels = 1:0),
    orig = test$financial_difficulties
  )

table(pred$value)
table(pred$value, pred$orig) %>% prop.table(margin = 2)

tbl_regression(
  mod, exponentiate = T,
  intercept = T, 
  conf.int = F,
  pvalue_fun =  function(x){style_pvalue(x, digits = 3)}
  )
