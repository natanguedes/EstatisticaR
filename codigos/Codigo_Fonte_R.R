# Atividade de hoje (01/02/2018) - Realizar a leitura de um
# banco de dados externo

#Objetivo da aula:
# 1. Retirar uma amostra de tamanho 60 para compor o banco de
# dados de cada um individualmente

Dados_professor <- read.csv("E:\\Natanael\\tsi\\3periodo\\estatistica\\projeto\\Banco_de_dados_Trabalho.csv", header=T,row.names=1,sep=",")

Amostra <- Dados_professor[sample(ncol(Dados_professor),  10),]

head(Amostra)



dados <- read.csv("Banco_de_dados_Trabalho.csv", header=TRUE ,  sep ="\t")
head(dados)
#Tentativa 1 -> Transformar o arquivo .xlsx em arquivo de
# texto separado por tabulação (.txt)

Dados_professor_tentativa_1 <- read.table("C:\\Users\\Professor\\Downloads\\Banco de Dados Trabalho.txt", header = T, sep ="\t")

 altura = c(1.75,1.5,1.85,1.55,1.7)

 # classificacao = c("alto","baixo","alto","baixo","alto")
 dados = data.frame(altura,Dados_professor_tentativa_1)
 d <- dados
 d
 
 d = read.table("C:\\Users\\Professor\\Downloads\\Banco de Dados Trabalho.txt",header=T,row.names=1,sep=",")
 d

#Banco de dados Ok!!!!

#Agora estamos prontos para tentar retirar nossa amostra
# de tamanho 60.
  
  Amostra <- Dados_professor_tentativa_1[sample(nrow(Dados_professor_tentativa_1), 60),]
  Amostra
# Pronto! Agora temos nosso banco de dados! Mãos a obra com as análises!

