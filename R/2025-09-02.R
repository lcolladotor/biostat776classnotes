## Create a new R project to demo how
## to make a project, version control it, and
## link it to GitHub
usethis::create_project("~/Desktop/StatComputing_ProjectDemo")
## Check this new project at
## https://github.com/lcolladotor/StatComputing_ProjectDemo

## In that new project window, we used:
usethis::use_git()
usethis::git_default_branch_rename(to = "gh-pages")
usethis::use_github()

## Citation info for citation #1 for rmarkdown
citation("rmarkdown")[1]

## Locate the chocolate.RDS file based on the
## project root, then use relative paths
here::here("data", "chocolate.RDS")

## Change our working directory to the "data" folder
## inside our project
setwd("/Users/leocollado/Dropbox/Code/biostat776classnotes/data")

## Locate the team_standings.csv file based on
## the relative path to the project root
## + save that path into the "path_to_standings" R object
path_to_standings <- here::here("data", "team_standings.csv")

## Read in team standings data using our path_to_standings
## R object
read.csv(path_to_standings)

## Read in chocolate R object data
choco <- readRDS(here::here("data", "chocolate.RDS"))
