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

dados = read.table("C:\\Users\\Adenilson\\Downloads\\arquivos Nayanna\\faculdade\\probabilidade e estatistica\\projeto\\minhaAmostra.txt", header = T, sep = "\t") #o separador de tabula��o � "\t" e da v�rgula ";"
#� necess�rio primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabula��o) ou .csv (separado por v�rgulas)

#No caso espec�fico do nosso banco, existem muitas informa��es faltantes
#classificadas como NA pelo R. � preciso elimin�-las com o uso da seguinte

dados = na.exclude(dados)

#S� a partir desse momento � poss�vel retirar sua amostra.
#Agora estamos prontos para tentar retirar nossa amostra de tamanho 60.

Amostra <- dados[sample(nrow(dados), 60),]
attach(Amostra)


#Ap�s selecionar a amostra, voc� precisa salva-la em um arquivo, sen�o voc� vai gerar uma nova amostra toda vez que for acessar seu c�digo
#Para salvar sua amostra, utilize o seguinte comando

write.table(Amostra, "C:\\Users\\Adenilson\\Downloads\\arquivos Nayanna\\faculdade\\probabilidade e estatistica\\projeto\\minhaAmostra.txt", append = F, sep = "\t", row.names = F) #O comando append = F
#diz ao R que caso voc� gere uma nova amostra, ela vai sobrepor a anterior. O comando row.names = F impede que o arquivo seja salvo com um t�tulo para cada linha
Amostra <- read.table("C:\\Users\\Adenilson\\Downloads\\arquivos Nayanna\\faculdade\\probabilidade e estatistica\\projeto\\minhaAmostra.txt", header = T, sep = "\t")
#Uma vez salva sua amostra, voc� est� pronto para come�ar as an�lises!
Amostra
#Primeira parte - Estat�stica Descritiva
#a. Classificar as vari�veis do banco - var. qualitativas nominais e ordinais; var. quantitativas discretas e cont�nuas;
#b. Construir tabelas e gr�ficos para as vari�veis qualitativas;

#O R n�o constr�i distribui��o de frequ�ncias de maneira direta.
#Para isso, voc� precisa coletar as frequ�ncias pelo R e depois construir uma tabela personalizada.

#gr�ficos vari�veis qualitativa

#Grafico de Pessoas por Cidade
barplot(NCidade, names.arg = c("Recife","Vit�ria","Florian�polis"),
        col = c("yellow","orange","brown"),
        main = "Pessoas por Cidade",
        ylim = c(0,40))

#Grafico para Cor
cor = prop.table(table(Cor))
cor
pie(cor, col = c("dark blue","blue", "purple", "pink"),
    labels = c("28%","20%","50%","2%"),
    main = "Gr�fico de setores para a vari�vel Cor/Ra�a")
    legend("right", fill = c("dark blue","blue","purple","pink"), 
    legend = c("Branca","Preta","Parda","Outro") ) 

#Grafico para Trabalho
trabalho = prop.table(table(Trabalho))
trabalho 
pie(trabalho,col = c("red","gray"), labels = c("50%", "50%"), 
    main = "Gr�fico de setores para a vari�vel Trabalho")
    legend("left", fill = c("red","gray"), 
    legend = c("At. Remun.", "Recebe beneficio"))
  

#Grafico para variavel Estudando
estudando = prop.table(table(Estudando))
estudando 
pie(estudando,col = c("light blue","light green"), labels = c("28%", "72%"), 
     main = "Gr�fico de setores para a vari�vel Estudando ")
     legend("left", fill = c("light blue","light green"), 
     legend = c("Estuda", "N�o estuda"))
    
    
#Grafico para a variavel Estudo
estudo = table(Estudo)
estudo
barplot(estudo, legend.text = c("E.F. Incompleto","E.F. Completo","E.M. Incompleto","E.M. Completo"),
  col = c("dark green","green","light green","gray"),
  main = "Gr�fico para Grau de Escolaridade",horiz = TRUE,
  xlim = c(0,50), names.arg = c("","","",""))

#Grafico para variavel habita��o
habitacao = table(Qualeotipodehabitacao)
habitacao
barplot(habitacao, legend.text = c("Casa","Apartamento","C�modo"),
        col = c("black","dark gray","gray"),
        main = "Gr�fico para tipos de Habita��o",
        ylim = c(0,60),xlim = c(0,9), names.arg = c("","",""))
    

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
Rendadivpessoa = table(Renda_div_pessoa)
Renda_da_familia = table(Renda_da_familia)
classe = table(Classe)
civil = table(Civil)

#histograma idade
set.seed(50)                # Ajustar semente aleat�ria
Idade <- rchisq(200, 10)    # Gerar 200 observa��es
hist(Idade,col=c("blue","red","orange","green","pink")) 

freqRelCor <- prop.table(freqRelCor)
freqRelCor

