## Install usethis if you don't have it
if (!requireNamespace("usethis", quietly = TRUE)) {
    install.packages("usethis")
}

usethis::create_project("~/some_path/biostat776classnotes") ## wherever you want

if (FALSE) {
    ## For class live demo
    usethis::create_project("~/Desktop/biostat776classnotesLiveDemo")
}

## Optional: git + GitHub setup (see Project 0 for detailed steps)
usethis::use_git()
usethis::use_github()

## Create a file for today's notes
usethis::use_r("2024-09-05.R")

## Download all "data" from the course repository
## See code at https://courseplus.jhu.edu/core/index.cfm/go/bbs:topic.view/bbsTopicID/184903/coid/21836/

## Load chicago dataset available at
## https://github.com/lcolladotor/jhustatcomputing/blob/main/data/chicago.rds
library("tidyverse")
library("here")
chicago <- readRDS(here("data", "chicago.rds"))

## Tibble from scratch with coercing a double to integer
tibble(
    a = 1:5,
    b = 6:10,
    c = 1L,
    z = (a + b)^2 + c
)

## Back to the class example
df <- tibble(
    a = 1:5,
    b = 6:10,
    c = 1,
    z = (a + b)^2 + c
)

## it's best to subset via column names instead of
## column positions (although it's doable), as columns
## can be re-ordered / dropped / etc and the code can run
## with "silent errors" (no errors detected, but it's not the
## output that was intended)
df[[2]]

## Get the 3rd value from column "b"
df[["b"]][3]

## Overwrite our "chicago" data.frame object with a tibble
class(chicago)
chicago <- as_tibble(chicago)
class(chicago)

## Example with using select() and starts_with() with a
## longer column prefix ("pm2")
library("dplyr")
select(chicago, starts_with("pm2"))

## Non-reprodubible random numbers
rnorm(5)
rnorm(5)

## Make the results reproducible by specifying the
## set.seed() command before the random number generator
## command
set.seed(20240905)
rnorm(5)
set.seed(20240905)
rnorm(5)
