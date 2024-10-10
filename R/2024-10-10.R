library("tidyverse")
library("tidytext")

## Code from
## https://lcolladotor.github.io/jhustatcomputing/posts/23-working-with-text-sentiment-analysis/#text-mining-and-tokens
gorman_hill_we_climb <-
    c(
        "When day comes we ask ourselves, where can we find light in this neverending shade?",
        "The loss we carry, a sea we must wade.",
        "We’ve braved the belly of the beast, we’ve learned that quiet isn’t always peace and the norms and notions of what just is, isn’t always justice.",
        "And yet the dawn is ours before we knew it, somehow we do it, somehow we’ve weathered and witnessed a nation that isn’t broken but simply unfinished."
    )

hill_df <- tibble(
    line = seq_along(gorman_hill_we_climb),
    text = gorman_hill_we_climb
)
hill_df


## Q from Mateo: can unnest_tokens() detect sentences?
##
## A: first let's collapse all the text we have using
# paste(collapse = " ") ## note the use of the space. If we don't use
## it, the automatic sentence detection won't work well.
df <- tibble(
    line = 1,
    text = paste(gorman_hill_we_climb, collapse = " ")
)
## Check the resulting collapsed text
df
## Now we can use unnest_tokens(token = "sentences") to detect
df %>% unnest_tokens(
    sentences,
    text,
    token = "sentences"
)
