#pacman is a package mangement tool, this function load and installs all necesary packages
pacman::p_load(tidyverse, lubridate, dplyr, 
               ggthemes, pastecs, 
               gridExtra, knitr, kableExtra, 
               ggmap, fastDummies, plotly)

#The lubridate package makes it easier to work with dates and times in R.

#setting working directory 
setwd("C:/Users/cabrooke/Documents/R/696/group project/Group Project/clean data")

#Reading the data in and doing minor initial cleaning in the function call
#reproducible data analysis should really avoid all automatic string to factor conversions.
data <- read.csv("donor_data.csv",
                 stringsAsFactors = FALSE,
                 strip.white = TRUE,
                 na.strings = "")


#Basic Cleaning (Birthdate and Age, ID as a number)
dataCleaning <- data %>%
  mutate(Birthdate = ifelse(Birthdate == "0001-01-01", NA, Birthdate)) %>%
  mutate(Birthdate = mdy(Birthdate)) %>%
  mutate(Age = as.numeric(floor(interval(start= Birthdate, end=Sys.Date())/duration(n=1, unit="years")))) %>%
  mutate(Spouse.Birthdate = ifelse(Spouse.Birthdate == "0001-01-01", NA, Spouse.Birthdate)) %>%
  mutate(Spouse.Birthdate = mdy(Spouse.Birthdate)) %>%
  mutate(Spouse.Age = as.numeric(floor(interval(start= Spouse.Birthdate,
                                                end=Sys.Date())/duration(n=1, unit="years")))) %>%
  mutate(ID = as.numeric(ID))


donor_data_tidy <- datacleaning %>%
  mutate(Category.Codes = strsplit(as.character(Category.Codes), "|", fixed = TRUE)) %>%
  unnest(Category.Codes)

donor_dat_tiday

datacleaning %>% group_by(ID) %>% count() %>% arrange(desc(n))
