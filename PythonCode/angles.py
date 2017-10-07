from graphing import Graphing
import math
import matplotlib.pyplot as plt


objer = Graphing("walter1.csv")
#objer.plot_cont(objer.arr, objer.allYData, objer.allXData)

legAngles = []
for i in range(len(objer.xKneeLeft)):
    legAngles.append(math.atan((objer.xKneeLeft[i]-objer.xAnkleLeft[i])/(objer.yKneeLeft[i]-objer.yAnkleLeft[i])))
print(legAngles)
plt.plot(legAngles)
plt.show()
"""
arctan((xKneeLeft-xAnkleLeft)/(yKneeLeft-yAnkleLeft))
"""
