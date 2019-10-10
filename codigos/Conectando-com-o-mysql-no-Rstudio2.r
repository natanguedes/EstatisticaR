install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='', dbname='produto', host='localhost')
mydb
rs = dbSendQuery(mydb, "select * from marca")
data = fetch(rs, n=-1) #executa a consulta
data   #mostra o resultado

freqabscidade = dbReadTable(mydb,"marca") #ler a tabela marca
freqabscidade
pie(table(freqabscidade)) #cria o gráfico de setores

