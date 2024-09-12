library("tidyverse")
library("here")
maacs <- read_csv(here("data", "bmi_pm25_no2_sim.csv"),
    col_types = "nnci"
)
maacs

g <- ggplot(maacs, aes(
    x = logpm25,
    y = NocturnalSympt
))

g + geom_point(aes(color = bmicat), size = 4, alpha = 1 / 10)


ggplot(maacs, aes(
    x = logpm25,
    y = NocturnalSympt,
    color = bmicat
)) + geom_point(size = 4, alpha = 1 / 2)

## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Customizing a smoother"
#| message: false
g +
    geom_point(aes(color = bmicat),
        size = 2,
        alpha = 1 / 2
    ) +
    geom_smooth(
        linewidth = 4,
        linetype = 3,
        method = "lm",
        se = FALSE
    )

## Let's check how linetype = 2 looks like (it's a dashed line)
## with a regular line width (aka 1 instead of 4)
g2 <- g +
    geom_point(aes(color = bmicat),
        size = 2,
        alpha = 1 / 2
    ) +
    geom_smooth(
        linewidth = 1,
        linetype = 2,
        method = "lm",
        se = FALSE
    )

## List all "theme_" functions
apropos("theme_")

## Palmerpenguins example with the dark theme
library("palmerpenguins")
penguins


## Answer to
## https://lcolladotor.github.io/jhustatcomputing/posts/13-ggplot2-plotting-system-part-2/#smooth
penguins %>%
    ggplot(mapping = aes(x = flipper_length_mm, y = bill_length_mm, color = species)) +
    geom_point() +
    geom_smooth(method = "lm") +
    theme_dark(base_size = 20)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Modifying plot labels"
g +
    geom_point(aes(color = bmicat)) +
    labs(title = "MAACS Cohort") +
    labs(
        x = expression("log " * PM[2.5]),
        y = "Nocturnal Symptoms"
    )

## Changing the legend title for "color"
g +
    geom_point(aes(color = bmicat)) +
    labs(title = "MAACS Cohort") +
    labs(
        x = expression("log " * PM[2.5]),
        y = "Nocturnal Symptoms",
        color = "BMI category"
    )

options(width = 120)
sessioninfo::session_info()
