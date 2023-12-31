## -----------------------------------------------------------------------------------
#| error: true
"hello" + "world"


## -----------------------------------------------------------------------------------
#| warning: true
as.numeric(c("5", "6", "seven"))


## -----------------------------------------------------------------------------------
#| message: true
f <- function() {
    message("This is a message.")
}

f()


## -----------------------------------------------------------------------------------
suppressMessages(f())


## -----------------------------------------------------------------------------------
#| message: true
f2 <- function() {
    message(Sys.time(), " This is a message.")
}

f2()


## -----------------------------------------------------------------------------------
#| eval: false
## stop("Something erroneous has occurred!")


## -----------------------------------------------------------------------------------
#| error: true
name_of_function <- function() {
    stop("Something bad happened.")
}

name_of_function()


## -----------------------------------------------------------------------------------
#| error: true
error_if_n_is_greater_than_zero <- function(n) {
    stopifnot(n <= 0)
    n
}

error_if_n_is_greater_than_zero(5)

error_if_n_is_greater_than_zero_live <- function(n) {
    stopifnot(n <= 0)
    n_squared <- n^2
    stopifnot(n_squared < 10)
    n_squared
}
error_if_n_is_greater_than_zero_live(-2)
error_if_n_is_greater_than_zero_live(-10)

## -----------------------------------------------------------------------------------
#| warning: true
warning("Consider yourself warned!")


## -----------------------------------------------------------------------------------
#| warning: true
make_NA <- function(x) {
    warning("Generating an NA.")
    NA
}

make_NA("Sodium")


## -----------------------------------------------------------------------------------
message("In a bottle.")


## -----------------------------------------------------------------------------------
as.numeric(c("5", "6", "seven"))


## -----------------------------------------------------------------------------------
beera <- function(expr) {
    tryCatch(expr,
        error = function(e) {
            message("An error occurred:\n", e)
        },
        warning = function(w) {
            message("A warning occured:\n", w)
        },
        finally = {
            message("Finally done!")
        }
    )
}


## -----------------------------------------------------------------------------------
beera({
    2 + 2
})

beera({
    "two" + 2
})

beera({
    as.numeric(c(1, "two", 3))
})


## ----error=TRUE---------------------------------------------------------------------
is_even <- function(n) {
    n %% 2 == 0
}

is_even(768)

is_even("two")


## -----------------------------------------------------------------------------------
is_even_error <- function(n) {
    tryCatch(n %% 2 == 0,
        error = function(e) {
            FALSE
        }
    )
}

is_even_error(714)

is_even_error("eight")


## -----------------------------------------------------------------------------------
is_even_check <- function(n) {
    is.numeric(n) && n %% 2 == 0
}

is_even_check(1876)

is_even_check("twelve")


## -----------------------------------------------------------------------------------
#| eval: false
## library(microbenchmark)
## microbenchmark(sapply(letters, is_even_check))


## ----eval=FALSE---------------------------------------------------------------------
## microbenchmark(sapply(letters, is_even_error))


## -----------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()
