x <-  ## Incomplete expression
    print(1)
adsf <- 3

## this is a commment
print(5)

## Using the : syntax for subsetting a
## vector
x <- 11:30
x[1:5]

## Auto-casting in vectors with c() vs
## a list (which can be heterogeneous)
c(1.5, "leo")
leo_list <- list(1.5, "leo")

## doubles are approximations
x <- sqrt(2) ^ 2
x
x - 2

## Whether we start with integers or doubles
## doesn't matter in this case
sqrt(2L) ^ 2L - 2L

## R first is computing the sqrt()
## then it computes the power to the 2
## aka, R doesn't recognize that these
## operations cancel out and that we don't need
## to compute them.
## as sqrt(2) is a real number (has lots of decimals),
## R uses a double to approximate the value.
## This is the first source of the decimals in
## our calculations.
sqrt(2L)

## Example of a recursive list
l <- list(1:20, list("leo", 5:15, letters))

## Manual casting
x <- 0:6
typeof(x)
as.logical(x)
typeof(
    as.logical(x)
)

## We can't get the sequence 0:6 anymore
## even if we try to undo the manual casting
as.integer(
    as.logical(x)
)

## dim() is a shortcut for attributes()$dim
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)$dim
