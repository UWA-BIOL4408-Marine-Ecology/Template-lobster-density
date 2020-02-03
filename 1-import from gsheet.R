

# Import from gsheet

# A very handy short-cut.
Shift-windows-c


# Annotate your scripts - use the "#' short cut to write annotations



# Install missing packages

# install.packages("googlesheets4")
# install.packages("here")


library(googlesheets4) #to read gsheet
library(tidyr) #to tidy data
library(dplyr) #to transform data
library(readr) #to write data
library(here) #to make robust links to files




# It is useful to set a study name

study<-"lobster.density"


#We need the URL for the google sheet
url <- "https://docs.google.com/spreadsheets/d/1Wqn7m2jopx11n5fdl9MHZAujRVkjBusdmIHq_gMhf0A"

options(httr_oob_default=TRUE)

# Then we can read it in - this will ask you to authenticate your google sheet access
dat<-read_sheet(url, sheet = "lobster.density")%>%
  as_tibble()%>%
  select(-c('longitude','latitude','time','way.point','gps','depth','group'))%>%
  glimpse()


# Create data directory

dir.create(file.path(here(), "workspace", "Template-lobster-density","Data")) #create Data folder

data.dir <- here("workspace","Template-lobster-density","Data")


# Set the data directory - so we can write to it

setwd(data.dir)#this is our shortcut using here()
dir()


write_csv(dat,paste(study,"gsheet","csv",sep = "."))
