#0############ATEN��O!!!###############
#Caso voc� tenha d�vida sobre o uso de alguma fun��o espec�fica, voc� possui dois caminhos
#Caso voc� j� saiba o nome da fun��o, voc� pode pedir ajudar utilizando o ? junto ao nome da fun��o. Exemplo
?mean
#Caso voc� n�o saiba o nome da fun��o, mas tenha ideia da mesma por alguma palavra similar, utilize o ?? junto a palavra que deve estar entre aspas
??"standard deviance"

#Agora vamos come�ar!

#Opera��es b�sicas direto no console do R
  2 + 4
Soma <- 2 + 4 #uma vari�vel recebe algum valor pelo sinal de <- ou = tanto faz qual utilizar
Multiplicacao = 3*6
Operacao = Soma/Multiplicacao

#Criando vetores no R

altura = c(1.63, 1.78, 1.69, 1.85, 1.75, 1.65, 1.67, 1.65, 1.65, 1.71, 1.84, 1.83, 1.76, 1.69, 1.67, 1.80) #separador decimal � o ponto


#Criando matrizes no R

teste = matrix(nrow = 2, ncol = 2, c(0,1,2,3))
teste

#Lendo dados externos ao R

#fun��o read.txt ou read.csv ou read.table

#a fun��o read.table precisa do caminho do arquivo, al�m de voc� dizer se existe cabe�alho no seu arquivo e qual o tipo de separador

dados = read.table("meubd.txt", header = T, sep = "\t") #o separador de tabula��o � "\t" e da v�rgula ";"
#� necess�rio primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabula��o) ou .csv (separado por v�rgulas)
write.table(dados, "minhaAmostra.txt", append = F, na="", sep = "\t", row.names = F) #O comando append = F

#exemplo de remover NA'S OU NULOS DE UMA TABELA

foo <- read.table(file="minhaAmostra.txt", sep="\t") # Ler o arquivo txt
data_omit <- na.omit(foo)                            # omite os NA'S e nulos
data_omit #exibe os dados sem NA'S e nulos

write.table(data_omit, "meubd.txt", append = F, sep = "\t", row.names = F) # salva os arquivos sem o NA'S e nulos
