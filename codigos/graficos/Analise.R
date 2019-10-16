


dados =  read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\graficos\\matriculados.txt", header = T, sep="," )
sa = prop.table(dados)
un = dados["unidade_ensino"]
prop.table(un)
ano = dados['Quantidade']
hist(ano)
hist(table(dados['Quantidade']), col = rainbow(3))
?sum

DF =  table(unlist(dados[,6])) # mostra a quantidade de ocorrencia, por exemplo, no ano de 2019 temos 135 ocorrencias
DF

modalidade = dados['modalidade_ensino'] 
barplot(table(modalidade), main = "modalidade de ensino", col = rainbow(3))
?barplot
freqa = table(dados['unidade_ensino']) #calcula frequencia absoluta de unidade ensino
freqa #exibe as frequencias absolutas

x = c(130,80,90,110,130,140,90,90,130,100,260)
label = c("CBRA","CCEI","CEST","CGAM","CPLA","CRFI","CSAM","CSSB","CTAG","CTGC","IFB")
porcetagem = round(100*x/sum(x),1)
pie(table(un), label=porcetagem,main = "unidades de ensino", col = rainbow(length(x))) 
legend(1,1, c("CBRA","CCEI","CEST","CGAM","CPLA","CRFI","CSAM","CSSB","CTAG","CTGC","IFB"), cex = 0.5,fill= rainbow(length(x)))

