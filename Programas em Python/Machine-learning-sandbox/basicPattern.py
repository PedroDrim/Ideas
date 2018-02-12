# Importando biblioteca para aprendizado de maquina
from sklearn import tree

# Definindo redeNeural (apenas numeros como entrada)
class NeuralNet:
    
    __clf = None
    
    def __init__(self):
        self.__clf = tree.DecisionTreeClassifier()

    def learn(self,dataInput,dataOutput):
        self.__clf = self.__clf.fit(dataInput, dataOutput)
        print("Dado assimilado!")

    def predict(self,data):
        prediction = self.__clf.predict(data)
        return prediction

# ===================================================== #
# Iniciando rede neural
skynet = NeuralNet()

# Gerando dados e assimilando (conjunto 1)
dataInput = [
    [181, 80, 44], [177, 70, 43], [160, 60, 38], [154, 54, 37], [166, 65, 40],
    [190, 90, 47], [175, 64, 39],
    [177, 70, 40], [159, 55, 37], [171, 75, 42], [181, 85, 43]
    ]

dataOutput = ['male', 'male', 'female', 'female', 'male', 'male', 'female', 'female',
     'female', 'male', 'male']

skynet.learn(dataInput,dataOutput)

value = skynet.predict([[177, 70, 40]])
print(value)

# ===================================================== #
# Iniciando rede neural
skynet = NeuralNet()

# Gerando dados e assimilando (conjunto 2)
dataInput = [
    [181, 80], [70, 43], [60, 38], [37, 154], [65, 40],
    [90, 90], [39, 64], [70, 70], [55, 35], [75, 171], [181, 181]
    ]

dataOutput = ['maior', 'maior', 'maior', 'menor', 'maior', 'igual', 'menor', 'igual', 'maior',
     'menor', 'igual']

skynet.learn(dataInput,dataOutput)

value = skynet.predict([[71, 71]])
print (value)

# ===================================================== #