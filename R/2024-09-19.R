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


x <- data.frame(foo = 1:4,
    bar = c(T, T, F, F),
    leo = 2:5)
data.matrix(x[, sapply(x, is.integer)])


x <- 1:3
names(x) <- c("New York", "Seattle", "Los Angeles")
x
x["Seattle"]
x[["Seattle"]]

c("morning" = 5, "night" = 8)

## Review %in% operator:
## it returns a vector with length equal to the
## length of the left side vector to %in%
"b" %in% letters
letters %in% "b"

c("a", "ch", "b") %in% letters
ifelse(c("a", "ch", "b") %in% letters, "woo", "boo")

## %in% is not to be confused with the in from:
##     for(i in vector)
##           ^

for (i in 1:10) {
    print(i)
    Sys.sleep(1)
}

## define the loop to iterate over
x <- c("a", "b", "c", "d")

## create for loop
for (i in 1:2) {
    print(x[i])
}
for (i in seq_along(x)) {
    print(x[i])
}

x <- c(x, "leo", "class")
for (i in seq_along(x)) {
    print(x[i])
}

## Explicit vs implicit printing in a for() loop
for (i in 1:10) {
    print(i)
}
i
print(i)
for (i in 1:10) {
    i
}
i

## Doesn't have to be "i"
for (RememberToVote in x) {
    print(RememberToVote)
}


## Example with more than one computation and more than one
## print() call inside a for() loop.
for (i in 1:10) {
    print(i)
    print(i^2)
    print(i^2 + i)
}


## Example where "hello" only exists inside the function f()
f <- function() {
    # this is the function body
    hello <- "Hello, world!\n"
    cat(hello)
}
f()
hello ## This will return an error

## Set i on the global environment via a for() loop
for (i in 1:10) {
    i
}
i ## Q: What is the value of "i" at the end of the for() loop?

## f() with an argument
f <- function(num) {
    for (i in seq_len(num)) {
        hello <- "Hello, world!\n"
        cat(hello)
    }
}
f(3)
i ## Q: What is the value of "i" going to be?

f <- function(num) {
    for (internal_i in seq_len(num)) {
        hello <- "Hello, world!\n"
        cat(hello)
    }
}
f(3)
i ## Q: What is the value of "i" going to be?

