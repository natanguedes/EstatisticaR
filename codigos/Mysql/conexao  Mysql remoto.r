install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user='sql10309993', password='CdqdQub7De', dbname='sql10309993', host='sql10.freemysqlhosting.net')
mydb
# rs = dbSendQuery(mydb, "select * from marca")
rs = dbSendQuery(mydb, "select nome from marca")
data = fetch(rs, n=-1) #executa a consulta
data   #mostra o resultado
# 
# freqabscidade = dbReadTable(mydb,"marca") #ler a tabela marca
# freqabscidade
# 
# # Gráfico de setores
# colors <- c("white","blue")
# cols <- c("white","blue")
# pie(table(data), main="Marcas", col=colors,  cex=0.8)
# legend("topright", c("Nestle","Parmalat"), cex=0.8, fill=cols)
