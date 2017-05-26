library("dplyr")

x <- tbl_df(iris)
glimpse(iris)
View(x)

iris %>% 
  group_by(Species) %>%
  arrange(desc(Sepal.Length)) %>%
  summarise(fst = first(Sepal.Length))

