## lang demo following LIBD RStats club notes from 2025-01-31
## https://docs.google.com/document/d/16VP6nWsuXvskyQ6askViEx21e1hhMjK3xKVFWC3SfKY/edit?usp=sharing
## https://youtu.be/qWuoVQG5BZw

library("mall")
library("lang")

## 6. Check your computer’s default language
Sys.getenv("LANG")
## 6b. Change your language if you prefer to do so
Sys.setenv(LANGUAGE = "Spanish")

## 7. Test llang
llm_use("ollama", "llama3.2", seed = 100)
?lm
