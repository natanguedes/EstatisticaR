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

dados = read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\projeto\\minhaAmostra7.txt", header = T, sep = "\t") #o separador de tabula��o � "\t" e da v�rgula ";"
#� necess�rio primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabula��o) ou .csv (separado por v�rgulas)

#No caso espec�fico do nosso banco, existem muitas informa��es faltantes
#classificadas como NA pelo R. � preciso elimin�-las com o uso da seguinte

dados = na.exclude(dados)

#S� a partir desse momento � poss�vel retirar sua amostra.
#Agora estamos prontos para tentar retirar nossa amostra de tamanho 60.

Amostra <- dados[sample(nrow(dados), 60),]
attach(Amostra)
dados = na.omit(Amostra)

#Ap�s selecionar a amostra, voc� precisa salva-la em um arquivo, sen�o voc� vai gerar uma nova amostra toda vez que for acessar seu c�digo
#Para salvar sua amostra, utilize o seguinte comando

# write.table(Amostra, "E:\\Natanael\\tsi\\3periodo\\estatistica\\projeto\\minhaAmostra.txt", append = F, sep = "\t", row.names = F) #O comando append = F
#diz ao R que caso voc� gere uma nova amostra, ela vai sobrepor a anterior. O comando row.names = F impede que o arquivo seja salvo com um t�tulo para cada linha
Amostra <- read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\projeto\\minhaAmostra7.txt", header = T, sep = "\t")
#Uma vez salva sua amostra, voc� est� pronto para come�ar as an�lises!
Amostra
#Primeira parte - Estat�stica Descritiva
#a. Classificar as vari�veis do banco - var. qualitativas nominais e ordinais; var. quantitativas discretas e cont�nuas;
#b. Construir tabelas e gr�ficos para as vari�veis qualitativas;

#O R n�o constr�i distribui��o de frequ�ncias de maneira direta.
#Para isso, voc� precisa coletar as frequ�ncias pelo R e depois construir uma tabela personalizada.

cor2  =  table(Cor)
cor
cor = names(freqAbsCidade) <- c("Rec", "Vit", "Flo", "NR")
cor
#Observa��o: voc� precisa acessar o CRIVO para saber o que significa as colunas 1, 2, 3 e 4
#Quer melhorar seu relat�rio? Descubra uma forma de "dar nome" aos c�digos diretamente no R.

Numero = table(N�mero)
NCidade = table(NCidade)
Local = table(Local)
Idade = table(Idade)
Cidade = table(Cidade)
Tempo = table(Tempo)
Bairro = table(Bairro)
Cor = table(Cor)
Religiao = table(Religi�o)
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

#Para construir gr�ficos adequados para as vari�veis, voc� pode explorar diversas fun��es gr�ficas do R

plot(cor)
barplot(cor, col = c("blue", "red", "yellow", "purple"))
barplot

#c. Calcular as medidas de posi��o e dispers�o para as vari�veis quantitativas;

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

#� sempre importante lembrar que as letras b. e c. s� estar�o totalmente corretas se a sua
#classifica��o utilizada em a. for tamb�m correta.


#Segunda parte - Probabilidade e Infer�ncia

#a. Verificar se as vari�veis quantitativas podem ser estudadas atrav�s de uma distribui��o normal
#A fun��o no R que faz essa verifica��o � um teste de hip�teses como o que segue
?ks.test
ks.test(Renda_da_familia, "pnorm", mean = mean(Renda_da_familia), sd = sd(Renda_da_familia))

#Se a vari�vel testada seguir uma distribui��o normal, o teste a ser utilizado ser�
#Um teste Z ou um teste T. Caso contr�rio, o teste utilizado ser� um teste de Wilcoxon

#b. Verificar atrav�s de um intervalo de confian�a e de um teste de hip�teses se os dados
#da sua amostra batem com os dados do banco inteiro.
#Nesse sentido, voc� precisa formular as hip�teses se baseando nas informa��es que voc� tem no
#banco de dados.
#Para utilizar intervalos de confian�a e testes com propor��o, minha exig�ncia ser� trabalhar
#com a vari�vel cidade. Nela, quero que voc�s fa�am a propor��o de pessoas em sua amostra e
#no banco todo que s�o de Recife. Depois crie hip�teses para essa situa��o e realize o teste.

rf_populacao <- dados[,22]
mean(Cor)
mean(Renda_da_familia)
help.search("mann whitney")
?wilcox.test
wilcox.test(Renda_da_familia, rf_populacao, alternative = "two.sided", conf.int = TRUE)
