
install.packages("csvread")

dados =  read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\graficos\\matriculados.txt", header = T, sep="," )

un = dados["unidade_ensino"]
prop.table(un)
ano = dados['Ano']
pie(table(un))

freqa = table(dados['unidade_ensino']) #calcula frequencia absoluta de unidade ensino
freqa #exibe as frequencias absolutas

freqr = prop.table(dados['unidade_ensino'])
freqr


sum(ano)
count.fields()

colSums(un)
