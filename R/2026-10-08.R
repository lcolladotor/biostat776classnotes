state.name
"isi"
any(grepl("isi", state.name))
table(grepl("isi", state.name))

state.name[grepl("M.d", state.name)]
state.name[grepl("M.*d", state.name)]

grepl("a.b", c("aaa", "aab", "abb", "acadb"))

state.name[grepl("M.+d", state.name)]

grepl("M.+d", "Md")
grepl("M.*d", "Md")

state.name[grepl("M.?d", state.name)]

grepl("M.?d", "Md")

x <- "spookyspookyhalloweenspookyspookyhalloween"
# 1. Search for “spooky” exactly 2 times. What about 3 times?
grepl("s{2}", "Mississippi")
grepl("ss", "Mississippi")
grepl("(iss){2}", "Mississippi")
grepl("ississ", "Mississippi")
grepl("(spooky){2,3}", x)
grepl("spookyspooky", x) | grepl("spookyspookyspooky", x)

## Correct answer:
grepl("(spooky){2}", x)
grepl("(spooky){3}", x)

# 2. Search for “spooky” exactly 2 times followed by any character of length 9 (i.e. “halloween”).
grepl("(spooky){2}.{9}", x)

# 3. Same search as above, but search for that twice in a row.
x <- "spookyspookyhalloweenspookyspookyhalloween"
grepl("((spooky){2}.{9}){2}", x)

# 4. Same search as above, but search for that three times in a row.
grepl("((spooky){2}.{9}){3}", x)

## Using state.name, search for vowel

# 1. We match the beginning of a string.
state.name[grepl("^[aeiouAEIOU]", state.name)]

# 2. We create a character set of just capitalized vowels.
"[AEIOU]"
# 3. We specify one instance of that set.
"[AEIOU]{1}"
# 4. Then any number of characters until:
"^[AEIOU].*"
# 5. A character set of just lowercase vowels.
"^[AEIOU].*[aeiou]"
# 6. We specify one instance of that set.
"^[AEIOU].*[aeiou]{1}"
# 7. We match the end of a string.
"^[AEIOU].*[aeiou]{1}$"
state.name[grepl("^[AEIOU].*[aeiou]{1}$", state.name)]
