 #essa linha abaixo fica o executável (python.exe) do python que está localizado em C:/python27/python 
#!C:/python27/python  
import matplotlib.pyplot as plt

x = ["doce"]
y = ["nenhum","doce"]

x2 = ["salgado"]
y2 = ["salgado"]

# Criando um gráfico
plt.bar(x, y, label='doce', color='r')
plt.bar(x2, y2, label='salgado', color='y')
plt.legend(loc=9)
plt.title("Gráficos sobre biscoitos")
plt.ylabel("Tipos de biscoitos")
plt.show()
