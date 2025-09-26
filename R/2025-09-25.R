#' Title
#'
#' Description that has to have full sentences.
#'
#' @param a This is a vector of numbers. Aka, it should work with `is.numeric()`.
#' @param b Similar to `a`.
#'
#' @returns The sum of `a` and `b` position by position.
#' @export
#'
#' @examples
#'
#' ## Add the vectors 1:3 and 4:6 position by position
#' my_sum(1:3, 4:6)
my_sum <- function(a, b) {
    ## Check that a and b are of the same length
    stopifnot(length(a) == length(b))
    a + b
}

## Colorout examples
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
print_message3_tidyverse(99:190)


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

print_message3_cli(1:9)

## Links from class today:
## https://www.one-tab.com/page/La4Nuh6KTD2yrNfpNpS53w

wdf <- data.frame(
    city_name = c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix"),
    population = c(8419600, 3980400, 2716000, 2328000, 1690000),
    area_sq_miles = c(302.6, 468.7, 227.3, 637.5, 517.6)
)

library("tidyverse")
filter_wdf_by_city <- function(city_name) {
    wdf |> dplyr::filter(city_name == !!city_name)
}

filter_wdf_by_city("Chicago")
