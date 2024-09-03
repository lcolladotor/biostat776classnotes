## Using 2 R functions directly (composition)
standings <- read.csv(
    here::here("data", "team_standings.csv")
)

## Using the same functions with an intermediary
## object called "standings_file"
standings_file <- here::here("data", "team_standings.csv")
read.csv(standings_file)

## Example for reading R code
source(
    here::here("R", "2024-08-29.R"),
    echo = TRUE
)

## Examples showing that load() will overwrite objects you have already
x <- 1:5
x
save(x, file = here::here("data", "x_2024.Rdata"))

x <- rnorm(5)
x
load(here::here("data", "x_2024.Rdata"), verbose = TRUE)
x ## This is 1:5, not the output of rnorm(5)

## Note that assigning the output of load() doesn't work
y <- load(here::here("data", "x_2024.Rdata"), verbose = TRUE)
y


## For a single R object, it's best to use saveRDS() and readRDS()
x <- 1:5
saveRDS(x, file = here::here("data", "x_2024.Rds"))

x <- rnorm(5)
## With readRDS() you control which object it gets assigned to
y <- readRDS(file = here::here("data", "x_2024.Rds"))
x ## It didn't overwrite "x"
y ## Here we decided to assign the output of "x_2024.Rds" into the object "y"



## Save standings for later
saveRDS(standings, file = here::here("data", "standings.Rds"))

## Download 'data' from https://github.com/lcolladotor/jhustatcomputing/tree/main/data
## This will download the full course from GitHub.
usethis::use_course(
    "lcolladotor/jhustatcomputing",
    destdir = here::here()
)

## Now you can copy the "data" directory from
## "lcolladotor-jhustatcomputing-(git sha 1 digits|letters)/data" to
## "data"

## Here we can do this automatically with this R code, though you can also
## do it manually via a File Browser window.
full_course_local <- dir(
    path = here::here(),
    pattern = "^lcolladotor-jhustatcomputing-",
    full.names = TRUE
)
full_course_local
file.copy(
    from = file.path(
        full_course_local,
        "data"
    ),
    to = here::here(),
    overwrite = TRUE,
    recursive = TRUE
)

## We can then delete the course contents if we want to
unlink(
    x = full_course_local,
    recursive = TRUE
)
