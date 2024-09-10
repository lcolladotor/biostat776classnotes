## ----message=FALSE-------------------------------------------------------------------------------------------------------
library(tidyverse)

outcomes <- tibble(
    id = rep(c("a", "b", "c"), each = 3),
    visit = rep(0:2, 3),
    outcome = rnorm(3 * 3, 3)
)

## Let's create a non-tidy table where id and visit are combined into a single
## variable.
outcomes_modified <- outcomes %>%
    mutate("id_visit" = paste0(id, "_", visit)) %>%
    select(-(id:visit))
outcomes_modified

## If we had started with non-tidy data, we would have had to clean it up
## using mutate() and other functions as shown below.
outcomes_modified %>%
    mutate(visit = gsub(".*_", "", id_visit), id = gsub("_.*", "", id_visit))

## In any case, our "outcomes" table is tidy to begin with.
print(outcomes)


## ----second_table,exercise=TRUE,message=FALSE----------------------------------------------------------------------------
subjects <- tibble(
    id = c("a", "b", "c"),
    house = c("detached", "rowhouse", "rowhouse")
)

print(subjects)

## Example on how to find all the functions from a given
## R package
help(package = "dplyr")
## Example on how to find all functions currently loaded (aka from library calls)
## that have a specific keyword in their name
library("dplyr")
apropos("join")


## ------------------------------------------------------------------------------------------------------------------------
outcomes
subjects


## ----leftjoin------------------------------------------------------------------------------------------------------------
left_join(x = outcomes, y = subjects, by = "id")
full_join(x = outcomes, y = subjects, by = "id")

## Are left_join() and full_join() giving us the same result in this case?
identical(
    left_join(x = outcomes, y = subjects, by = "id"),
    full_join(x = outcomes, y = subjects, by = "id")
)
## Answer: yes. Both tables have info for subjects a, b, and c.

## ------------------------------------------------------------------------------------------------------------------------
subjects <- tibble(
    id = c("a", "b", "c"),
    visit = c(0, 1, 0),
    house = c("detached", "rowhouse", "rowhouse"),
)

print(subjects)


## ------------------------------------------------------------------------------------------------------------------------
left_join(outcomes, subjects, by = c("id", "visit"))

## Do we get a different number of rows with inner_join() in this case than
## with left_join()?
inner_join(outcomes, subjects, by = c("id", "visit"))
## Yes: not all id + visit combinations are observed in the right table, so
## the intersection (inner_join) is going to be smaller.

## ------------------------------------------------------------------------------------------------------------------------
subjects <- tibble(
    id = c("b", "c"),
    visit = c(1, 0),
    house = c("rowhouse", "rowhouse"),
)

subjects


## ------------------------------------------------------------------------------------------------------------------------
left_join(x = outcomes, y = subjects, by = c("id", "visit"))
full_join(outcomes, subjects, by = c("id", "visit"))

## Are left_join() and full_join() giving us the same result in this case?
identical(
    left_join(x = outcomes, y = subjects, by = c("id", "visit")),
    full_join(outcomes, subjects, by = c("id", "visit"))
)
## Answer: yes. The right side table doesn't have any id + visit combinations
## that the left table is missing, so left_join() which prioritizes the left
## table will give the same result as full_join() in this case.

## ------------------------------------------------------------------------------------------------------------------------
inner_join(x = outcomes, y = subjects, by = c("id", "visit"))


## ------------------------------------------------------------------------------------------------------------------------
right_join(x = outcomes, y = subjects, by = c("id", "visit"))












## ------------------------------------------------------------------------------------------------------------------------
#| message: false
library("tidyverse")
library("here")
maacs <- read_csv(here("data", "bmi_pm25_no2_sim.csv"),
    col_types = "nnci"
)
maacs


## ------------------------------------------------------------------------------------------------------------------------
g <- ggplot(maacs, aes(
    x = logpm25,
    y = NocturnalSympt
))
summary(g)
class(g)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Nothing to see here!"
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))
print(g)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Scatterplot of PM2.5 and days with nocturnal symptoms"
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))
g + geom_point()


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Scatterplot with smoother"
#| message: false
g +
    geom_point() +
    geom_smooth()


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Scatterplot with linear regression line"
#| message: false
g +
    geom_point() +
    geom_smooth(method = "lm")


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself

library("palmerpenguins")
penguins


## Answer to
## https://lcolladotor.github.io/jhustatcomputing/posts/13-ggplot2-plotting-system-part-2/#smooth
penguins %>%
    ggplot(mapping = aes(x = flipper_length_mm, y = bill_length_mm, color = species)) +
    geom_point() +
    geom_smooth(method = "lm")
