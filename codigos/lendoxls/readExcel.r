


install.packages("readxl")
  
library("readxl")
# xls files
my_data <- read_excel("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\lendoxls\\LotOrgaoDistOcupVagas.xlsx")
APROVADA=table(APROVADA)#frequencia absoluta

a= table(my_data["NOME_ORGAO"]) #frequencia absoluta
a
s=prop.table(my_data["APROVADA"])#frequencia Relativa
s

aprovada = table(my_data[,5]) #aprovada é uma variável quantitativa que  está na posição 5 na variável my_data

distribuida =  table(my_data[,6]) #distribuida é uma variável quantitativa que  está na posição 6 na variável my_data
cor(aprovada,distribuida)
