## Recycling review
## https://lcolladotor.github.io/jhustatcomputing/posts/08-managing-data-frames-with-tidyverse/index.html#creating-a-tibble

library("tibble")
tibble(
    a = 1:5,
    b = 6:10,
    c = 1,
    z = (a + b)^2 + c
)
## Q1: Which column got recycled?

set.seed(20240919)
data.frame(
    x = 1:10,
    y = rnorm(10),
    in_group = c(TRUE, FALSE)
)
## Q2a: Will this work?
## Q3a: How ill in_group look like?

set.seed(20240919)
data.frame(
    x = 1:10,
    y = rnorm(10),
    in_group = c(TRUE, FALSE, NA)
)
## Q2b: Will this work?
## Q3b: How ill in_group look like?



## Review %in% operator:
## it returns a vector with length equal to the
## length of the left side vector to %in%
"b" %in% letters
letters %in% "b"

## %in% is not to be confused with the in from:
##     for(i in vector)
##           ^
