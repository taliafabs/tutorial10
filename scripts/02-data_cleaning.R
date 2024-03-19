#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("/Users/talia/sta302tutorial10/data/raw_data/americaspoliticalpulsew52024.csv")

# Add labels
raw_data <- labelled::to_factor(raw_data)

# add an age column
raw_data <- raw_data |>
  mutate(age = 2024 - birthyr)


poll_analysis_data <- raw_data |>
  select(
    pid7,
    presvote16post,
    presvote20post,
    age,
    gender,
    race,
    educ,
    inputstate
  )


poll_analysis_data <- poll_analysis_data |>
  mutate(vote_biden = ifelse((pid7 == "Not very strong Democrat" |
                                pid7 == "Lean Democrat" |
                                pid7 == "Strong Democrat") & presvote16post != "Donald Trump" & presvote20post != "Donald Trump", 
                             1, 
                             0))

write_csv(poll_analysis_data, "data/analysis_data/cleaned_poll_data.csv")
