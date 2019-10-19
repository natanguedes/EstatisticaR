df3 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"),2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))


# Stacked bar plots of y = counts by x = cut,
# colored by the variable color
ggplot(df3, aes(x = dose, y = len)) +
  geom_col(aes(color = supp, fill = supp), position = position_stack()) +
  scale_color_manual(values = c("#0073C2FF", "#EFC000FF"))+
  scale_fill_manual(values = c("#0073C2FF", "#EFC000FF"))

# Use position = position_dodge() 
ggplot(df3, aes(x = dose, y = len)) +
  geom_col(aes(color = supp, fill = supp), position = position_dodge(0.8), width = 0.7) +
  scale_color_manual(values = c("#0073C2FF", "#EFC000FF"))+
  scale_fill_manual(values = c("#0073C2FF", "#EFC000FF"))





df <- data.frame(var=c("a", "b", "c"), nums=c(1:3))
plot2 <- ggplot(df, aes(x=var, y=nums)) + geom_bar(stat = "identity")  # Y axis is explicit. 'stat=identity'
print(plot2)





df <- data.frame(
  group = c("Male", "Female","kid"),
  value = c(25, 25, 50)
)
head(df)

bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")
bp

pie <- bp + coord_polar("y", start=0)+ ggtitle("                                            Categorias")
pie


install.packages("GGally")


require("GGally")
# Fit survival functions
surv <- survfit(Surv(time, status) ~ sex, data = lung)
# Plot survival curves
surv.p <- ggsurv(surv)
surv.p


df <- mtcars[, c(1,3,4,5,6,7)]
# Correlation plot
ggcorr(df, palette = "RdBu", label = TRUE)


surv.p + guides(linetype = FALSE) +
  scale_colour_discrete(name   = 'Sex', breaks = c(1,2), 
                        labels = c('Male', 'Female'))