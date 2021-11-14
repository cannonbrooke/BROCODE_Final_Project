library(here)
library(tidyverse)
library(ggplot2)
library(dplyr)

#loading in data
donors_org <- read.csv(here::here("clean data", "group_project_donorsredacted.csv"))

glimpse(donors_org)

donors_org %>% filter(Donor.Segment == "Lost Donor")

ggplot(data = donors_org, aes(x = Total.Giving.Years, y = Total.Giving.Years)) +
  geom_point()


