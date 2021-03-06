
#Lendo dados externos ao R

#fun??o read.txt ou read.csv ou read.table

#a fun??o read.table precisa do caminho do arquivo, al?m de voc? dizer se existe cabe?alho no seu arquivo e qual o tipo de separador
#Função read.table para ler o arquivo
dados = read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\MATRICULADOS\\matriculados.txt", header = T, sep = ",") #o separador de tabula??o ? "\t" e da v?rgula ";"
#? necess?rio primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabula??o) ou .csv (separado por v?rgulas)

#se o arquivo que voce deseja ler estiver na mesma pasta do projeto ai deve-se ler da seguinte forma:
dados = read.table("matriculados.txt", header = T, sep = ",") #o separador de tabula??o ? "\t" e da v?rgula ";"

SA = na.exclude(dados) #retira os NA'S
Amostra <- dados[sample(nrow(SA), 60),] #GERA AMOSTRA DE 60
attach(Amostra)

#salva a amostra
write.table(Amostra, "E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\MATRICULADOS\\amostra.txt", append = F, sep = "\t", row.names = F) #O comando append = F


