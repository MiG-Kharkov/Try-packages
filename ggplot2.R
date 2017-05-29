library(ggplot2)
library(dplyr)
glimpse(iris)

x <- iris

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(color = Species, shape = Species))
