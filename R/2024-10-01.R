## Q1: How can we find the list of all
## lubridate functions?

## A1: (hint: it's an R package)
?lubridate
help(lubridate)
help(topic = "lubridate")
help(package = "lubridate") ## preferred version

## A2: (hint: it's a tidyverse package!)
## tidyverse packages have nice documentation
## websites (made with pkgdown) which have a
## "reference" tab that lists all the functions
## https://lubridate.tidyverse.org/reference/index.html

## A3: (hint: it was made by RStudio / Posit)
## https://posit.co/resources/cheatsheets/

library("lubridate")
today()

## Answer for the example exercise
## during class.
library("nycflights13")
library("tidyverse")
flights %>%
    select(year, month, day, hour, minute) %>%
    mutate(departure_time = make_datetime(
        year, month, day, hour = hour, min = minute)
        ) %>%
    select(departure_time)

## Example use of .Last.value
x <- .Last.value$departure_time
x[1]
