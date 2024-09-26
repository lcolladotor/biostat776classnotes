set.seed(20240926)
## Generate a data frame with a variable that has
## very large numbers (above 10 ^ 9)
df <- data.frame(
    large_num = runif(10, min = 1e10, max = 1e14)
)
## Print automatically displays large numbers
## using the scientific notation where
## 1e3 means 1 * 10^3
## 1e9 means 1 * 10^9
df
df$large_num[1]


library("dplyr")
## Transform the numbers by dividing by 1 billion
## (aka 1,000,000,000).
## As an aside, billions in Mexico are
## 1,000,000,000,000
df2 <- mutate(df,
    large_num = large_num / 1000000000)
## The numbers are small enough that R doesn't
## use the e syntax anymore
df2

## Don't overwrite "large_num"
## and use the 1e syntax
df3 <- mutate(df,
    large_num_new_name = large_num / 1e9)
df3
identical(df2$large_num, df3$large_num_new_name)



## Class notes for today.
sumsq <- function(mu, sigma, x) {
    sum(((x - mu) / sigma)^2)
}
set.seed(20240926)
x <- rnorm(100)

## This works because of recycling
sumsq(mu = 1:10, sigma = 1:10, x = x)
length(x) / length(1:10) ## lengths are compatible for recycling
sum(((x - rep(1:10, 10)) / (rep(1:10, 10)))^2) ## This is how 1:10 was recycled

## Let's make the recycling more evident
sumsq(mu = 1:11, sigma = 1:11, x = x)
length(x) / length(1:11) ## lengths are not compatible for recycling


## You can loop through things with a for() loop
res <- vector("numeric", length = 10L)
for(i in 1:10) {
    res[i] <- sumsq(mu = i, sigma = i, x = x)
}
res

## Or you can make a vectorized function with Vectorize()
vsumsq <- Vectorize(sumsq, c("mu", "sigma"))
vsumsq(1:10, 1:10, x)


## From colorout's README documentation
x <- data.frame(
    logic = c(TRUE, TRUE, FALSE),
    factor = factor(c("abc", "def", "ghi")),
    string = c("ABC", "DEF", "GHI"),
    real = c(1.23, -4.56, 7.89),
    cien.not = c(1.234e-23, -4.56 + 45, 7.89e78),
    date = as.Date(c("2012-02-21", "2013-02-12", "2014-03-04"))
)
rownames(x) <- seq_len(3)
x
summary(x[, c(1, 2, 4, 6)])
warning("This is an example of a warning.")
example.of.error
library("KernSmooth")
colorout::setOutputColors()


## log(-1) example
l <- log(c(-1, 5, 10))
## Since we saw the warning, we can adjust our code accordingly and use
## na.rm = TRUE
mean(l, na.rm = TRUE)
## Otherwise we'd get no result back
mean(l)


## Code from the course website
print_message2 <- function(x) {
    if (is.na(x)) {
        print("x is a missing value!")
    } else if (x > 0) {
        print("x is greater than zero")
    } else {
        print("x is less than or equal to zero")
    }
    invisible(x)
}

## Edited version that uses return() instead of invisible() at the end
print_message2.edit <- function(x) {
    if (is.na(x)) {
        print("x is a missing value!")
    } else if (x > 0) {
        print("x is greater than zero")
    } else {
        print("x is less than or equal to zero")
    }
    return(x)
}

## x is not printed in this case at the end (since we want the output of the
## function to be invisible)
print_message2(NA)
## x is printed in this case, which is the default behavior with return()
print_message2.edit(NA)


print_message3_tidyverse <- function(x) {
    if (length(x) > 1L) {
        rlang::abort("'x' has length > 1")
    }
    if (is.na(x)) {
        rlang::warn("x is a missing value!")
    } else if (x > 0) {
        rlang::inform("x is greater than zero")
    } else {
        rlang::inform("x is less than or equal to zero")
    }
    invisible(x)
}
print_message3_tidyverse(99:100)
print_message3_tidyverse(NA)
print_message3_tidyverse(1)


## Code from the course website
print_message3_cli <- function(x) {
    if (length(x) > 1L) {
        len <- length(x)

        ## Avoid the print() calls from
        ## https://github.com/ComunidadBioInfo/praiseMX/blob/master/R/praise_crear_emi.R
        praise_mx_log <- capture.output({
            praise_mx <- praiseMX:::praise_bien()
        })
        cli::cli_abort(
            c(
                "This function is not vectorized:",
                "i" = "{.var x} has length {len}.",
                "x" = "{.var x} must have length 1.",
                ">" = "Try using {.code purrr::map(x, print_message3_cli)} to loop your input {.var x} on this function.",
                "v" = praise::praise(),
                "v" = praise_mx
            )
        )
    }
    if (is.na(x)) {
        rlang::warn("x is a missing value!")
    } else if (x > 0) {
        rlang::inform("x is greater than zero")
    } else {
        rlang::inform("x is less than or equal to zero")
    }
    invisible(x)
}

## Example output with a nicely formatted message
set.seed(20230928)
print_message3_cli(-1:1)


## Correct use of stopifnot(): using it with arguments (objects) that the
## user knows about
foo <- function(x) {
    stopifnot(length(x) == 1)
    x
}
foo(1:2)

## Incorrect use since the user doesn't know about the internal object 'y'
noo <- function(x) {
    y <- x * 2
    stopifnot(length(y) == 1)
    y
}
noo(1:2)

