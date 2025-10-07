## Install both cowsay and fortunes so we
## can generate a random fortune from a cow
install.packages(c("cowsay", "fortunes"))

## Example using the "cowsay" package
library("cowsay")
library("fortunes")
cowsay::say("fortune", by = "cow")

## Do you want a fortune said by a cow every
## time you start R?

## If your answer is yes, run the following line
usethis::edit_r_profile()

## Add these lines to your .Rprofile
if (
    !requireNamespace("cowsay", quietly = TRUE) |
        !requireNamespace("fortunes", quietly = TRUE)
) {
    cat(
        'To install cowsay and fortunes use: install.packages(c("cowsay", "fortunes"))\n'
    )
} else {
    library("cowsay")
    library("fortunes")
    cowsay::say("fortune", by = "cow")
}


grepl("[a-m]", tolower("ABC"))


# 1. Calculate the average bill_length_mm for each species
# 2. Create a scatter plot showing the average for each species.
# 3. Go back and reorder the factor species based on the average bill length from largest to smallest.
# 4. Now order it from smallest to largest
library("tidyverse")
library("palmerpenguins")

penguins %>%
    group_by(species) %>%
    summarize(avg_bill_length = mean(bill_length_mm, na.rm = TRUE)) %>%
    ggplot(aes(x = species, y = avg_bill_length)) +
    geom_point()

args(forcats::fct_reorder)
?forcats::fct_reorder

penguins %>%
    group_by(species) %>%
    summarize(avg_bill_length = mean(bill_length_mm, na.rm = TRUE)) %>%
    mutate(species = fct_reorder(species, avg_bill_length, .desc = TRUE)) %>%
    ggplot(aes(x = species, y = avg_bill_length)) +
    geom_point()

penguins %>%
    group_by(species) %>%
    summarize(avg_bill_length = mean(bill_length_mm, na.rm = TRUE)) %>%
    mutate(species = fct_reorder(species, avg_bill_length, .desc = FALSE)) %>%
    ggplot(aes(x = species, y = avg_bill_length)) +
    geom_point()
