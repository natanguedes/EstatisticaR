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

dados = read.table("Z:\\20121370431\\Downloads\\Banco_de_dados_Trabalho.txt", header = T, sep = "\t") #o separador de tabulação é "\t" e da vírgula ";"
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

write.table(Amostra, "C:\\Users\\Adenilson\\Downloads\\arquivos Nayanna\\faculdade\\probabilidade e estatistica\\projeto\\minhaAmostra.txt", append = F, sep = "\t", row.names = F) #O comando append = F
#diz ao R que caso você gere uma nova amostra, ela vai sobrepor a anterior. O comando row.names = F impede que o arquivo seja salvo com um título para cada linha
  Amostra <- read.table("Z:\\20121370431\\Downloads\\minhaAmostra.txt", header = T, sep = "\t")
#Uma vez salva sua amostra, você está pronto para começar as análises!
Amostra
#Primeira parte - Estatística Descritiva
#a. Classificar as variáveis do banco - var. qualitativas nominais e ordinais; var. quantitativas discretas e contínuas;
#b. Construir tabelas e gráficos para as variáveis qualitativas;
mean()
#O R não constrói distribuição de frequências de maneira direta.
#Para isso, você precisa coletar as frequências pelo R e depois construir uma tabela personalizada.

#gráficos variáveis qualitativa

#Frequencias da variável NCidade
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
pie(freqrelcor, col = c("dark blue","blue", "purple", "pink"),
    labels = c("28%","20%","50%","2%"),
    main = "Gráfico de setores para a variável Cor/Raça")
legend("right", fill = c("dark blue","blue","purple","pink"), 
       legend = c("Branca","Preta","Parda","Outro") ) 

#Grafico para variavel Religião
freqabsreligiao = table(Religião)
freqabsreligiao
freqrelreligiao = prop.table(table(Religião))
freqrelreligiao

#grafico para variavel religiao_qual
freqabsreligiaoqual = table(Religião_qual)
freqabsreligiaoqual

barplot(freqabsreligiaoqual, legend.text = c("Católica","Evangélica",
                                             "Espírita/Kardecista","Umbanda","Outra"), col = c("yellow",
                                                                                               "orange","brown","gray","black"),main = "Religião por Pessoa", ylim = c(0,35),
        names.arg = c("","","","",""))
#Grafico para Trabalho
freqreltrabalho = prop.table(table(Trabalho))
freqreltrabalho 
pie(freqreltrabalho,col = c("red","gray"), labels = c("50%", "50%"), 
    main = "Gráfico de setores para a variável Trabalho")
legend("left", fill = c("red","gray"), 
       legend = c("At. Remun.", "Recebe beneficio"))


#Grafico para variavel Estudando
freqrelestudando = prop.table(table(Estudando))
freqrelestudando 
pie(freqrelestudando,col = c("light blue","light green"), labels = c("28%", "72%"), 
    main = "Gráfico de setores para a variável Estudando ")
legend("left", fill = c("light blue","light green"), 
       legend = c("Estuda", "Não estuda"))

#Grafico para a variavel Estudo
freqabsestudo = table(Estudo)
freqabsestudo
barplot(freqabsestudo, legend.text = c("E.F. Incompleto","E.F. Completo","E.M. Incompleto","E.M. Completo"),
        col = c("dark green","green","light green","gray"),
        main = "Gráfico para Grau de Escolaridade",horiz = TRUE,
        xlim = c(0,50), names.arg = c("","","",""))

#Grafico para variavel habitação
freqrelhabitacao = prop.table(table(Qualeotipodehabitacao))
freqrelhabitacao
pie(freqrelhabitacao,col = c("purple","pink","blue"), labels = c("95%", "3%","2%"), 
    main = "Tipos de Habitação")
legend("right", fill = c("purple","pink","blue"), 
       legend = c("Casa", "Apartamento","Cômodo"))

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


#Observação: você precisa acessar o CRIVO para saber o que significa as colunas 1, 2, 3 e 4
#Quer melhorar seu relatório? Descubra uma forma de "dar nome" aos códigos diretamente no R.

Numero = table(Número)
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
Religiao = table(Religião)
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
Habitacao = table(Habitação)
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
set.seed(50)                # Ajustar semente aleatória
Idade <- rchisq(200, 10)    # Gerar 200 observações
hist(Idade,col=c("blue","red","orange","green","pink")) 

freqRelCor <- prop.table(freqRelCor)
freqRelCor

#Para construir gráficos adequados para as variáveis, você pode explorar diversas funções gráficas do R
cores<- c("Rec", "Vit", "Flo", "NR")
barplot(cores)
barplot(cores, col = c("blue", "red", "yellow", "purple"))
barplot


x <- c("Branca","preta")
 barplot(x)
 barplot(euro,xlab="Euro conversions",col="red",
          + legend.text="Valor da taxa")
#c. Calcular as medidas de posição e dispersão para as variáveis quantitativas;
 Religiao
