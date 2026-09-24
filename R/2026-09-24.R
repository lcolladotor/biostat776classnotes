as.logical(-3:3)
-3:3 != 0

as.integer(c("0", "1", "2"))
as.integer("a")

## Code I ran in a terminal window:
# $ R --vanilla
# > library(colorout)
# > as.integer("a")
# [1] NA
# Warning message:
# NAs introduced by coercion

m <- 1:10
m
typeof(m)
dim(m) <- c(2, 5)
m
attributes(m)
class(m)


x <- 1:3
y <- 10:12
cbind(x, y)
t(cbind(x, y))
z <- rbind(y, x)
z[2, 2]
z


f <- factor(c(3, 0, 1, 1, 0, 3))
f
unclass(f)
mean(unclass(f))
mean(c(3, 0, 1, 1, 0, 3))

x <- 1:4
names(x)
names(x) <- c("New York", "Seattle", "Los Angeles", "Seattle")
x
x["Seattle"]
## I was expecting the output to be like:
x[names(x) == "Seattle"]
## But I forgot that x["Seattle"] just returns the first match

x <- runif(n = 1, min = 0, max = 10)
x

## Example for loop with some lengthy computations, where
## printing status updates with the time will be quite useful
for (i in 1:10) {
  message(Sys.time(), " - working on iteration ", i)
  Sys.sleep(runif(n = 1, min = 5, max = 8))
}

## Contents of the example Qmd file I made:

# ---
# title: "Untitled"
# format: html
# ---
#
# ```{r}
# temp <- runif(1, min = 0, max = 10)
# temp <- 1.26
# ```
#
# ```{r, eval = temp > 5, echo = temp > 5}
# print("it's going be warm")
# ```
