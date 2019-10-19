MyData <- read.csv(file="E:\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\graficos\\Aposentadoria\\CON06.csv", header=TRUE, sep=",")
MyData

pie(table("Sexo"), col = rainbow(2))

table(MyData['Sexo'])

x <-  c(1967,2102)
labels <-  c("Feminino","Masculino")

piepercent<- round(100*x/sum(x), 1)
# Plot the chart.
pie(x, labels = piepercent, main = "Aposentadorias concedidas por anos de serviço
",col = rainbow(length(x)))
legend(1.5, 0.5, c("Feminino","Masculino"), cex = 0.8,
       fill = rainbow(length(x)))