medidas_posicao <- function(var_qtativa){
  media <- mean(var_qtativa)
  mediana <- median(var_qtativa)
  moda <- max(table(var_qtativa))
  return(c(media, mediana, moda))
}
#calculo de medidas de   posição
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
#É sempre importante lembrar que as letras b. e c. só estarão totalmente corretas se a sua
#classificação utilizada em a. for também correta.

#Segunda parte - Probabilidade e Inferência

#a. Verificar se as variáveis quantitativas podem ser estudadas através de uma distribuição normal
#A função no R que faz essa verificação é um teste de hipóteses como o que segue
?ks.test

#Se a variável testada seguir uma distribuição normal, o teste a ser utilizado será
#Um teste Z ou um teste T. Caso contrário, o teste utilizado será um teste de Wilcoxon

#código da hipótese no relatório fica na parte do código e resulta da hipótese fica no resultados

ks.test(Idade, "pnorm", mean = mean(Idade), sd = sd(Idade)) #testar cada variável para saber se é maior do 0.05 se for é normal

#hipoteses de idade na populacao

require(BSDA)

z.test(Idade, alternative = " less", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Idade, alternative = "greater", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))
z.test(Idade, alternative = "two.sided", mu = mean(dados[,4]), sigma.x = sd(dados[,4]))

mean(dados[,4]) #//media da idade na populacao
sd(dados[,4]) #desvio padrão da idade na populacao

mean(Idade)#//media da idade na amostra
sd(Idade)#//desvio padrao  da idade na amostra
  

#hipótese de recursos para amostra

ks.test(Recursos, "pnorm", mean = mean(Recursos), sd = sd(Recursos))

z.test(Recursos, alternative = "less", mu = mean(Recursos), sigma.x = sd(Recursos))
z.test(Recursos, alternative = "greater", mu = mean(Recursos), sigma.x = sd(Recursos))
z.test(Recursos, alternative = "two.sided", mu = mean(Recursos), sigma.x = sd(Recursos))
mean(Recursos) #media de recursos na amostra
sd(Recursos) #desvio padrão de recurso na amostra

#O p-value serve para rejeitarmos ou não a hipótese nula.
#Se p-value é menor que 0,05 ou 0,01, eu rejeito a hipótese.
#Caso contrário, eu não rejeito H0.   olhar o  numero depois do zero virgula  (0,) ou seja, nesse caso, rejeita h0 entao h1 é verdadeiro 

#hipotese de recursos da populacao


z.test(Recursos, alternative = "less", mu = mean(dados[,19]), sigma.x = sd(dados[,19]))
z.test(Recursos, alternative = "greater", mu = mean(dados[,19]), sigma.x = sd(dados[,19]))
z.test(Recursos, alternative = "two.sided", mu = mean(dados[,19]), sigma.x = sd(dados[,19]))

mean(dados[,19]) # media de recursos na população
sd(dados[,19]) # desvio padrão de recursos na população
    
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
 

 #
 
 



#b. Verificar através de um intervalo de confiança e de um teste de hipóteses se os dados
#da sua amostra batem com os dados do banco inteiro.
#Nesse sentido, você precisa formular as hipóteses se baseando nas informações que você tem no
#banco de dados.
#Para utilizar intervalos de confiança e testes com proporção, minha exigência será trabalhar
#com a variável cidade. Nela, quero que vocês façam a proporção de pessoas em sua amostra e
#no banco todo que são de Recife. Depois crie hipóteses para essa situação e realize o teste.

  
  cidade = prop.table(Cidade) #
  cidade
 
  
   
  
  #realizar a regressão e correlação das variáveis quantitativas
  #realizar teste dois por tipo de teste
  #Teste de média para uma amostra
  #Teste de proporção para uma amostra
  #Teste de média para duas amostras
  #Teste de proporção para duas amostras

amostra1 = Rendadivpessoa



amostra2 = Renda_da_familia

    t.test(amostra2,mu=15) #teste de  média para uma amostra

  t.test(amostra1,amostra2) #teste para média de duas amostras
        
     

      #proporção para duas amostras:
      prop.test(x = c(Renda_da_familia[1],60),n = c(Rendadivpessoa[2],60) , alternative = "greater")

      
      prop.test(x = c(NCidade[1],60),n = c(NCidade[2],60) , alternative = "greater")
      
