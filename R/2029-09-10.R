## We are resuming lecture 07 from
## https://lcolladotor.github.io/jhustatcomputing/posts/07-reading-and-writing-data/#reading-data-in-base-r

library("here")
x <- readLines(here("data", "team_standings.csv"))

length(x)
x[1]

## Demo RData
today <- "2026-09-10"
save(x, today, file = here("data", "demo.RData"))

## Simulating a new R session
rm(list = ls())
load(here("data", "demo.RData"), verbose = TRUE)

## Quick demo Rds
saveRDS(today, here("data", "today.rds"))
tomorrow <- readRDS(here("data", "today.rds"))

file.remove(here("data", "today.rds"))
file.remove(here("data", "demo.RData"))
