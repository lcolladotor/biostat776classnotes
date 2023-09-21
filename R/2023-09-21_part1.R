
x <- runif(n = 1, min = 0, max = 10)
x



x > 3



if (x > 3) {
    y <- 10
} else {
    y <- 0
}



y



y <- if (x > 3) {
    10
} else {
    0
}

y


#| message: false
# try it yourself

library(tidyverse)
library(palmerpenguins)
penguins



for (i in 1:10) {
    print(i)
}



## define the loop to iterate over
x <- c("a", "b", "c", "d")

## create for loop
for (i in 1:4) {
    ## Print out each element of 'x'
    print(x[i])
}



## define the loop to iterate over
x <- c("a", "b", "c", "d")

## create for loop
for (i in 1:4) {
    ## Print out just 'i'
    print(i)
}



x
seq_along(x)



## Generate a sequence based on length of 'x'
for (i in seq_along(x)) {
    print(x[i])
}



for (babyshark in x) {
    print(babyshark)
}



for (candyisgreat in x) {
    print(candyisgreat)
}



for (RememberToVote in x) {
    print(RememberToVote)
}



for (1999 in x) {
    print(1999)
}



for (i in 1:4) print(x[i])



# try it yourself



x <- matrix(1:6, nrow = 2, ncol = 3)
x



for (i in seq_len(nrow(x))) {
    for (j in seq_len(ncol(x))) {
        print(x[i, j])
    }
}



count <- 0
while (count < 10) {
    print(count)
    count <- count + 1
}



z <- 5
set.seed(1)

while (z >= 3 && z <= 10) {
    coin <- rbinom(1, 1, 0.5)

    if (coin == 1) { ## random walk
        z <- z + 1
    } else {
        z <- z - 1
    }
}
print(z)



-2:2
((-2:2) >= 0) & ((-2:2) <= 0)



(2 >= 0) && (-2 <= 0)
(-2 >= 0) && (-2 <= 0)


#| eval: false
## x0 <- 1
## tol <- 1e-8
##
## repeat {
##     x1 <- computeEstimate()
##
##     if (abs(x1 - x0) < tol) { ## Close enough?
##         break
##     } else {
##         x0 <- x1
##     }
## }



## for (i in 1:100) {
##     if (i <= 20) {
##         ## Skip the first 20 iterations
##         next
##     }
##     ## Do something here
## }



## for (i in 1:100) {
##     print(i)
##
##     if (i > 20) {
##         ## Stop loop after 20 iterations
##         break
##     }
## }



options(width = 120)
sessioninfo::session_info()