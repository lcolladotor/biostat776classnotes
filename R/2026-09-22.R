## Notes for
## https://lcolladotor.github.io/jhustatcomputing/posts/14-r-nuts-and-bolts/

x <- ## Incomplete expression
  2 + 2

x_char <- "one"
y_char <- "1"
z_char <- 1

y_char * 2
z_char * 2

leo_list <- list(
  age = c(27, 37, 45),
  height = c(150, 159)
)
leo_list

leo_list2 <- list(
  age = c(27, 37, 45),
  height = c(150, 159, 180)
)
leo_list2
do.call(cbind, leo_list2)

T <- FALSE
c(T, F)
TRUE <- FALSE

x <- sqrt(2)^2
x
x - 2L

y <- c(1.7, "a")
typeof(y)
y

y * 2

y <- c(TRUE, 2, FALSE)
y
typeof(y)

y <- c(TRUE, FALSE, FALSE)
mean(y)
