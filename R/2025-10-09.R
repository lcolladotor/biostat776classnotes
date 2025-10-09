## Reviewing automatic coercion of a logical vector
## to an integer vector when using the mean() function
mean(c(TRUE, TRUE, FALSE))
as.integer(c(TRUE, TRUE, FALSE))
mean(as.integer(c(TRUE, TRUE, FALSE)))

## Reviewing cumulative sum of a numeric vector
1:3
cumsum(1:3)

## Reviewing cumulative sum of a logical vector
cumsum(c(TRUE, TRUE, FALSE))
