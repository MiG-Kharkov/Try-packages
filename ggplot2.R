library(ggplot2)
library(dplyr)
glimpse(iris)

x <- iris

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(color = Species, shape = Species))

iris %>%
  ggplot(aes(Species, Sepal.Length))+
  geom_boxplot(aes(color = Species))

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(color = Species, shape = Species))+
  facet_grid(Species~.)

iris %>%
  count(Petal.Length) %>%
  ggplot(aes(Petal.Length,n))+
  geom_col()

iris %>%
  ggplot(aes(Sepal.Length))+
  geom_dotplot(aes(fill = ..x..))


