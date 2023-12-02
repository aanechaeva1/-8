iris <- read.csv("iris.csv")
set.seed(4)
iris$variety <- factor(iris$variety)
variety_vector <- iris[,5]
install.packages("ggplot2")
install.packages("maps")


library("ggplot2")
library("maps")
iris <- as.data.frame(scale(iris[,-5]))
iris <-  data.frame(iris,variety_vector)
str(iris)
ggplot(data = iris)+
  geom_point(mapping = aes(x= sepal.length, y = sepal.width, color = variety_vector))

# можно получить срез по комбинации 2-х переменных:
ggplot(data = iris)+
  geom_point(mapping = aes(x= sepal.length, y = sepal.width))+
  facet_wrap(~variety_vector, nrow = 2) 

ggplot(data = iris)+
  geom_point(mapping = aes(x= petal.length, y = petal.width))+
  facet_grid(sepal.length~sepal.width)
# Геометрические объекты
ggplot(data = iris)+
  geom_smooth(mapping = aes(x= sepal.length, y = sepal.width, linetype = variety_vector)) # график зависимости расхода от объема двигателя для машин с разным приводом

# можно отобразить на одной диаграмме графики с разными геометриями, используя слои
ggplot(data = iris)+
  geom_point(mapping = aes(x= sepal.length, y = sepal.width, color = variety_vector))+
  geom_smooth(mapping = aes(x= sepal.length, y = sepal.width))


ggplot(data = iris,
       mapping = aes(x = variety_vector, y = sepal.width))+
  geom_boxplot()+
  coord_flip() # меняем оси местами

# обратимся к другому классическому набору данных - статистике цен на алмазы разной огранки и чистоты
ggplot(data = iris)+
  geom_bar(mapping = aes(x = sepal.width)) # число алмазов по переменной огранка


ggplot(data = iris)+
  stat_summary(
    mapping = aes(x = sepal.width, y = variety_vector),
    fun.min = min, # здесь мы видим диаграмму размахов по категориям
    fun.max = max,
    fun = median)


bar <- ggplot(data = iris)+
  geom_bar(
    mapping = aes(x = variety_vector, fill = variety_vector),
    show.legend = F,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()
