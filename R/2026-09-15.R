library("here")
chicago <- readRDS(here("data", "chicago.rds"))
library("dplyr")
chicago <- as_tibble(chicago)

## Example of saving the output of pipe commands
library("tidyverse")
income_tidy <- relig_income %>%
  pivot_longer(
    -religion,
    names_to = "income",
    values_to = "respondents"
  ) %>%
  mutate(
    religion = factor(religion),
    income = factor(income)
  )

identical(income_tidy, relig_income)

relig_income %>%
  pivot_longer(
    -religion,
    names_to = "income",
    values_to = "respondents"
  ) %>%
  mutate(
    religion = factor(religion),
    income = factor(income)
  ) -> income_tidy_right

identical(income_tidy, income_tidy_right)
