## From lecture 07

## For locating the data
library("here")

## Create an R object
x <- 1:5
## Let's check the arguments of the save() function
args(save)
## Save the data with save()
save(x, file = here("data", "x.Rda"))
## Let's do the same thing with saveRDS()
args(saveRDS)
saveRDS(x, file = here("data", "x.Rds"))

## Let's check the files we have under our data/ folder
list.files(path = here("data"))

## Load the data back in
new_x1 <- readRDS(here("data", "x.Rds"))
new_x1

## Check that the objects are identical
stopifnot(
    identical(x, new_x1)
)

## load() is a bit different and returns the object name(s)
## the .Rda file contains
new_x2 <- load(here("data", "x.Rda"), verbose = TRUE)
new_x2

## Let's delete the x object
rm(x)
ls()
load(here("data", "x.Rda"), verbose = TRUE)
args(load) ## Regretabbly, the default is verbose = FALSE although
## it is very useful to see what objects are being loaded
ls()
x

## Let's create an x object, this time with the word
## "hola" as its contents
x <- "hola"
## Will load() overwrite our existing x object? Answer: Yes
load(here("data", "x.Rda"), verbose = TRUE)
args(load)
ls()
x

## Clean up our data directory
file.remove(here("data", "x.Rda"))
file.remove(here("data", "x.Rds"))


## How much RAM do I have available?
benchmarkme::get_ram()


## Moving unto lecture 08

## For locating the data
library("here")

## Read in the chicago dataset
chicago <- readRDS(here("data", "chicago.rds"))
class(chicago)
chicago

## Let's convert it from a data.frame to a tibble
library("tidyverse")
chicago <- as_tibble(chicago)
class(chicago)
chicago


## Explore the chicago dataset interactive
View(chicago)

## Piping dplyr functions together using the %>% operator
chicago %>%
    select(date, pm25tmean2) %>%
    filter(pm25tmean2 > 30)

## or the base R pipe |>
chicago |>
    select(date, pm25tmean2) |>
    filter(pm25tmean2 > 30)

## Changing the order of operations
chicago |>
    filter(pm25tmean2 > 30) |>
    select(date, tmpd)

## Links from class today:
## https://www.one-tab.com/page/hXPzTkvcRPOk6EVXzhO_Aw
