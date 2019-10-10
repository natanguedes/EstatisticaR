install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='', dbname='produto', host='localhost')
mydb
rs = dbSendQuery(mydb, "select nome from marca")
rs
data = fetch(rs, n=-1) #executa a consulta
data #mostra o resultado
       

#make slices
slices <- c(50, 50)

# Define some colors 
colors <- c("cyan","white")

# Calculate the percentage for each day, rounded to one decimal place
slices_labels <- round(slices/sum(slices) * 100, 1)

# Concatenate a '%' char after each value
slices_labels <- paste(slices_labels, "%", sep="")

# Create a pie chart with defined heading and custom colors and labels
pie(slices, main="Marcas", col=colors, labels=slices_labels, cex=0.8)


# Create a legend at the right   
legend(.9, .1, c("Parmalat","Nestle"), cex=0.7, fill=colors)












       
       #make slices
       slices <- c(19, 26, 55)
       
       # Define some colors 
       colors <- c("yellow2","olivedrab3","orangered3")
       
       # Calculate the percentage for each day, rounded to one decimal place
       slices_labels <- round(slices/sum(slices) * 100, 1)
       
       # Concatenate a '%' char after each value
       slices_labels <- paste(slices_labels, "%", sep="")
       
       # Create a pie chart with defined heading and custom colors and labels
       pie(slices, main="Sum", col=colors, labels=slices_labels, cex=0.8)
       
       
       # Create a legend at the right   
       legend(.9, .1, c("DH","UT","AM"), cex=0.7, fill=colors)
       
?pie

