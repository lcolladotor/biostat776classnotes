## Load the usethis package as an example
library("usethis")

## Create an R object called "leo"
leo <- "hola"

## Check under
## Help -> Keyboard shortcuts help
## the keyboard shortcut for executing code
## from a selected line(s) on the console.
##
## Answer: It's command + enter on macOS (control + enter on winOS)

## Install ggplot2 and usethis
install.packages("ggplot2")
install.packages("usethis")

## Load ggplot2 in this R session
library("ggplot2")

## Let's open the help page for ggplot2::ggplot()
?ggplot

## Then execute code from the examples using the command + enter
## keyboard shortcut (on macOS, for winOS use control + enter)


## After class question:
## What does "devel" mean on your R Console's command prompt?
##
## Answer: it's the Git branch that I'm currently working on.
## I have this automatically loaded on all my R sessions through the
## ~/.Rprofile configuration file that you can edit with:
usethis::edit_r_profile()

## These are the specific lines that modify my R Console prompt:

## From https://twitter.com/hadleywickham/status/1113542388033699840
if (interactive()) {
    if (!requireNamespace("prompt", quietly = TRUE)) {
        cat('To install prompt use: remotes::install_github("gaborcsardi/prompt")\n')
    } else {
        prompt::set_prompt(prompt::prompt_git)
    }
}


## For more on my Rprofile check
## https://lcolladotor.github.io/bioc_team_ds/config-files.html#rprofile
