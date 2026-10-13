which(grepl("[Ii]", c("Hawaii", "Illinois", "Kentucky")))

library("stringr")
to_trim <- c("   space", "the    ", "    final frontier  ")
str_trim(to_trim)
str_trim(to_trim) |> str_detect("^s")
str_detect(to_trim, "^\\s*s")


r <- "^(?:(((?:[^:])+)://))?((?:(?:(?!:/).)*)+)(?:(:([[:digit:]]+)))?(?:(/.*))?$"

## Factors lecture
x <- c("Dec", "Apr", "Jan", "Mar")
x_typo <- c("Dec", "Apr", "Jam", "Mar")
month_levels <- c(
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
)
y <- factor(x, levels = month_levels)
y
unclass(y)

y_typo <- factor(x_typo, levels = month_levels)
y_typo
stopifnot(!any(is.na(y_typo)))
x_typo[is.na(y_typo)]


income_level <- c(
  rep("low", 10),
  rep("medium", 10),
  rep("high", 10)
)
income_level
y <- rnorm(30) # generate some random obs from a normal dist
lm(y ~ income_level)
x <- factor(income_level)
lm(y ~ x)
x2 <- factor(income_level, levels = c("low", "medium", "high"))
lm(y ~ x2)

## Do it yourself with the palmerpenguins dataset
library("palmerpenguins")
library("dplyr")
library("forcats")
library("ggplot2")
glimpse(penguins)
pen_data <- penguins |>
  group_by(species) |>
  summarize(
    avg_bill = mean(bill_length_mm, na.rm = TRUE),
    n = n()
  )
pen_data

pen_data |>
  ggplot(aes(x = avg_bill, y = species)) +
  geom_point()

pen_data |>
  mutate(species = fct_reorder(species, avg_bill)) |>
  ggplot(aes(x = avg_bill, y = species)) +
  geom_point()

pen_data |>
  mutate(species = fct_reorder(species, avg_bill)) |>
  mutate(species = fct_rev(species)) |>
  ggplot(aes(x = avg_bill, y = species)) +
  geom_point()

pen_data |>
  mutate(species = fct_reorder(species, avg_bill, .desc = TRUE)) |>
  ggplot(aes(x = avg_bill, y = species)) +
  geom_point()

pen_data |>
  mutate(species = fct_reorder(species, avg_bill, .desc = FALSE)) |>
  ggplot(aes(x = avg_bill, y = species)) +
  geom_point()
