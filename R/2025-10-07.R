## Install both cowsay and fortunes so we
## can generate a random fortune from a cow
install.packages(c("cowsay", "fortunes"))

## Example using the "cowsay" package
library("cowsay")
library("fortunes")
cowsay::say("fortune", by = "cow")

## Do you want a fortune said by a cow every
## time you start R?

## If your answer is yes, run the following line
usethis::edit_r_profile()

## Add these lines to your .Rprofile
if (
    !requireNamespace("cowsay", quietly = TRUE) |
        !requireNamespace("fortunes", quietly = TRUE)
) {
    cat(
        'To install cowsay and fortunes use: install.packages(c("cowsay", "fortunes"))\n'
    )
} else {
    library("cowsay")
    library("fortunes")
    cowsay::say("fortune", by = "cow")
}
