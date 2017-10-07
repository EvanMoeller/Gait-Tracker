from graphing import Graphing
import math
import matplotlib.pyplot as plt


objer = Graphing("walter1.csv")
#objer.plot_cont(objer.arr, objer.allYData, objer.allXData)

legAngles = []
for i in range(len(objer.xKneeLeft)):
    legAngles.append(math.atan((objer.xKneeLeft[i]-objer.xAnkleLeft[i])/(objer.yKneeLeft[i]-objer.yAnkleLeft[i])))
plt.plot(legAngles)
plt.show()
armAngles = []
for i in range(len(objer.xElbowLeft)):
    armAngles.append(math.atan((objer.xElbowLeft[i]-objer.xHandLeft[i])/(objer.yElbowLeft[i]-objer.yHandLeft[i])))
plt.plot(armAngles)
plt.show()
"""
arctan((xKneeLeft-xAnkleLeft)/(yKneeLeft-yAnkleLeft))
"""
