#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
poll_data <- read_csv("data/analysis_data/cleaned_poll_data.csv")

### Model data ####
vote_model <-
  stan_glm(
    formula = vote_biden ~ age + gender + race,
    data = poll_data,
    family = binomial(link="logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  vote_model,
  file = "models/vote_model.rds"
)


