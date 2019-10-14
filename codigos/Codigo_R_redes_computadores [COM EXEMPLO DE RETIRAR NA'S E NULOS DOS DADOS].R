#0############ATENÇÃO!!!###############
#Caso você tenha dúvida sobre o uso de alguma função específica, você possui dois caminhos
#Caso você já saiba o nome da função, você pode pedir ajudar utilizando o ? junto ao nome da função. Exemplo
?mean
#Caso você não saiba o nome da função, mas tenha ideia da mesma por alguma palavra similar, utilize o ?? junto a palavra que deve estar entre aspas
??"standard deviance"

#Agora vamos começar!

#Operações básicas direto no console do R
  2 + 4
Soma <- 2 + 4 #uma variável recebe algum valor pelo sinal de <- ou = tanto faz qual utilizar
Multiplicacao = 3*6
Operacao = Soma/Multiplicacao

#Criando vetores no R

altura = c(1.63, 1.78, 1.69, 1.85, 1.75, 1.65, 1.67, 1.65, 1.65, 1.71, 1.84, 1.83, 1.76, 1.69, 1.67, 1.80) #separador decimal é o ponto


#Criando matrizes no R

teste = matrix(nrow = 2, ncol = 2, c(0,1,2,3))
teste

#Lendo dados externos ao R

#função read.txt ou read.csv ou read.table

#a função read.table precisa do caminho do arquivo, além de você dizer se existe cabeçalho no seu arquivo e qual o tipo de separador

dados = read.table("meubd.txt", header = T, sep = "\t") #o separador de tabulação é "\t" e da vírgula ";"
#É necessário primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabulação) ou .csv (separado por vírgulas)
write.table(dados, "minhaAmostra.txt", append = F, na="", sep = "\t", row.names = F) #O comando append = F

#exemplo de remover NA'S OU NULOS DE UMA TABELA

foo <- read.table(file="minhaAmostra.txt", sep="\t") # Ler o arquivo txt
data_omit <- na.omit(foo)                            # omite os NA'S e nulos
data_omit #exibe os dados sem NA'S e nulos

write.table(data_omit, "meubd.txt", append = F, sep = "\t", row.names = F) # salva os arquivos sem o NA'S e nulos
