library(caret)

# Библиотека ниже делает разные метки и полупрозрачные
library(AppliedPredictiveModeling)
transparentTheme(trans = .4)

featurePlot(x = iris[, 1:4], 
            y = iris$Species, 
            plot = "pairs",
            auto.key = list(columns = 3))

featurePlot(x = iris[, 1:4], 
            y = iris$Species, 
            plot = "box", 
            ## Pass in options to bwplot() 
            scales = list(y = list(relation="free"),
                          x = list(rot = 90)),  
            layout = c(4,1 ), 
            auto.key = list(columns = 2))


