#0############ATEN??O!!!###############
#Caso voc? tenha d?vida sobre o uso de alguma fun??o espec?fica, voc? possui dois caminhos
#Caso voc? j? saiba o nome da fun??o, voc? pode pedir ajudar utilizando o ? junto ao nome da fun??o. Exemplo
?mean
#Caso voc? n?o saiba o nome da fun??o, mas tenha ideia da mesma por alguma palavra similar, utilize o ?? junto a palavra que deve estar entre aspas
??"standard deviance"

#Agora vamos come?ar!

#Opera??es b?sicas direto no console do R
  2 + 4
Soma <- 2 + 4 #uma vari?vel recebe algum valor pelo sinal de <- ou = tanto faz qual utilizar
Multiplicacao = 3*6
Operacao = Soma/Multiplicacao

#Criando vetores no R

altura = c(1.63, 1.78, 1.69, 1.85, 1.75, 1.65, 1.67, 1.65, 1.65, 1.71, 1.84, 1.83, 1.76, 1.69, 1.67, 1.80) #separador decimal ? o ponto


#Criando matrizes no R

teste = matrix(nrow = 2, ncol = 2, c(0,1,2,3))
teste

#Lendo dados externos ao R

#fun??o read.txt ou read.csv ou read.table

#a fun??o read.table precisa do caminho do arquivo, al?m de voc? dizer se existe cabe?alho no seu arquivo e qual o tipo de separador

dados = read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\2019_OrcamentoDespesa.txt", header = T, sep = "\t") #o separador de tabula??o ? "\t" e da v?rgula ";"
#? necess?rio primeiro salvar o arquivo .xls (ou .xlsx) no formato .txt (serparaddo por tabula??o) ou .csv (separado por v?rgulas)

#No caso espec?fico do nosso banco, existem muitas informa??es faltantes
#classificadas como NA pelo R. ? preciso elimin?-las com o uso da seguinte
dados
dados = na.exclude(dados)

#S? a partir desse momento ? poss?vel retirar sua amostra.
#Agora estamos prontos para tentar retirar nossa amostra de tamanho 60.

Amostra <- dados[sample(nrow(dados), 60),]
attach(Amostra)


#Ap?s selecionar a amostra, voc? precisa salva-la em um arquivo, sen?o voc? vai gerar uma nova amostra toda vez que for acessar seu c?digo
#Para salvar sua amostra, utilize o seguinte comando

write.table(Amostra, "E:\\Natanael\\tsi\\3periodo\\estatistica\\2019_OrcamentoDespesa2.txt", append = F, sep = "\t", row.names = F) #O comando append = F
#diz ao R que caso voc? gere uma nova amostra, ela vai sobrepor a anterior. O comando row.names = F impede que o arquivo seja salvo com um t?tulo para cada linha
  Amostra2 <- read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\2019_OrcamentoDespesa2.txt", header = T, sep = "\t")
#Uma vez salva sua amostra, voc? est? pronto para come?ar as an?lises!
attach(Amostra2)
#Primeira parte - Estat?stica Descritiva
#a. Classificar as vari?veis do banco - var. qualitativas nominais e ordinais; var. quantitativas discretas e cont?nuas;
#b. Construir tabelas e gr?ficos para as vari?veis qualitativas;
mean()
#O R n?o constr?i distribui??o de frequ?ncias de maneira direta.
#Para isso, voc? precisa coletar as frequ?ncias pelo R e depois construir uma tabela personalizada.

#gr?ficos vari?veis qualitativa
Nome = table(NOME.ÓRGÃO.SUPERIOR)
Nome
  despesas = table(NOME.CATEGORIA.ECON?MICA)
despesas
  pie(Nome)
legend(Nomes)
Nomes
Nomes
?legend
pie(despesas,col = c("light blue","gray","black"), 
    main = "Gr?fico despesas ")
legend(3, fill = c("light blue","gray","black"), 
       legend = c("(80%)   DESPESAS CORRENTES", "(20%)DESPESAS DE CAPITAL"," (0%) RESERVA DE CONTINGENCIA "))
