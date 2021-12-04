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


data_category_split_out <- dataclean %>%
  mutate(Category.Codes = trim(strsplit(as.character(Category.Codes), "|", fixed = TRUE))) %>%
  unnest(Category.Codes) %>% pivot_wider(names_from = Category.Codes,values_from =Category.Codes, values_fn = length)

donor_dat_tiday

datacleaning %>% group_by(ID) %>% count() %>% arrange(desc(n))

test <- pivot_wider(data = data_category_split_out,names_from = Category.Codes,values_from =Category.Codes, values_fn = length)

install.packages("stringr")
library("stringr")

str_split_fixed(dataclean$Category.Codes,"|",2)

pivot_wider(test,names_from = Category.Codes,values_from =Category.Codes, values_fn = length)



install.packages("gdata")
library("gdata")

data_category_split_out %>% count(ID)
