library("palmerpenguins")
table(penguins$species)
penguins

library("ggplot2")
qplot(displ, hwy, data = mpg, color = drv)
# x: flipper_length_mm
# y: bill_length_mm
# color: species

## Change where the data comes from
qplot(displ, hwy, data = penguins, color = drv)

## Change x
qplot(flipper_length_mm, hwy, data = penguins)

## Change y
qplot(flipper_length_mm, bill_length_mm, data = penguins)

## Change colors and we are done ^_^
qplot(flipper_length_mm, bill_length_mm, data = penguins, colour = species)


## Now let's add a smooth line
qplot(flipper_length_mm, bill_length_mm, data = penguins, geom = c("point", "smooth"))

## If we add back 'color = species', how many lines do we expect to see?
qplot(flipper_length_mm, bill_length_mm, data = penguins, geom = c("point", "smooth"), color = species)

## Can you guess that type of plot this is going to make?
## No? Neither can I!
qplot(hwy, data = mpg, fill = drv)

## We can control things more when we specify the 'geom' argument
qplot(drv, hwy, data = mpg, geom = "boxplot", fill = drv)

## Facets: by row
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)
## by column
qplot(hwy, data = mpg, facets = . ~ drv, binwidth = 2)

## Adding the color back
qplot(hwy, data = mpg, facets = . ~ drv, binwidth = 2, fill = drv)
