library(dplyr)
library(tidyr)
library(stringr)

x <- tbl_df(iris)
glimpse(iris)
View(x)

#Группировка с сортировкой и добвить новый элемент - первый для каждой группы
iris %>% 
  group_by(Species) %>%
  arrange(desc(Sepal.Length)) %>%
  summarise(fst = first(Sepal.Length))

# Добавить ID дальше сделать для каждого вида его колонку с длиной
x<- cbind(ID = 1:150, iris)
x %>% 
  select(ID, Sepal.Length, Species) %>%
  spread(Species, Sepal.Length, sep = "+") ->y

# Объединить колонки с разделителем
y %>% 
  unite(ID, `Species+setosa`, `Species+versicolor`, `Species+virginica`, sep  = "-")

# Пример из дока, собрать и назад по разному разобрать
stocks <- data.frame(time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),  Y = rnorm(10, 0, 2),  Z = rnorm(10, 0, 4))
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)

# Фильтрация по набору значений
iris %>%
  filter(Species == "setosa", Petal.Length > 1.8, Sepal.Length == 4.8)

# Собрать в вектор selectForFilter все значения у которых повторено больше 12
iris %>%
  group_by(Petal.Width) %>%
  summarise(nwifth = n()) %>%
  filter(nwifth > 12) -> selectForFilter
# используя selectForFilter выбрать те, что покрыты этим фильтром
iris %>%
  filter(Petal.Width %in% selectForFilter$Petal.Width) %>%
  select(Petal.Length, Petal.Width, Species) %>%
  arrange(Petal.Length) %>%
  distinct() #оставить только уникальные

# то что раньше - посчитать количество одной командой
iris %>%
  count(Petal.Length) 

# используем другой столбец как базу для счета (если все 1, аналог выше функции)
iris %>%
  count(Petal.Length, wt = Petal.Width) 

