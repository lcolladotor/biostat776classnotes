## for loops exercise solutions
## https://lcolladotor.github.io/jhustatcomputing/posts/15-control-structures/#for-loops
library("palmerpenguins")
library("dplyr")

## Version we wrote during class
for (var in names(penguins)) {
    print(var)
    var_data <- pull(penguins, var)
    # print(summary(var_data))
    if (is.numeric(var_data)) {
        print(mean(var_data, na.rm = TRUE))
    } else {
        print(NA)
    }
}

## Version that I had written before class
for (var in names(penguins)) {
    print(var)
    var_data <- pull(penguins, var)
    if (is.numeric(var_data)) {
        print(mean(var_data, na.rm = TRUE))
    } else {
        print(NA)
    }
}

## Version where we print an informative message
for (var in names(penguins)) {
    var_data <- pull(penguins, var)
    var_mean <- if (is.numeric(var_data)) {
        mean(var_data, na.rm = TRUE)
    } else {
        NA
    }
    message("The variable '", var, "' has a mean of ", round(var_mean, 2))
}

## Version where we store the results in a data frame
result <- data.frame(
    variable = names(penguins),
    mean = NA
)
for (var in names(penguins)) {
    var_data <- pull(penguins, var)
    var_mean <- if (is.numeric(var_data)) {
        mean(var_data, na.rm = TRUE)
    } else {
        NA
    }
    result[result$variable == var, "mean"] <- var_mean
}
result

## Links from class today:
## https://www.one-tab.com/page/GQG3Km8RQOiMU7ixF_Glxw
