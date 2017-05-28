library("dplyr")
library(tidyr)

x <- tbl_df(iris)
glimpse(iris)
View(x)

iris %>% 
  group_by(Species) %>%
  arrange(desc(Sepal.Length)) %>%
  summarise(fst = first(Sepal.Length))

iris %>% 
  spread(Species,Sepal.Width)


stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)
