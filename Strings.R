# https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html
# http://stringr.tidyverse.org/
library(stringr)

# не актуальна сечас - аналог ncahr
str_length("abc")
nchar("ABC")

x <- c("abcdefddd", "ghifjk") # [1] "bcd" "hif"

str_sub(x, 2, -2) # [1] "bcdefdd" "hifj"   

str_sub(x, 3, 5) <- "X"
x # [1] "abXfddd" "ghXk"   

str_dup(x, c(2, 3)) # [1] "abXfdddabXfddd" "ghXkghXkghXk" 

x <- c("abc", "defghi")
str_pad(x, 10)
# [1] "       abc" "    defghi"
str_pad(x, 10, "both")
# [1] "   abc    " "  defghi  "

x <- c("Short", "This is a long string")
x %>% 
  str_trunc(10) %>% 
  str_pad(10, "right")
# [1] "Short     " "This is..."
str_trunc(x,5,side = "center", ellipsis = "-")
# "Short" "Th-ng"

x <- c("why", "video", "cross", "extra", "deal", "authority")
str_c(x, collapse = ", ")
#> [1] "why, video, cross, extra, deal, authority"

# Выбрать те ветора, которые соотвествуют образцу
str_subset(x, "[ae]")
#> [1] "video"     "extra"     "deal"      "authority"

# Посчитать, сколько раз входин нужны патерн
str_count(x, "[aeiou]")
#> [1] 0 3 1 2 2 4

# Each pattern matching function has the same first two arguments,
# a character vector of strings to process and a single pattern to match. 
# stringr provides pattern matching functions to 
# detect, locate, extract, match, replace, and split strings.

# simple filter for selection
iris %>% 
  filter(str_detect(Species, "setosa"))