legend(1, 1.9, c("sin", "cos", "tan"), col = c(3, 4, 6),
       text.col = "green4", lty = c(2, -1, 1), pch = c(NA, 3, 4),
       merge = TRUE, bg = "gray90")
Nomes
pie(Nomes,col = c("light blue","gray","red"), labels = c("10%", "60%","30%"),  
    main = "Gr?fico profiss?o ")
legend(1,1.9,  c("light blue","gray","red"),
 legend = c("(60%)Educa??o", "(10%)Transporte"," (30%)sa?de"))

x <- c(32, 12, 30, 45)
labels <- c("California", "Paris", "Moscow", "Mumbai")
pct <- round(x/sum(x)*100)
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(x,labels = lbls, col=rainbow(length(lbls)),main="city_pie_chart")
pie(x,labels = lbls, col=rainbow(length(lbls)),main="city_pie_chart")
legend("topright", c("California", "Paris", "Moscow", "Mumbai"), cex=0.8,fill=rainbow(length(x)))


#Frequencias da vari?vel NCidade
freqabscidade = table(NCidade)
freqabscidade
freqrelcidade = prop.table(table(NCidade))
freqrelcidade

#Frequencias da variavel Local
freqabscidade = table(Local)
freqabscidade
freqrelcidade = prop.table(table(Local))
freqrelcidade
?prop.table
#Frequencias da variavel Cidade
freqabscidade = table(Cidade)
freqabscidade
freqrelcidade = prop.table(table(Cidade))
freqrelcidade

#Grafico da variavel Bairro
freqabsbairro = table(Bairro)
freqabsbairro
freqrelbairro = prop.table(table(Bairro))
freqrelbairro

#Grafico para variavel Cor
freqrelcor = prop.table(table(Cor))
freqrelcor
pie(NOME.?RG?O.SUBORDINADO)
NOME.?RG?O.SUBORDINADO
#Grafico para variavel Religi?o
freqabsreligiao = table(Religi?o)
freqabsreligiao
freqrelreligiao = prop.table(table(Religi?o))
freqrelreligiao

#grafico para variavel religiao_qual
freqabsreligiaoqual = table(Religi?o_qual)
freqabsreligiaoqual

barplot(NOME.?RG?O.SUBORDINADO, legend.text = c("Cat?lica","Evang?lica",
                                             "Esp?rita/Kardecista","Umbanda","Outra"), col = c("yellow",
                                                                                               "orange","brown","gray","black"),main = "Religi?o por Pessoa", ylim = c(0,35),
        names.arg = c("","","","",""))
#Grafico para Trabalho
freqreltrabalho = prop.table(table(Trabalho))
freqreltrabalho 

#Grafico para variavel Estudando
freqrelestudando = prop.table(table(Estudando))
freqrelestudando 
pie(freqrelestudando,col = c("light blue","light green"), labels = c("28%", "72%","1"), 
    main = "Gr?fico de setores para a vari?vel Estudando ")
legend("left", fill = c("light blue","light green"), 
       legend = c("Estuda", "N?o estuda"," nao sabe"))

#Grafico para a variavel Estudo
freqabsestudo = table(Estudo)
freqabsestudo
barplot(freqabsestudo, legend.text = c("E.F. Incompleto","E.F. Completo","E.M. Incompleto","E.M. Completo"),
        col = c("dark green","green","light green","gray"),
        main = "Gr?fico para Grau de Escolaridade",horiz = TRUE,
        xlim = c(0,50), names.arg = c("","","",""))

#Grafico para variavel habita??o
freqrelhabitacao = prop.table(table(Qualeotipodehabitacao))
freqrelhabitacao
pie(freqrelhabitacao,col = c("purple","pink","blue"), labels = c("95%", "3%","2%"), 
    main = "Tipos de Habita??o")
legend("right", fill = c("purple","pink","blue"), 
       legend = c("Casa", "Apartamento","C?modo"))

