args(runif)
args(mean)
example.of.error
log(c(-1, 2))
x <- log(c(-1, 2))
is.na(x)

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
set.seed(20230928)
print_message3_cli(-1:1)

fn <- function(x = c("foo", "bar")) {
  x <- rlang::arg_match(x)

  ## Known scenario 1
  if (x == "foo") {
    print("I know what to do here with 'x = foo'")
  }

  ## Known scenario 2
  if (x == "bar") {
    print("I know what to do here with 'x = bar'")
  }
}
fn("foo")
fn("zoo")
