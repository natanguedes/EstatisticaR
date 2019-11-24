install.packages("scatterplot3d") # Install
library("scatterplot3d") # load
scatterplot3d(iris[,1:3])
scatterplot3d(iris[,1:3], angle = 55)
scatterplot3d(iris[,1:3],
              main="3D Scatter Plot",
              xlab = "Sepal Length (cm)",
              ylab = "Sepal Width (cm)",
              zlab = "Petal Length (cm)")
scatterplot3d(iris[,1:3], pch = 16, color="steelblue")
shapes = c(16, 17, 18) 
shapes <- shapes[as.numeric(iris$Species)]
scatterplot3d(iris[,1:3], pch = shapes)
colors <- c("#999999", "#E69F00", "#56B4E9")
colors <- colors[as.numeric(iris$Species)]
scatterplot3d(iris[,1:3], pch = 16, color=colors)