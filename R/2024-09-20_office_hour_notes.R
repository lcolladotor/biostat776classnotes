## Code written by the person who made the function f()
f <- function(num) {
    hello <- "Hello, world!\n"
    for (i in seq_len(num)) {
        cat(hello)
    }
    chars <- nchar(hello) * num
    chars
}

## Code written by the user of f()
f()
## Users are forced to specify a value for the argument "num"
f(num = 2)
f(2)

## Create a version of f() with a default value for "num"
## (here we have the default as 1)
f <- function(num = 1) {
    hello <- "Hello, world!\n"
    for (i in seq_len(num)) {
        cat(hello)
    }
    chars <- nchar(hello) * num
    chars
}

## Using f() with no "num" in our global environment
stopifnot(!"num" %in% ls()) ## formally check that "num"
## doesn't exist
f() ## "num" will be created inside of the function f()
## with the default value of 1
f(num = 3) ## Use the code inside f() with num = 3

num <- 4
f() ## Here even though "num" exists on the global
## environment, "num" inside f() uses the default value of 1


## We could have called our argument "number_of_iterations"
## instead of "num"
f <- function(number_of_iterations = 1) {
    hello <- "Hello, world!\n"
    for (i in seq_len(number_of_iterations)) {
        cat(hello)
    }
    chars <- nchar(hello) * number_of_iterations
    chars
}
f("a")
f(0)
f(1)

f <- function(number_of_iterations = 1) {
    ## Check that the user provided the right type of input
    stopifnot(is.numeric(number_of_iterations))
    stopifnot(number_of_iterations >= 1)

    hello <- "Hello, world!\n"
    for (i in seq_len(number_of_iterations)) {
        cat(hello)
    }
    chars <- nchar(hello) * number_of_iterations
    chars
}
f("a")
f(0)
f(1)

