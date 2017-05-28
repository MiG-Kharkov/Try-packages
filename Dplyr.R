library("dplyr")
library(tidyr)
library(stringr)

x <- tbl_df(iris)
glimpse(iris)
View(x)

iris %>% 
  group_by(Species) %>%
  arrange(desc(Sepal.Length)) %>%
  summarise(fst = first(Sepal.Length))

x<- cbind(ID = 1:150, iris)
x %>% 
  select(ID, Sepal.Length, Species) %>%
  spread(Species, Sepal.Length, sep = "+") ->y

y %>% 
  unite(ID, `Species+setosa`, `Species+versicolor`, `Species+virginica`, sep  = "-")

stocks <- data.frame(time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),  Y = rnorm(10, 0, 2),  Z = rnorm(10, 0, 4))
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)

iris %>%
  filter(Species == "setosa", Petal.Length > 1.8, Sepal.Length == 4.8)

iris %>%
  group_by(Petal.Width) %>%
  summarise(nwifth = n()) %>%
  filter(nwifth > 12) -> selectForFilter

x %>%
  filter(Petal.Width %in% selectForFilter$Petal.Width) %>%
  select(Petal.Width, Species) %>%
  distinct()

