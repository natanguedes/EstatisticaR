 #essa linha abraixo fica o executável (python.exe) do python que está localizado em 
#!C:/Users/Natanael/AppData/Local/Programs/Python/Python337-32/python
import matplotlib.pyplot as plt

x = ["doce"]
y = ["nenhum","doce"]

x2 = ["salgado"]
y2 = ["salgado"]

# Criando um gráfico
plt.bar(x, y, label='doce', olor='r')
plt.bar(x2, y2, label='salgadco', color='y')
plt.legend(loc=9)
plt.title("Gráficos sobre biscoitos")
plt.ylabel("Tipos de biscoitos")
plt.show()
