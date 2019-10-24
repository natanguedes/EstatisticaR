MyData <- read.csv(file="E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\graficos\\Aposentadoria\\CON06.csv", header=TRUE, sep=",")
MyData

pie(table("Sexo"), col = rainbow(2))

table(MyData['Sexo'])

#gráfico pie

x <-  c(1967,2102)
labels <-  c("Feminino","Masculino")
piepercent<- round(100*x/sum(x), 1)
lblsx <- paste(piepercent,"%",sep="") # ad % to labels
# Plot the chart.
pie(x, labels = lblsx, main = "Gráfico de Setores \nAposentadorias concedidas por anos de serviço
",col = rainbow(length(x)))
legend(1.5, 0.5, c("Feminino","Masculino"), cex = 0.8,
       fill = rainbow(length(x)))

barplot(table(MyData["Espécie"]),col= rainbow(5), main = "Tipo de contribuição")
?barplot
sa = table(MyData["Espécie"])
sa
#gráfico pie
x <- c(32, 12, 30, 45)
labels <- c("California", "Paris", "Moscow", "Mumbai")
pct <- round(x/sum(x)*100)
lblsx <- paste(pct,"%",sep="") # ad % to labels
pie(x,labels = lblsx, col=rainbow(length(x)),main="city_pie_chart")
legend("topright", c("California", "Paris", "Moscow", "Mumbai"), cex=0.8,fill=rainbow(length(x)))