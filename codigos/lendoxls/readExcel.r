


install.packages("readxl")
  
library("readxl")
# xls files
my_data <- read_excel("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\lendoxls\\LotOrgaoDistOcupVagas.xlsx")
table(my_data[,1])#frequencia absoluta

a= table(my_data["NOME_ORGAO"]) #frequencia absoluta
a
s=prop.table(my_data["APROVADA"])#frequencia Relativa
s



table(LotOrgaoDistOcupVagas[,1])