

surveysex <- c("Maria", "21", "F", "Casada", "Cristo")
surveysex
names(surveysex)[1] = "Nome"
names(surveysex)[2] = "idade"
names(surveysex)[3] = "sexo"
names(surveysex)[4] = "Estado civil"
names(surveysex)[5] = "Bairro"
surveysex


Amostra <- read.table("E:\\Natanael\\tsi\\3periodo\\estatistica\\Nova\\estatistic\\EstatisticaR\\codigos\\meubd.txt", sep = "\t")
#Uma vez salva sua amostra, voc? est? pronto para come?ar as an?lises!
Amostra
colnames(Amostra)[1]<-'Pais' #renomeia o nome da primeira coluna do dataframe