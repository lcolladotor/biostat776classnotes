## I created this file with:
# usethis::use_r("2026-09-03")

## -----------------------------------------------------------------------------------------
#| eval: false
# ## Install "usethis" if you don't have it already
if (!requireNamespace("usethis", quietly = TRUE)) {
  install.packages("usethis")
}
#
# usethis::create_project("~/Desktop/biostat776classnotes")
#
# ## Then in your new Positron window / RStudio project, run the following:
usethis::use_git()
usethis::use_github()

## -----------------------------------------------------------------------------------------
#| eval: false
install.packages("reprex")

## -----------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


## Let's force an error
stop("there's a bug that I need help with!")

stop("there's a bug that I need help with!")
# Error:
# ! there's a bug that I need help with!
# devel >
