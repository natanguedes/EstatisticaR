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

dados = read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\projeto\\minhaAmostra7.txt", header = T, sep = "\t") #o separador de tabulação é "\t" e da vírgula ";"
#É necessário primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabulação) ou .csv (separado por vírgulas)

#No caso específico do nosso banco, existem muitas informações faltantes
#classificadas como NA pelo R. É preciso eliminá-las com o uso da seguinte

dados = na.exclude(dados)

#Só a partir desse momento é possível retirar sua amostra.
#Agora estamos prontos para tentar retirar nossa amostra de tamanho 60.

Amostra <- dados[sample(nrow(dados), 60),]
attach(Amostra)
dados = na.omit(Amostra)

#Após selecionar a amostra, você precisa salva-la em um arquivo, senão você vai gerar uma nova amostra toda vez que for acessar seu código
#Para salvar sua amostra, utilize o seguinte comando

# write.table(Amostra, "E:\\Natanael\\tsi\\3periodo\\estatistica\\projeto\\minhaAmostra.txt", append = F, sep = "\t", row.names = F) #O comando append = F
#diz ao R que caso você gere uma nova amostra, ela vai sobrepor a anterior. O comando row.names = F impede que o arquivo seja salvo com um título para cada linha
Amostra <- read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\projeto\\minhaAmostra7.txt", header = T, sep = "\t")
#Uma vez salva sua amostra, você está pronto para começar as análises!
Amostra
#Primeira parte - Estatística Descritiva
#a. Classificar as variáveis do banco - var. qualitativas nominais e ordinais; var. quantitativas discretas e contínuas;
#b. Construir tabelas e gráficos para as variáveis qualitativas;

#O R não constrói distribuição de frequências de maneira direta.
#Para isso, você precisa coletar as frequências pelo R e depois construir uma tabela personalizada.

cor2  =  table(Cor)
cor
cor = names(freqAbsCidade) <- c("Rec", "Vit", "Flo", "NR")
cor
#Observação: você precisa acessar o CRIVO para saber o que significa as colunas 1, 2, 3 e 4
#Quer melhorar seu relatório? Descubra uma forma de "dar nome" aos códigos diretamente no R.

Numero = table(Número)
NCidade = table(NCidade)
Local = table(Local)
Idade = table(Idade)
Cidade = table(Cidade)
Tempo = table(Tempo)
Bairro = table(Bairro)
Cor = table(Cor)
Religiao = table(Religião)
Religiao_qual = table(Religiao_qual)
estudando = table(Estudando)
Estudo = table(Estudo)
Casa = table(Casa)
tipodehabitacao = table(Qualeotipodehabitacao)
Habit_outro = table(Habit_outro)
Habit_alug = table(Habit_alug)
Comodos = table(Comodos)
Trabalho = table(Trabalho)
Recursos = table(Recursos)
Rendafamiliar = table(Renda_familiar)
Rendadivpessoa = table(Rendadivpessoa)
Renda_da_familia = table(Renda_da_familia)
classe = table(Classe)
civil = table(Civil)
hist(Idade)

freqRelCor <- prop.table(freqRelCor)
freqRelCor

#Para construir gráficos adequados para as variáveis, você pode explorar diversas funções gráficas do R

barplot(cor)
barplot(cor, col = c("blue", "red", "yellow", "purple"))
barplot

#c. Calcular as medidas de posição e dispersão para as variáveis quantitativas;

medidas_posicao <- function(var_qtativa){
  media <- mean(var_qtativa)
  mediana <- median(var_qtativa)
  moda <- max(table(var_qtativa))
  return(c(media, mediana, moda))
}
medidas_posicao(Numero)
medidas_posicao(NCidade)
medidas_posicao(Local)
medidas_posicao(Idade)
medidas_posicao(Cidade)
  medidas_posicao(Tempo)
  medidas_posicao(Bairro)
  medidas_posicao(Cor)
  medidas_posicao(Religiao)
  medidas_posicao(Religiao_qual)
  medidas_posicao(estudando)
  medidas_posicao(Estudo)
  medidas_posicao(Casa)
  medidas_posicao(tipodehabitacao)
  medidas_posicao(Habit_outro)
  medidas_posicao(Habit_alug)
  medidas_posicao(Comodos)
  medidas_posicao(Trabalho)
  medidas_posicao(Recursos)
  medidas_posicao(Rendafamiliar)
  medidas_posicao(Rendadivpessoa)
  medidas_posicao(Renda_da_familia)

  
  summary(cor)

summary(idade)

#É sempre importante lembrar que as letras b. e c. só estarão totalmente corretas se a sua
#classificação utilizada em a. for também correta.


#Segunda parte - Probabilidade e Inferência

#a. Verificar se as variáveis quantitativas podem ser estudadas através de uma distribuição normal
#A função no R que faz essa verificação é um teste de hipóteses como o que segue
?ks.test
ks.test(Renda_da_familia, "pnorm", mean = mean(Renda_da_familia), sd = sd(Renda_da_familia))

#Se a variável testada seguir uma distribuição normal, o teste a ser utilizado será
#Um teste Z ou um teste T. Caso contrário, o teste utilizado será um teste de Wilcoxon

#b. Verificar através de um intervalo de confiança e de um teste de hipóteses se os dados
#da sua amostra batem com os dados do banco inteiro.
#Nesse sentido, você precisa formular as hipóteses se baseando nas informações que você tem no
#banco de dados.
#Para utilizar intervalos de confiança e testes com proporção, minha exigência será trabalhar
#com a variável cidade. Nela, quero que vocês façam a proporção de pessoas em sua amostra e
#no banco todo que são de Recife. Depois crie hipóteses para essa situação e realize o teste.

rf_populacao <- dados[,22]
mean(Cor)
mean(Renda_da_familia)
help.search("mann whitney")
?wilcox.test
wilcox.test(Renda_da_familia, rf_populacao, alternative = "two.sided", conf.int = TRUE)
