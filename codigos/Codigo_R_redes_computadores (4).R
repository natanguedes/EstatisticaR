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

dados = read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\2019_OrcamentoDespesa.txt", header = T, sep = "\t") #o separador de tabulação é "\t" e da vírgula ";"
#É necessário primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabulação) ou .csv (separado por vírgulas)

#No caso específico do nosso banco, existem muitas informações faltantes
#classificadas como NA pelo R. É preciso eliminá-las com o uso da seguinte
dados
dados = na.exclude(dados)

#Só a partir desse momento é possível retirar sua amostra.
#Agora estamos prontos para tentar retirar nossa amostra de tamanho 60.

Amostra <- dados[sample(nrow(dados), 60),]
attach(Amostra)


#Após selecionar a amostra, você precisa salva-la em um arquivo, senão você vai gerar uma nova amostra toda vez que for acessar seu código
#Para salvar sua amostra, utilize o seguinte comando

write.table(Amostra, "E:\\Natanael\\tsi\\3periodo\\estatistica\\2019_OrcamentoDespesa2.txt", append = F, sep = "\t", row.names = F) #O comando append = F
#diz ao R que caso você gere uma nova amostra, ela vai sobrepor a anterior. O comando row.names = F impede que o arquivo seja salvo com um título para cada linha
  Amostra2 <- read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\2019_OrcamentoDespesa2.txt", header = T, sep = "\t")
#Uma vez salva sua amostra, você está pronto para começar as análises!
attach(Amostra2)
#Primeira parte - Estatística Descritiva
#a. Classificar as variáveis do banco - var. qualitativas nominais e ordinais; var. quantitativas discretas e contínuas;
#b. Construir tabelas e gráficos para as variáveis qualitativas;
mean()
#O R não constrói distribuição de frequências de maneira direta.
#Para isso, você precisa coletar as frequências pelo R e depois construir uma tabela personalizada.

#gráficos variáveis qualitativa
Nome = table(NOME.ÓRGÃO.SUPERIOR) #frequencia absoluta
Nome
  despesas = prop.table(table(NOME.CATEGORIA.ECONÔMICA)) #frequencia relativa
despesas

# create data
result <- c(75, 25)

# Calculate the percentage of  sections and put it in the label
alabels <- round((result/sum(result)) * 100, 1)
alabels <- paste(alabels, "%", sep="")

colors <- c("green","red")

pie(result, main="Despesas", col=colors, labels=alabels, cex=0.8)

# draw("bottom" the legend
legend("bottomleft",1.0, c("Despesas Correntes", "Despesas de capital"), fill=colors)
