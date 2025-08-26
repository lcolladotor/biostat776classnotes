## List R packages in this session
sessioninfo::session_info()

## How many R packages are available on CRAN?
available.packages() |> nrow()

## How many R packages are available on Bioconductor?
BiocManager::available() |> length() - available.packages() |> nrow()

## Cuantos paquetes de R hay en total?
## How many R packages are there in total?

## R code that is not formatted
a <- function(hola) {
    print(hola)
}

## Show me an example of a for loop in R
for (i in 1:5) {
    print(i)
}
?print

## Links shown in class today:
# https://www.one-tab.com/page/232lwwfmQiGswv5DLgzhlg