#amostra  da cidade de recife - proporção para uma amostra
  
    prop.test(NCidade[1], 60, p=0.4,  alternative = "greater",   conf.level = 0.99, correct = TRUE) #Sempre utilizar a frequência abs. juntamente com o n igual ao tamanho da amostra

  
      |#calculo para media de duas amostra cidade de recife da amostra com a populacao
      #  na variavel x o primeiro valor é da populacao e o segundo é da amostra
      #No n, o primeiro valor é o total da população, o segundo é o total da amostra
      
          testeMediaRecife <- t.test(x = c(59,36), n = c(102, 60)) #essa linha calcula a media entre a amostra e  população de recife    testeMediaRecife

                #cálculo proporção  para populacao que mora em recife
               table(dados[,2])
               testePropCidadeRecife <- prop.test(x = c(59,36), n = c(102, 60))
               testePropCidadeRecife
              #No x, o primeiro valor é de pessoas de Recife na população, o segundo é na amostra
               #No n, o primeiro valor é o total da população, o segundo é o total da amostra
               #Para testes de diferença entre duas amostras (proporção ou média)
               #Se o intervalo de confiança conter o 0, então não há diferença de
               #(proporção ou média)
               #Ou se o p-value for maior que 0,01 ou 0,05 não há diferença
               testePropCidadeVitoria <- prop.test(x = c(21, 13), n = c(102,60), conf.level = 0.99)
               testePropCidadeVitoria
               #Só precisa mudar o conf.level se o p-value for menor que 0,05.
               dadosdataframe <- matrix(c(dados[,2], NCidade), nrow = ) 
               dadosmatrix   <- as.table(as.matrix(dadosdataframe)) 
               prop.test(dadosmatrix[2],102, p=0.4,  alternative = "greater",   conf.level = 0.99, correct = TRUE) #Sempre utilizar a frequência abs. juntamente com o n igual ao tamanho da amostra
               ?prop.test
            ?data.frame                  
               
 #Terceira parte - Correlação e Regressão
 
 #Verificar quais variáveis QUANTITATIVAS são relacionadas entre si
 
 #a. Buscar correlação entre as variáveis quantitativas, tanto na população quanto na sua amostra.
 #Para isso, use o comando de correlação que o R dá. Construa um gráfico de pontos também.
               
               
cor(Renda_familiar, Casa)   #testa a correlação de renda familiar e casa
cor.test(Renda_familiar, Casa) #faz o teste de  correlaçao 
dotchart(Renda_familiar,Casa) #grafico de pontos de renda familiar e casa 
cor(dados[,20], dados[,13]) #correlação entre Renda familiar e casa da populacao
 
 cor(Trabalho,Habit_alug) #correlacao entre o trabalho
 cor.test(Trabalho,Habit_alug) #teste de correlação entre habit_alug e trabalho
 dotchart(Trabalho,Habit_alug) #gráfico de pontos de trabalho e habit alug
 
 cor(dados[,18],dados[,16]) #correlação da população entre habit_alug e trabalho
 
  cor(Comodos,Casa)          #correlação entre comodos e casa
  cor.test(Comodos,Casa) #teste de correlação entre comodos e casa
  dotchart(Comodos,Casa) #gráfico de pontos de comodos e casa
  
  cor(dados[,17] , dados[,13]) #correlacao da populacao entre comodos e casa
  
  cor(Habit_alug,Renda_familiar)   #verifica se a correlação entre habit alug e renda familiar
  cor.test(Habit_alug, Renda_familiar) #testar a correlação entre habit alug e renda familiar
  dotchart(Habit_alug,Renda_familiar) #gráfico de pontos entre habit alug e renda familiar
  
  cor(dados[,16,], dados[,20]) #verifica a correlação entre nhabit alug e renda familiar na populacao
  
  #Obs.: Para verificar a correlação de Pearson entre duas variáveis
 #você precisa se certificar de que as mesmas possuem o mesmo tamanho.
 #Caso não, você só pode considerar variáveis de mesmo tamanho.
 
 #b. Buscar um modelo de regressão tanto para a população quanto para a sua amostra
 #Coloque no gráfico de pontos, a reta que representa o modelo de regressão.
 
 
 reg_pop = lm(dados[,22] ~ dados[,21])
 summary(reg_pop)
 #Se ao lado da coluna Pr(>|t|) tiver algum ponto ou asterisco, aquela variável
 #influencia a principal. Se não tiver, ela não influencia
 
 #calculo de regressao de renda familiar e renda div pessoa
 reg_amos = lm(Renda_da_familia ~ Renda_div_pessoa)
  summary(reg_amos)
 #regressão de classe e estudo

  plot(Renda_familiar ~ Renda_div_pessoa) 
  par(new=TRUE) 
  plot(Renda_familiar ~ Renda_div_pessoa, xlab="",ylab="") 
  par(new=TRUE) 
  plot(Renda_familiar ~ Renda_div_pessoa, xlab="",ylab="") 
  abline(lm(Renda_familiar ~ Renda_div_pessoa))
  

  
  #cálculo de regressão de trabalho e recurso
  
  reg_amos = lm(Trabalho ~ Recursos)
  summary(reg_amos)

  #grafico de estudo e habit  
  plot(Estudo ~ Habit_alug) 
  par(new=TRUE) 
  plot(Estudo ~ Habit_alug, xlab="",ylab="") 
  par(new=TRUE) 
  plot(Estudo ~ Habit_alug, xlab="",ylab="") 
   abline(lm(Estudo ~ Habit_alug))
  #cálculo de regressão de estudo e habit alug
  
  reg_amos = lm( Estudo ~ Habit_alug)
  
  summary(reg_amos)
  
  
  #grafico de recursos e renda familiar  
  plot(Recursos ~ Renda_familiar) 
  par(new=TRUE) 
  plot(Recursos ~ Renda_familiar, xlab="",ylab="") 
  par(new=TRUE) 
  plot(Recursos ~ Renda_familiar, xlab="",ylab="") 
  abline(lm(Recursos ~ Renda_familiar))
  #cálculo de regressão de recursos e renda familiar
  
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