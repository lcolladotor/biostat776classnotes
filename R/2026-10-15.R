library("forcats")
?fct_lump_lowfreq


peng_preface <-
  c(
    "I started using R in 1998 when I was a college undergraduate working on my senior thesis.",
    "The version was 0.63.",
    "I was an applied mathematics major with a statistics concentration and I was working with Dr. Nicolas Hengartner on an analysis of word frequencies in classic texts (Shakespeare, Milton, etc.).",
    "The idea was to see if we could identify the authorship of each of the texts based on how frequently they used certain words.",
    "We downloaded the data from Project Gutenberg and used some basic linear discriminant analysis for the modeling.",
    "The work was eventually published and was my first ever peer-reviewed publication.",
    "I guess you could argue it was my first real 'data science' experience."
  )

peng_preface

library(tidyverse)
library(stringr)
library(tidytext) ## needs to be installed
library(janeaustenr) ## needs to be installed

peng_preface_df <- tibble(
  line = 1:7,
  text = peng_preface
)
peng_preface_df

peng_token <-
  peng_preface_df %>%
  unnest_tokens(
    output = word,
    input = text,
    token = "words"
  )

peng_token

peng_preface_df %>%
  unnest_tokens(word, text, token = "characters")

cumsum(c(0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0))
