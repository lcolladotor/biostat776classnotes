citation("rmarkdown")
citation("rmarkdown")[1]

knitr::write_bib("rmarkdown", file = here::here("data", "my-refs.bib"))

## From https://lcolladotor.github.io/jhustatcomputing/posts/07-reading-and-writing-data/
getwd()
list.files()
