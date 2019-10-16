


dados =  read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\graficos\\matriculados.txt", header = T, sep="," )

un = dados["unidade_ensino"]
prop.table(un)
ano = dados['Ano']
pie(table(un))

freqa = table(dados['unidade_ensino']) #calcula frequencia absoluta de unidade ensino
freqa #exibe as frequencias absolutas

x = c(130,80,90,110,130,140,90,90,130,100,260)
label = c("CBRA","CCEI","CEST","CGAM","CPLA","CRFI","CSAM","CSSB","CTAG","CTGC","IFB")
porcetagem = round(100*x/sum(x),1)
pie(table(un), label=porcetagem,main = "unidades de ensino", col = rainbow(length(x))) 
legend(1,1, c("CBRA","CCEI","CEST","CGAM","CPLA","CRFI","CSAM","CSSB","CTAG","CTGC","IFB"), cex = 0.5,fill= rainbow(length(x)))