#Tabela Habit_outro
freqabshabitoutro = table(Habit_outro)
freqabshabitoutro

#tabela habit_alug
freqabshabitalug = table(Habit_alug)
freqabshabitalug
freqrelhabitalug = prop.table(table(Habit_alug))
freqrelhabitalug

#Tabela de Classe
freqabsclasse = table(Classe)
freqabsclasse

#Tabela de Civil
freqabsclasse = table(Classe)
freqabsclasse


#Observa??o: voc? precisa acessar o CRIVO para saber o que significa as colunas 1, 2, 3 e 4
#Quer melhorar seu relat?rio? Descubra uma forma de "dar nome" aos c?digos diretamente no R.

Numero = table(N?mero)
idade = table(Idade)
idade
NCidade = table(NCidade)
NCidade
Local = table(Local)
Local
Cidade = table(Cidade)
Cidade
Tempo = table(Tempo)
Bairro = table(Bairro)
Bairro
Cor = table(Cor)
Religiao = table(Religi?o)
Religiao
Religiao_qual = table(Religiao_qual)
estudando = table(Estudando)
estudando
Estudo = table(Estudo)
Estudo
Casa = table(Casa)
Casa
Estudo = table(Estudo)
Estudo
tipodehabitacao = table(Qualeotipodehabitacao)
Habit_outro = table(Habit_outro)

Habit_outro
Habit_alug = table(Habit_alug)
Habit_alug
Comodos = table(Comodos)
Trabalho = table(Trabalho)
Trabalho
Habitacao = table(Habita??o)
Habitacao
Recursos = table(Recursos)
Rendafamiliar = table(Renda_familiar)
Rendafamiliar
Rendadivpessoa = table(Renda_div_pessoa)
Rendadivpessoa

Renda_da_familia = table(Renda_da_familia)
classe = table(Classe)
civil = table(Civil)
Tempo = table(Tempo)
Tempo
#histograma idade
set.seed(50)                # Ajustar semente aleat?ria
Idade <- rchisq(200, 10)    # Gerar 200 observa??es
hist(Idade,col=c("blue","red","orange","green","pink")) 

freqRelCor <- prop.table(freqRelCor)
freqRelCor

#Para construir gr?ficos adequados para as vari?veis, voc? pode explorar diversas fun??es gr?ficas do R
cores<- c("Rec", "Vit", "Flo", "NR")
barplot(cores)
barplot(cores, col = c("blue", "red", "yellow", "purple"))
barplot


x <- c("Branca","preta")
 barplot(x)
 barplot(euro,xlab="Euro conversions",col="red",
          + legend.text="Valor da taxa")
#c. Calcular as medidas de posi??o e dispers?o para as vari?veis quantitativas;
 Religiao
medidas_posicao <- function(var_qtativa){
  media <- mean(var_qtativa)
  mediana <- median(var_qtativa)
  moda <- max(table(var_qtativa))
  return(c(media, mediana, moda))
}
#calculo de medidas de   posi??o
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
  ''
  barplot(Numero, col=10)
summary(idade)
color <- colorRampPalette(c("darkblue","lightblue"))
color(10)

barplot(a, col=color(10))
#? sempre importante lembrar que as letras b. e c. s? estar?o totalmente corretas se a sua
#classifica??o utilizada em a. for tamb?m correta.

#Segunda parte - Probabilidade e Infer?ncia

#a. Verificar se as vari?veis quantitativas podem ser estudadas atrav?s de uma distribui??o normal
#A fun??o no R que faz essa verifica??o ? um teste de hip?teses como o que segue
?ks.test

#Se a variavel testada seguir uma distribui??o normal, o teste a ser utilizado ser?
#Um teste Z ou um teste T. Caso contr?rio, o teste utilizado sera um teste de Wilcoxon

#c?digo da hip?tese no relat?rio fica na parte do c?digo e resulta da hip?tese fica no resultados

