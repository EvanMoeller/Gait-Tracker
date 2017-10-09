from graphing import Graphing
import math
import matplotlib.pyplot as plt

"""
Generates Angle data between Knee and Ankle and returns
"""
def generateLegAngles(xKneeLeft,yKneeLeft,xAnkleLeft,yAnkleLeft):
    legAngles = []
    for i in range(len(xKneeLeft)):
        legAngles.append(math.degrees(math.atan((xKneeLeft[i]-xAnkleLeft[i])/(yKneeLeft[i]-yAnkleLeft[i]))))
    return legAngles

"""
Generates Angle data between Elbow and Hand and returns
"""
def generateArmAngles(xElbowLeft,yElbowLeft,xHandLeft,yHandLeft):
    armAngles = []
    for i in range(len(xElbowLeft)):
        armAngles.append(math.degrees(math.atan((xElbowLeft[i]-xHandLeft[i])/(yElbowLeft[i]-yHandLeft[i]))))
    return armAngles

"""
Generates Angle data between Hip and Knee and returns
"""
def generateHipAngles(xHipLeft,yHipLeft,xKneeLeft,yKneeLeft):
    hipAngles = []
    for i in range(len(xHipLeft)):
        hipAngles.append(math.degrees(math.atan((xHipLeft[i]-xKneeLeft[i])/(yHipLeft[i]-yKneeLeft[i]))))
    return hipAngles

"""
Generates Angle data between Shoulder and Elbow and returns
"""
def generateShoulderAngles(xShoulderLeft,yShoulderLeft,xElbowLeft,yElbowLeft):
    shoulderAngles = []
    for i in range(len(xShoulderLeft)):
        shoulderAngles.append(math.degrees(math.atan((xShoulderLeft[i]-xElbowLeft[i])/(yShoulderLeft[i]-yElbowLeft[i]))))
    return shoulderAngles

"""
Generates Angle Data for all Relevent Joints and returns
"""
def generateAngles(objer):
    legAngles = generateLegAngles(objer.xKneeLeft,objer.yKneeLeft,objer.xAnkleLeft,objer.yAnkleLeft)
    armAngles = generateArmAngles(objer.xElbowLeft,objer.yElbowLeft,objer.xHandLeft,objer.yHandLeft)
    hipAngles = generateHipAngles(objer.xHipLeft,objer.yHipLeft,objer.xKneeLeft,objer.yKneeLeft)
    shoulderAngles = generateShoulderAngles(objer.xShoulderLeft,objer.yShoulderLeft,objer.xElbowLeft,objer.yElbowLeft)
    return legAngles,armAngles,hipAngles,shoulderAngles

"""
Given the name of a file, Generates the angles for that specific file
"""
def getAnglesForFile(name):
    objer = Graphing(name)
    return generateAngles(objer)

"""
Given the name of a file, Graphs the angles for that specific file
"""
def graphObjectAngles(name):
    legAngles,armAngles,hipAngles,shoulderAngles = getAnglesForFile(name)
    graphAngles(legAngles,armAngles,hipAngles,shoulderAngles)

"""
Given the name of a file, Graphs all of the data from that file (animation method)
"""
def graphAllData(name):
    objer = Graphing(name)
    objer.plot_cont(objer.arr, objer.allYData, objer.allXData)

"""
Given arrays of various angles, Graphs the 4 different arrays in four different graphs with labelled Axes
"""
def graphAngles(legAngles,armAngles,hipAngles,shoulderAngles):
    plt.figure(1)

    plt.subplot(331)
    plt.plot(legAngles)
    plt.ylabel("Angle between Knee and Ankle")
    plt.xlabel("Frames")

    plt.subplot(337)
    plt.plot(armAngles)
    plt.ylabel("Angle between Elbow and Hand")
    plt.xlabel("Frames")

    plt.subplot(333)
    plt.plot(hipAngles)
    plt.ylabel("Angle between Hip and Knee")
    plt.xlabel("Frames")

    plt.subplot(339)
    plt.plot(shoulderAngles)
    plt.ylabel("Angle between Shoulder and Elbow")
    plt.xlabel("Frames")
    plt.show()

"""
arctan((xKneeLeft-xAnkleLeft)/(yKneeLeft-yAnkleLeft))
"""


graphObjectAngles("walter1.csv")
graphAllData("walter1.csv")
