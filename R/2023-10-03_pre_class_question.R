data("airquality")
t1 <- airquality
class(t1$season)
class(t1)
head(t1)
t1$season <- 0L
class(t1$Month)

## This doesn't work, since the condition in the if() is a vector of length > 1
if (t1$Month < 7) {
    t1$season <- 1
} else {
    t1$season <- 2
}

## You could loop through it
for(i in seq_len(nrow(t1))) {
    if (t1$Month[i] < 7) {
        t1$season[i] <- 1L
    } else {
        t1$season[i] <- 2L
    }
}

## Or you could use the ifelse() function which is vectorized
t1$season2 <- ifelse(t1$Month < 7, 1L, 2L)

## Either the for() loop or ifelse() give you the same results
identical(t1$season, t1$season2)
