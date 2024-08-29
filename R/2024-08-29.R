## Our first example for reprex::reprex()
stop("This R error is weird")


## A more complicated case where we also
## keep track of the R session information
stop("This R error is weird")
options(width = 120)
sessioninfo::session_info()
