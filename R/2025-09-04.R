## For locating the data
library("here")

x <- 1:5
args(save)
save(x, file = here("data", "x.Rda"))
args(saveRDS)
saveRDS(x, file = here("data", "x.Rds"))
list.files(path = here("data"))

## Load the data back in

new_x1 <- readRDS(here("data", "x.Rds"))
new_x1

stopifnot(
    identical(x, new_x1)
)

new_x2 <- load(here("data", "x.Rda"), verbose = TRUE)
new_x2

rm(x)
ls()
x <- "hola"
load(here("data", "x.Rda"), verbose = TRUE)
args(load)
ls()
x

## Clean up
file.remove(here("data", "x.Rda"))
file.remove(here("data", "x.Rds"))


## How much RAM do I have available?
benchmarkme::get_ram()


## For locating the data
library("here")

## Read in the chicago dataset
chicago <- readRDS(here("data", "chicago.rds"))

## Explore the chicago dataset interactive
View(chicago)
