regular_expression <- "a"
string_to_search <- c("Maryland", "Leo")

grepl(pattern = regular_expression, x = string_to_search)

grepl("(ax)*e*", "Maryland")
grepl("", "Maryland")


## "spookyhalloween" class exercise
our_text <- "spookyhalloween"

## 1. Does “zz” appear 1 or more times?
grepl("(zz)+", our_text)
## 2. Does “ee” appear 1 or more times?
grepl("(ee)+", our_text)
## 3. Does “oo” appear 0 or more times?
grepl("(oo)*", our_text)
## 4. Does “ii” appear 0 or more times?
grepl("(ii)*", our_text)



# Does "Mississippi" contain exactly 2 adjacent "s" ?
grepl("s{2}", "Mississippi")


grepl("i{2,3}", "Mississippi")
grepl("ii", "Mississippi") | grepl("iii", "Mississippi")
FALSE | FALSE

# Does "Mississippi" contain between 2 adjacent "ss" ?
grepl("(ss){2}", "Mississippi")
grepl("ssss", "Mississippi")

# Does "Mississippi" contain the pattern of an "i" followed by
# 2 of any character, with that pattern repeated three times adjacently?
grepl("(i.{2}){3}", "Mississippi")
grepl("i..i..i..", "Mississippi")

## "spookyspookyhalloweenspookyspookyhalloween" exercise
longer_text <- "spookyspookyhalloweenspookyspookyhalloween"

## 1. Search for “spooky” exactly 2 times. What about 3 times?
grepl("(spooky){2}", longer_text)
grepl("(spooky){3}", longer_text)
## 2. Search for “spooky” exactly 2 times followed by any character of length 9 (i.e. “halloween”).
grepl("(spooky){2}.{9}", longer_text)
## 3. Same search as above, but search for that twice in a row.
grepl("((spooky){2}.{9}){2}", longer_text)
## 4. Same search as above, but search for that three times in a row.
grepl("((spooky){2}.{9}){3}", longer_text)
grepl("spookyspooky.{9}spookyspooky.{9}spookyspooky.{9}", longer_text)


grepl("\\w", "rhythms")
grepl("[A-Z|a-z|0-9|_]", "rhythms")