#Para construir gr�ficos adequados para as vari�veis, voc� pode explorar diversas fun��es gr�ficas do R
cores<- c("Rec", "Vit", "Flo", "NR")
barplot(cores)
barplot(cores, col = c("blue", "red", "yellow", "purple"))
barplot


x <- c("Branca","preta")
 barplot(x)
 barplot(euro,xlab="Euro conversions",col="red",
          + legend.text="Valor da taxa")
#c. Calcular as medidas de posi��o e dispers�o para as vari�veis quantitativas;

medidas_posicao <- function(var_qtativa){
  media <- mean(var_qtativa)
  mediana <- median(var_qtativa)
  moda <- max(table(var_qtativa))
  return(c(media, mediana, moda))
}
#calculo de medidas de   posi��o
medidas_posicao(Numero) #OK
medidas_posicao(Idade) #OK
medidas_posicao(Tempo) #OK
medidas_posicao(Casa) #OK
medidas_posicao(Comodos) #ok
medidas_posicao(Recursos) #ok
medidas_posicao(Rendafamiliar) #ok
medidas_posicao(Rendadivpessoa)
medidas_posicao(Renda_da_familia)#ok




  color <- colorRampPalette(c("red","yellow", "green"))
  color(10)
  
  barplot(Numero, col=10)
summary(idade)
color <- colorRampPalette(c("darkblue","lightblue"))
color(10)

barplot(a, col=color(10))
#� sempre importante lembrar que as letras b. e c. s� estar�o totalmente corretas se a sua
#classifica��o utilizada em a. for tamb�m correta.

#Segunda parte - Probabilidade e Infer�ncia

#a. Verificar se as vari�veis quantitativas podem ser estudadas atrav�s de uma distribui��o normal
#A fun��o no R que faz essa verifica��o � um teste de hip�teses como o que segue
?ks.test

#Se a vari�vel testada seguir uma distribui��o normal, o teste a ser utilizado ser�
#Um teste Z ou um teste T. Caso contr�rio, o teste utilizado ser� um teste de Wilcoxon

#hip�tese para numero

z.test(Numero, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Numero, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Numero, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))


mean(Numero)   #m�dia da vari�vel n�mero
mean(dados[,4]) #m�dia da populacao
sd(dados[,4]) #desvio padrao populacional 
summary(Numero)

#hipoteses de idade

ks.test(Idade, "pnorm", mean = mean(Idade), sd = sd(Idade))

z.test(Idade, alternative = " less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Idade, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Idade, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
mean(Idade) #media da idade
summary(Idade)
mean(dados[,4]) #//media da populacao
sd(Idade)
#hipoteses de tempo

z.test(Tempo, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Tempo, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Tempo, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
mean(dados[,4])
mean(Tempo) #media da variavel tempo
sd(Tempo)

#hipoteses de casa

z.test(Casa, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Casa, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Casa, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
mean(Casa)
mean(dados[,4])
sd(Casa)

#hipoteses de comodos
z.test(Comodos, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Comodos, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Comodos, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
mean(Comodos)
mean(dados[,4])

#hipoteses de recursos

Recursos
?z.test
z.test(Recursos, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Recursos, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Recursos, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
mean(Recursos)
mean(dados[,4])


?z.test
require(BSDA)
mean(dados[,4])
sd(dados[,4])
mean(Rendafamiliar)
summary(Rendafamiliar)
#hipoteses de renda familiar
z.test(Rendafamiliar, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Rendafamiliar, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Rendafamiliar, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))





#hipoteses de rendadivpessoa
z.test(Rendadivpessoa, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Rendadivpessoa, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Rendadivpessoa, alternative = "two.sider", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
mean(Rendadivpessoa)
mean(dados[,4])
 summary(Rendadivpessoa)
 
 ?z.test
 require(BSDA)
 mean(dados[,4])
 sd(dados[,4])
 mean(Renda_da_familia)
 summary(Renda_da_familia)
 z.test(Renda_da_familia, alternative = "less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
 z.test(Renda_da_familia, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
 z.test(Renda_da_familia, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
 

 
 
 



#b. Verificar atrav�s de um intervalo de confian�a e de um teste de hip�teses se os dados
#da sua amostra batem com os dados do banco inteiro.
#Nesse sentido, voc� precisa formular as hip�teses se baseando nas informa��es que voc� tem no
#banco de dados.
#Para utilizar intervalos de confian�a e testes com propor��o, minha exig�ncia ser� trabalhar
#com a vari�vel cidade. Nela, quero que voc�s fa�am a propor��o de pessoas em sua amostra e
#no banco todo que s�o de Recife. Depois crie hip�teses para essa situa��o e realize o teste.

summary(Idade)
rf_populacao <- dados[,22]
mean(Cor)
mean(Renda_da_familia)
help.search("mann whitney")
?wilcox.test
wilcox.test(Renda_da_familia, rf_populacao, alternative = "two.sided", conf.int = TRUE)