ks.test(Idade, "pnorm", mean = mean(Idade), sd = sd(Idade)) #testar cada vari?vel para saber se eh maior do 0.05 se for eh normal

#hipoteses de idade na populacao

require(BSDA)

z.test(Idade, alternative = " less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Idade, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Idade, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))

mean(dados[,4]) #//media da idade na populacao
sd(dados[,4]) #desvio padr?o da idade na populacao

mean(Idade)#//media da idade na amostra
sd(Idade)#//desvio padrao  da idade na amostra
  

#hip?tese de recursos para amostra

ks.test(Recursos, "pnorm", mean = mean(Recursos), sd = sd(Recursos))

z.test(Recursos, alternative = "less", mu = mean(Recursos), sigma.x = sd(Recursos))
z.test(Recursos, alternative = "greater", mu = mean(Recursos), sigma.x = sd(Recursos))
z.test(Recursos, alternative = "two.sided", mu = mean(Recursos), sigma.x = sd(Recursos))
mean(Recursos) #media de recursos na amostra
sd(Recursos) #desvio padr?o de recurso na amostra

#O p-value serve para rejeitarmos ou n?o a hipotese nula.
#Se p-value eh menor que 0,05 ou 0,01, eu rejeito a hip?tese.
#Caso contrario, eu nao rejeito H0.   olhar o  numero depois do zero virgula  (0,) ou seja, nesse caso, rejeita h0 entao h1 eh verdadeiro 

#hipotese de recursos da populacao


z.test(Recursos, alternative = "less", mu = mean(dados[,19]), sigma.x = sd(dados[,19]))
z.test(Recursos, alternative = "greater", mu = mean(dados[,19]), sigma.x = sd(dados[,19]))
z.test(Recursos, alternative = "two.sided", mu = mean(dados[,19]), sigma.x = sd(dados[,19]))

mean(dados[,19]) # media de recursos na popula??o
sd(dados[,19]) # desvio padr?o de recursos na popula??o
    
?z.test
require(BSDA)
mean(dados[,4])
sd(dados[,4])
mean(Rendafamiliar)
summary(Rendafamiliar)
#hipoteses de renda familiar
z.test(Rendafamiliar, alternative = "less", mu = mean(dados[,20]), sigma.x = sd(dados[,20]))
z.test(Rendafamiliar, alternative = "greater", mu = mean(dados[,20]), sigma.x = sd(dados[,20]))
z.test(Rendafamiliar, alternative = "two.sided", mu = mean(dados[,20]), sigma.x = sd(dados[,20]))





#hipoteses de rendadivpessoa
z.test(Rendadivpessoa, alternative = "less", mu = mean(dados[,21]), sigma.x = sd(dados[,4]))
z.test(Rendadivpessoa, alternative = "greater", mu = mean(dados[,21]), sigma.x = sd(dados[,21]))
z.test(Rendadivpessoa, alternative = "two.sider", mu = mean(dados[,21]), sigma.x = sd(dados[,4]))
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
 



 



#b. Verificar atraves de um intervalo de confianca e de um teste de hipoteses se os dados
#da sua amostra batem com os dados do banco inteiro.
#Nesse sentido, voc? precisa formular as hip?teses se baseando nas informa??es que voc? tem no
#banco de dados.
#Para utilizar intervalos de confian?a e testes com propor??o, minha exig?ncia ser? trabalhar
#com a vari?vel cidade. Nela, quero que voc?s fa?am a propor??o de pessoas em sua amostra e
#no banco todo que s?o de Recife. Depois crie hip?teses para essa situa??o e realize o teste.

  
  cidade = prop.table(Cidade) #
  cidade
 
  
   
  
  #realizar a regressao e correlacao das variaveis quantitativas
  #realizar teste dois por tipo de teste
  #Teste de media para uma amostra
  #Teste de proporcao para uma amostra
  #Teste de media para duas amostras
  #Teste de proporcao para duas amostras

amostra1 = Rendadivpessoa



amostra2 = Renda_da_familia

    t.test(amostra2,mu=15) #teste de  m?dia para uma amostra

  t.test(amostra1,amostra2) #teste para m?dia de duas amostras
        
     

      #propor??o para duas amostras:
      prop.test(x = c(Renda_da_familia[1],60),n = c(Rendadivpessoa[2],60) , alternative = "greater")

      
      prop.test(x = c(NCidade[1],60),n = c(NCidade[2],60) , alternative = "greater")
      
#amostra  da cidade de recife - propor??o para uma amostra
  
    prop.test(NCidade[1], 60, p=0.4,  alternative = "greater",   conf.level = 0.99, correct = TRUE) #Sempre utilizar a frequ?ncia abs. juntamente com o n igual ao tamanho da amostra

  
      |#calculo para media de duas amostra cidade de recife da amostra com a populacao
      #  na variavel x o primeiro valor eh da populacao e o segundo eh da amostra
      #No n, o primeiro valor ? o total da popula??o, o segundo ? o total da amostra
      
          testeMediaRecife <- t.test(x = c(59,36), n = c(102, 60)) #essa linha calcula a media entre a amostra e  popula??o de recife    testeMediaRecife

                #c?lculo propor??o  para populacao que mora em recife
               table(dados[,2])
               testePropCidadeRecife <- prop.test(x = c(59,36), n = c(102, 60))
               testePropCidadeRecife
              #No x, o primeiro valor ? de pessoas de Recife na popula??o, o segundo ? na amostra
               #No n, o primeiro valor ? o total da popula??o, o segundo ? o total da amostra
               #Para testes de diferen?a entre duas amostras (propor??o ou m?dia)
               #Se o intervalo de confian?a conter o 0, ent?o n?o h? diferen?a de
               #(propor??o ou m?dia)
               #Ou se o p-value for maior que 0,01 ou 0,05 n?o h? diferen?a
               testePropCidadeVitoria <- prop.test(x = c(21, 13), n = c(102,60), conf.level = 0.99)
               testePropCidadeVitoria
               #S? precisa mudar o conf.level se o p-value for menor que 0,05.
               dadosdataframe <- matrix(c(dados[,2], NCidade), nrow = ) 
               dadosmatrix   <- as.table(as.matrix(dadosdataframe)) 
               prop.test(dadosmatrix[2],102, p=0.4,  alternative = "greater",   conf.level = 0.99, correct = TRUE) #Sempre utilizar a frequ?ncia abs. juntamente com o n igual ao tamanho da amostra
               ?prop.test
            ?data.frame                  
               
 #Terceira parte - Correla??o e Regress?o
 
 #Verificar quais vari?veis QUANTITATIVAS s?o relacionadas entre si
 
 #a. Buscar correla??o entre as vari?veis quantitativas, tanto na popula??o quanto na sua amostra.
 #Para isso, use o comando de correla??o que o R d?. Construa um gr?fico de pontos tamb?m.
               
               
cor(Renda_familiar, Casa)   #testa a correla??o de renda familiar e casa
cor.test(Renda_familiar, Casa) #faz o teste de  correla?ao 
dotchart(Renda_familiar,Casa) #grafico de pontos de renda familiar e casa 
cor(dados[,20], dados[,13]) #correla??o entre Renda familiar e casa da populacao
 
 cor(Trabalho,Habit_alug) #correlacao entre o trabalho
 cor.test(Trabalho,Habit_alug) #teste de correla??o entre habit_alug e trabalho
 dotchart(Trabalho,Habit_alug) #gr?fico de pontos de trabalho e habit alug
 
 cor(dados[,18],dados[,16]) #correla??o da popula??o entre habit_alug e trabalho
 
  cor(Comodos,Casa)          #correla??o entre comodos e casa
  cor.test(Comodos,Casa) #teste de correla??o entre comodos e casa
  dotchart(Comodos,Casa) #gr?fico de pontos de comodos e casa
  
  cor(dados[,17] , dados[,13]) #correlacao da populacao entre comodos e casa
  
  cor(Habit_alug,Renda_familiar)   #verifica se a correla??o entre habit alug e renda familiar
  cor.test(Habit_alug, Renda_familiar) #testar a correla??o entre habit alug e renda familiar
  dotchart(Habit_alug,Renda_familiar) #gr?fico de pontos entre habit alug e renda familiar
  
  cor(dados[,16,], dados[,20]) #verifica a correla??o entre nhabit alug e renda familiar na populacao
  
  #Obs.: Para verificar a correla??o de Pearson entre duas vari?veis
 #voce precisa se certificar de que as mesmas possuem o mesmo tamanho.
 #Caso nao, voce so pode considerar variaveis de mesmo tamanho.
 
 #b. Buscar um modelo de regress?o tanto para a popula??o quanto para a sua amostra
 #Coloque no gr?fico de pontos, a reta que representa o modelo de regress?o.
 
 
 reg_pop = lm(dados[,22] ~ dados[,21])
 summary(reg_pop)
 #Se ao lado da coluna Pr(>|t|) tiver algum ponto ou asterisco, aquela vari?vel
 #influencia a principal. Se n?o tiver, ela n?o influencia
 
 #calculo de regressao de renda familiar e renda div pessoa
 reg_amos = lm(Renda_da_familia ~ Renda_div_pessoa)
  summary(reg_amos)
 #regress?o de classe e estudo

  plot(Renda_familiar ~ Renda_div_pessoa) 
  par(new=TRUE) 
  plot(Renda_familiar ~ Renda_div_pessoa, xlab="",ylab="") 
  par(new=TRUE) 
  plot(Renda_familiar ~ Renda_div_pessoa, xlab="",ylab="") 
  abline(lm(Renda_familiar ~ Renda_div_pessoa))
  

  
  #calculo de regressao de trabalho e recurso
  
  reg_amos = lm(Trabalho ~ Recursos)
  summary(reg_amos)

  #grafico de estudo e habit  
  plot(Estudo ~ Habit_alug) 
  par(new=TRUE) 
  plot(Estudo ~ Habit_alug, xlab="",ylab="") 
  par(new=TRUE) 
  plot(Estudo ~ Habit_alug, xlab="",ylab="") 
   abline(lm(Estudo ~ Habit_alug))
  #c?lculo de regress?o de estudo e habit alug
  
  reg_amos = lm( Estudo ~ Habit_alug)
  
  summary(reg_amos)
  
  
  #grafico de recursos e renda familiar  
  plot(Recursos ~ Renda_familiar) 
  par(new=TRUE) 
  plot(Recursos ~ Renda_familiar, xlab="",ylab="") 
  par(new=TRUE) 
  plot(Recursos ~ Renda_familiar, xlab="",ylab="") 
  abline(lm(Recursos ~ Renda_familiar))
  #c?lculo de regress?o de recursos e renda familiar
  
  reg_amos = lm( Recursos ~ Renda_familiar)
  
  summary(reg_amos)
  
  
 reg_pop2 = lm(dados[,20] ~ dados[,4] + dados[,21])
 summary(reg_pop2)
 step(reg_pop2)
 
  plot(Trabalho ~ Recursos) 
 par(new=TRUE) 
 plot(Trabalho ~ Recursos, xlab="",ylab="") 
 par(new=TRUE) 
 plot(Trabalho ~ Recursos, xlab="",ylab="") 
 abline(lm(Trabalho ~ Recursos))
 
 reg_amos = lm( Trabalho ~ Renda_familiar)
 
 summary(reg_amos)
 
#  
#  ?lm
#  summary(cid)
#  ?prop.table
# summary(cidades)
# rf_populacao <- dados[,22]
# mean(Cor)
# mean(Renda_da_familia)
# help.search("mann whitney")
# ?wilcox.test
# wilcox.test(Renda_da_familia, rf_populacao, alternative = "two.sided", conf.int = TRUE)
