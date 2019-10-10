install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='', dbname='produto', host='localhost')
mydb
rs = dbSendQuery(mydb, "select nome from marca")
rs
data = fetch(rs, n=-1) #executa a consulta
data #mostra o resultado
pie(table(data))


