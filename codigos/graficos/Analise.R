


dados =  read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\graficos\\matriculados.txt", header = T, sep="," )
sa = prop.table(dados)
un = dados["unidade_ensino"]
prop.table(un)

ano


hist(table(dados['Quantidade']), col = rainbow(3))
?sum
barplot(table(dados['tipo_oferta']), main = "Tipo de oferta", col = rainbow(6))
DF =  table(unlist(dados[,6])) # mostra a quantidade de ocorrencia, por exemplo, no ano de 2019 temos 135 ocorrencias
DF

modalidade = dados['modalidade_ensino'] 
barplot(table(modalidade), main = "modalidade de ensino", col = rainbow(3))
?barplot
freqa = table(dados['unidade_ensino']) #calcula frequencia absoluta de unidade ensino
freqa #exibe as frequencias absolutas
age <- c(17,18,18,17,18,19,18,16,18,18)

barplot(table( dados['modalidade_ensino']),
        main="Modalidades de ensino",
        xlab="Frequencia absoluta",
        ylab="Modalidades",
        border="red",
        horiz = TRUE,
        col=rainbow(3)
        )

tipo = table(dados['tipo_curso'])
tipo

#gráfico de setores

# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Define some colors ideal for black & white print
colors <- c("white","red","cyan","grey50","black")

# Calculate the percentage for each day, rounded to one 
# decimal place
car_labels <- round(cars/sum(cars) * 100, 1)

# Concatenate a '%' char after each value
car_labels <- paste(car_labels, "%", sep="")

# Create a pie chart with defined heading and custom colors
# and labels
pie(cars, main="Cars", col=colors, labels=car_labels,
cex=0.8)

# Create a legend at the right   
legend(1.5, 0.5, c("CAMINHAO","LIMOSINE","CHEVETE","FUSCA","VECTA"), cex=0.8, 
fill=colors)
