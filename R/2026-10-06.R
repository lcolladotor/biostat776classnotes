library("lubridate")
library("tidyverse")

x <- ymd("1970-01-01")
class(x)
x
mdy(c("January 31st, 2017", "Jan-15-1987"))


## Creating date and date-time objects with
## dplyr and lubridate
library("nycflights13")

## date object example
flights %>%
  select(year, month, day)

flights %>%
  select(year, month, day) %>%
  mutate(departure = make_date(year, month, day))

## date-time object exercise
flights %>%
  select(year, month, day, hour, minute) %>%
  mutate(departure_time = make_datetime(year, month, day, hour, minute))

## Create storm_sub
library(here)
library(readr)
storm <- read_csv(here("data", "storms_2004.csv.gz"), progress = FALSE)
storm
colnames(storm)

## Start by exploring the data we have
storm |>
  select(BEGIN_DATE_TIME, EVENT_TYPE, DEATHS_DIRECT)

## Check how we can create the date-time object
storm |>
  select(BEGIN_DATE_TIME, EVENT_TYPE, DEATHS_DIRECT) |>
  mutate(begin = dmy_hms(BEGIN_DATE_TIME))

## Now put it together by renaming the columns +
## selecting the pieces of info we need
storm_sub <- storm |>
  select(BEGIN_DATE_TIME, EVENT_TYPE, DEATHS_DIRECT) |>
  mutate(begin = dmy_hms(BEGIN_DATE_TIME)) |>
  rename(deaths = DEATHS_DIRECT, type = EVENT_TYPE) |>
  select(begin, type, deaths)
storm_sub
