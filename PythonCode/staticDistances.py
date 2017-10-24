import math
import matplotlib.pyplot as plt
import angles
import numpy as np
from numpy import mean, sqrt, square

#from graphing import Graphing

#angles.graphObjectAngles("walter1.csv")
#angles.graphAllData("walter1.csv")

"""
Distance Formula
"""
def calculateDistance(x1,y1,x2,y2):
    return math.sqrt(((x1-x2)**2)+((y1-y2)**2))

"""
Return Array with Calculated Distance for 2 Given Joints
"""
def calculateDistanceForJoints(x1,y1,x2,y2):
    retArr = []
    for i in range(len(x1)):
        retArr.append(calculateDistance(x1[i],y1[i],x2[i],y2[i]))
    return retArr

"""
For a given File Name, Generates arrays of the 'static' distances between different joints
"""
def generateDistancesForFile(name):
    objer = angles.getObjectOfForFile(name)
    hipKnee = calculateDistanceForJoints(objer.xHipLeft,objer.yHipLeft,objer.xKneeLeft,objer.yKneeLeft)
    kneeAnkle = calculateDistanceForJoints(objer.xKneeLeft,objer.yKneeLeft,objer.xAnkleLeft,objer.yAnkleLeft)
    shoulderElbow = calculateDistanceForJoints(objer.xShoulderLeft,objer.yShoulderLeft,objer.xElbowLeft,objer.yElbowLeft)
    elbowHand = calculateDistanceForJoints(objer.xElbowLeft,objer.yElbowLeft,objer.xHandLeft,objer.yHandLeft)
    neckHead = calculateDistanceForJoints(objer.xNeck,objer.yNeck,objer.xHead,objer.yHead)
    return hipKnee,kneeAnkle,shoulderElbow,elbowHand,neckHead

def rms(angleOrLengthArray):
    return sqrt(mean(square(angleOrLengthArray)))

"""
Graphs Distance Data
"""
def graphDistanceData(hipKnee,kneeAnkle,shoulderElbow,elbowHand,neckHead):
    plt.figure(1)

    plt.subplot(331)
    plt.plot(hipKnee)
    plt.axhline(y=rms(hipKnee), color='r', linestyle='--')
    plt.ylabel("Distance between Hip and Knee")
    plt.xlabel("Frames")

    plt.subplot(333)
    plt.plot(kneeAnkle)
    plt.axhline(y=rms(kneeAnkle), color='r', linestyle='--')
    plt.ylabel("Distance between Knee and Ankle")
    plt.xlabel("Frames")

    plt.subplot(335)
    plt.plot(shoulderElbow)
    plt.axhline(y=rms(shoulderElbow), color='r', linestyle='--')
    plt.ylabel("Distance between Shoulder and Elbow")
    plt.xlabel("Frames")

    plt.subplot(337)
    plt.plot(elbowHand)
    plt.axhline(y=rms(elbowHand), color='r', linestyle='--')
    plt.ylabel("Distance between Elbow and Hand")
    plt.xlabel("Frames")

    plt.subplot(337)
    plt.plot(neckHead)
    plt.axhline(y=rms(neckHead), color='r', linestyle='--')
    plt.ylabel("Distance between Neck and Head")
    plt.xlabel("Frames")

    plt.show()

"""
Graphs Distance Data for Given File Name
"""
def graphDistanceDataForFile(name):
    hipKnee,kneeAnkle,shoulderElbow,elbowHand,neckHead = generateDistancesForFile(name)
    plt.figure(1)

    plt.subplot(331)
    plt.plot(hipKnee)
    plt.axhline(y=rms(hipKnee), color='r', linestyle='--')
    plt.ylabel("Distance between Hip and Knee")
    plt.xlabel("Frames")

    plt.subplot(333)
    plt.plot(kneeAnkle)
    plt.axhline(y=rms(kneeAnkle), color='r', linestyle='--')
    plt.ylabel("Distance between Knee and Ankle")
    plt.xlabel("Frames")

    plt.subplot(335)
    plt.plot(shoulderElbow)
    plt.axhline(y=rms(shoulderElbow), color='r', linestyle='--')
    plt.ylabel("Distance between Shoulder and Elbow")
    plt.xlabel("Frames")

    plt.subplot(337)
    plt.plot(elbowHand)
    plt.axhline(y=rms(elbowHand), color='r', linestyle='--')
    plt.ylabel("Distance between Elbow and Hand")
    plt.xlabel("Frames")

    plt.subplot(339)
    plt.plot(neckHead)
    plt.axhline(y=rms(neckHead), color='r', linestyle='--')
    plt.ylabel("Distance between Neck and Head")
    plt.xlabel("Frames")

    plt.show()

graphDistanceDataForFile("walter1.csv")
