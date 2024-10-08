x_typo <- c("Dec", "Apr", "Jam", "Mar")
month_levels <- c(
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)
y_typo <- factor(x_typo, levels = month_levels)
y_typo
if(any(is.na(y_typo))) {
    warning("We have some silent NAs. Let's check the data!")
}
x_typo[is.na(y_typo)]


relig_summary <- gss_cat %>%
    group_by(relig) %>%
    summarise(
        tvhours = mean(tvhours, na.rm = TRUE),
        n = n()
    )

relig_summary %>%
    ggplot(aes(x = tvhours, y = relig)) +
    geom_point()


## Starting this exercise
## https://lcolladotor.github.io/jhustatcomputing/posts/22-working-with-factors/#fct_reorder
library("tidyverse")
library("palmerpenguins")
penguins %>% glimpse()

## 1. Calculate the average bill_length_mm for each species
bill_info <- penguins %>%
    group_by(species) %>%
    summarise(
        bill_length_mm = mean(bill_length_mm, na.rm = TRUE)
    )
## 2. Create a scatter plot showing the average for each species.
bill_info %>%
    ggplot(aes(x = bill_length_mm, y = species)) +
    geom_point()
## 3. Go back and reorder the factor species based on the average bill length from largest to smallest.
bill_info %>%
    mutate(species = fct_reorder(species, bill_length_mm, .desc = TRUE)) %>%
    ggplot(aes(x = bill_length_mm, y = species)) +
    geom_point()
## 4. Now order it from smallest to largest
bill_info %>%
    mutate(species = fct_rev(fct_reorder(species, bill_length_mm, .desc = TRUE))) %>%
    ggplot(aes(x = bill_length_mm, y = species)) +
    geom_point()
