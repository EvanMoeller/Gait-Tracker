import csv, os
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import math

class FrontGraphing:

    def __init__(self, namee):
        self.fileName = namee
        """
        Reads in <namee>.csv and makes it into an array and individual objects
        """
        addr = "../GaitSaving/OutputData/FrontViews/Static/" + self.fileName
        with open(os.path.join(os.getcwd(),addr), 'r') as f:
            read = csv.reader(f, delimiter=',')
            arr1 = list(read)
            self.arr = arr1[0]
        """
        Converts the Array of strings to an array of Floats
        """
        for i in range(len(self.arr)):
            self.arr[i] = float(self.arr[i])

        """
        Separates each variable into individual Objects and Arrays
        """
        self.allXData = []
        self.allYData = []
        self.allZData = []
        self.xSpineBase = self.arr[0]
        self.allXData.append(self.xSpineBase)
        self.ySpineBase = self.arr[1]
        self.allYData.append(self.ySpineBase)
        self.zSpineBase = self.arr[2]
        self.allZData.append(self.zSpineBase)
        self.spineBase = [self.xSpineBase,self.ySpineBase,self.zSpineBase]
        self.xSpineMid = self.arr[3]
        self.allXData.append(self.xSpineMid)
        self.ySpineMid = self.arr[4]
        self.allYData.append(self.ySpineMid)
        self.zSpineMid = self.arr[5]
        self.allZData.append(self.zSpineMid)
        self.spineMid = [self.xSpineMid,self.ySpineMid,self.zSpineMid]
        self.xNeck = self.arr[6]
        self.allXData.append(self.xNeck)
        self.yNeck = self.arr[7]
        self.allYData.append(self.yNeck)
        self.zNeck = self.arr[8]
        self.allZData.append(self.zNeck)
        self.neck = [self.xNeck,self.yNeck,self.zNeck]
        self.xHead = self.arr[9]
        self.allXData.append(self.xHead)
        self.yHead = self.arr[10]
        self.allYData.append(self.yHead)
        self.zHead = self.arr[11]
        self.allZData.append(self.zHead)
        self.head = [self.xHead,self.yHead,self.zHead]
        self.xShoulderLeft = self.arr[12]
        self.allXData.append(self.xShoulderLeft)
        self.yShoulderLeft = self.arr[13]
        self.allYData.append(self.yShoulderLeft)
        self.zShoulderLeft = self.arr[14]
        self.allZData.append(self.zShoulderLeft)
        self.shoulderLeft = [self.xShoulderLeft,self.yShoulderLeft,self.zShoulderLeft]
        self.xElbowLeft = self.arr[15]
        self.allXData.append(self.xElbowLeft)
        self.yElbowLeft = self.arr[16]
        self.allYData.append(self.yElbowLeft)
        self.zElbowLeft = self.arr[17]
        self.allZData.append(self.zElbowLeft)
        self.elbowLeft = [self.xElbowLeft,self.yElbowLeft,self.zElbowLeft]
        self.xWristLeft = self.arr[18]
        self.allXData.append(self.xWristLeft)
        self.yWristLeft = self.arr[19]
        self.allYData.append(self.yWristLeft)
        self.zWristLeft = self.arr[20]
        self.allZData.append(self.zWristLeft)
        self.wristLeft = [self.xWristLeft,self.yWristLeft,self.zWristLeft]
        self.xHandLeft = self.arr[21]
        self.allXData.append(self.xHandLeft)
        self.yHandLeft = self.arr[22]
        self.allYData.append(self.yHandLeft)
        self.zHandLeft = self.arr[23]
        self.allZData.append(self.zHandLeft)
        self.handLeft = [self.xHandLeft,self.yHandLeft,self.zHandLeft]
        self.xShoulderRight = self.arr[24]
        self.allXData.append(self.xShoulderRight)
        self.yShoulderRight = self.arr[25]
        self.allYData.append(self.yShoulderRight)
        self.zShoulderRight = self.arr[26]
        self.allZData.append(self.zShoulderRight)
        self.shoulderRight = [self.xShoulderRight,self.yShoulderRight,self.zShoulderRight]
        self.xElbowRight = self.arr[27]
        self.allXData.append(self.xElbowRight)
        self.yElbowRight = self.arr[28]
        self.allYData.append(self.yElbowRight)
        self.zElbowRight = self.arr[29]
        self.allZData.append(self.zElbowRight)
        self.elbowRight = [self.xElbowRight,self.yElbowRight,self.zElbowRight]
        self.xWristRight = self.arr[30]
        self.allXData.append(self.xWristRight)
        self.yWristRight = self.arr[31]
        self.allYData.append(self.yWristRight)
        self.zWristRight = self.arr[32]
        self.allZData.append(self.zWristRight)
        self.wristRight = [self.xWristRight,self.yWristRight,self.zWristRight]
        self.xHandRight = self.arr[33]
        self.allXData.append(self.xHandRight)
        self.yHandRight = self.arr[34]
        self.allYData.append(self.yHandRight)
        self.zHandRight = self.arr[35]
        self.allZData.append(self.zHandRight)
        self.handRight = [self.xHandRight,self.yHandRight,self.zHandRight]
        self.xHipLeft = self.arr[36]
        self.allXData.append(self.xHipLeft)
        self.yHipLeft = self.arr[37]
        self.allYData.append(self.yHipLeft)
        self.zHipLeft = self.arr[38]
        self.allZData.append(self.zHipLeft)
        self.hipLeft = [self.xHipLeft,self.yHipLeft,self.zHipLeft]
        self.xKneeLeft = self.arr[39]
        self.allXData.append(self.xKneeLeft)
        self.yKneeLeft = self.arr[40]
        self.allYData.append(self.yKneeLeft)
        self.zKneeLeft = self.arr[41]
        self.allZData.append(self.zKneeLeft)
        self.kneeLeft = [self.xKneeLeft,self.yKneeLeft,self.zKneeLeft]
        self.xAnkleLeft = self.arr[42]
        self.allXData.append(self.xAnkleLeft)
        self.yAnkleLeft = self.arr[43]
        self.allYData.append(self.yAnkleLeft)
        self.zAnkleLeft = self.arr[44]
        self.allZData.append(self.zAnkleLeft)
        self.ankleLeft = [self.xAnkleLeft,self.yAnkleLeft,self.zAnkleLeft]
        self.xFootLeft = self.arr[45]
        self.allXData.append(self.xFootLeft)
        self.yFootLeft = self.arr[46]
        self.allYData.append(self.yFootLeft)
        self.zFootLeft = self.arr[47]
        self.allZData.append(self.zFootLeft)
        self.footLeft = [self.xFootLeft,self.yFootLeft,self.zFootLeft]
        self.xHipRight = self.arr[48]
        self.allXData.append(self.xHipRight)
        self.yHipRight = self.arr[49]
        self.allYData.append(self.yHipRight)
        self.zHipRight = self.arr[50]
        self.allZData.append(self.zHipRight)
        self.hipRight = [self.xHipRight,self.yHipRight,self.zHipRight]
        self.xKneeRight = self.arr[51]
        self.allXData.append(self.xKneeRight)
        self.yKneeRight = self.arr[52]
        self.allYData.append(self.yKneeRight)
        self.zKneeRight = self.arr[53]
        self.allZData.append(self.zKneeRight)
        self.kneeRight = [self.xKneeRight,self.yKneeRight,self.zKneeRight]
        self.xAnkleRight = self.arr[54]
        self.allXData.append(self.xAnkleRight)
        self.yAnkleRight = self.arr[55]
        self.allYData.append(self.yAnkleRight)
        self.zAnkleRight = self.arr[56]
        self.allZData.append(self.zAnkleRight)
        self.ankleRight = [self.xAnkleRight,self.yAnkleRight,self.zAnkleRight]
        self.xFootRight = self.arr[57]
        self.allXData.append(self.xFootRight)
        self.yFootRight = self.arr[58]
        self.allYData.append(self.yFootRight)
        self.zFootRight = self.arr[59]
        self.allZData.append(self.zFootRight)
        self.footRight = [self.xFootRight,self.yFootRight,self.zFootRight]
        self.xSpineShoulder = self.arr[60]
        self.allXData.append(self.xSpineShoulder)
        self.ySpineShoulder = self.arr[61]
        self.allYData.append(self.ySpineShoulder)
        self.zSpineShoulder = self.arr[62]
        self.allZData.append(self.zSpineShoulder)
        self.spineShoulder = [self.xSpineShoulder,self.ySpineShoulder,self.zSpineShoulder]
        self.xHandTipLeft = self.arr[63]
        self.allXData.append(self.xHandTipLeft)
        self.yHandTipLeft = self.arr[64]
        self.allYData.append(self.yHandTipLeft)
        self.zHandTipLeft = self.arr[65]
        self.allZData.append(self.zHandTipLeft)
        self.handTipLeft = [self.xHandTipLeft,self.yHandTipLeft,self.zHandTipLeft]
        self.xThumbLeft = self.arr[66]
        self.allXData.append(self.xThumbLeft)
        self.yThumbLeft = self.arr[67]
        self.allYData.append(self.yThumbLeft)
        self.zThumbLeft = self.arr[68]
        self.allZData.append(self.zThumbLeft)
        self.thumbLeft = [self.xThumbLeft,self.yThumbLeft,self.zThumbLeft]
        self.xHandTipRight = self.arr[69]
        self.allXData.append(self.xHandTipRight)
        self.yHandTipRight = self.arr[70]
        self.allYData.append(self.yHandTipRight)
        self.zHandTipRight = self.arr[71]
        self.allZData.append(self.zHandTipRight)
        self.handTipRight = [self.xHandTipRight,self.yHandTipRight,self.zHandTipRight]
        self.xThumbRight = self.arr[72]
        self.allXData.append(self.xThumbRight)
        self.yThumbRight = self.arr[73]
        self.allYData.append(self.yThumbRight)
        self.zThumbRight = self.arr[74]
        self.allZData.append(self.zThumbRight)
        self.thumbRight = [self.xThumbRight,self.yThumbRight,self.zThumbRight]
    """
    Graphs the single frame of Data in 3D
    """
    def graph(self):
        fig = plt.figure()
        ax = fig.add_subplot(111, projection='3d')
        ax.scatter(self.allXData,self.allZData,self.allYData)
        ax.set_xlim(-0.5,0.5)
        ax.set_ylim(1.5,2.5)
        # ax.plot([self.xSpineBase,self.xSpineMid],[self.ySpineBase,self.ySpineMid],[self.zSpineBase,self.zSpineMid])
        # ax.plot([self.xSpineMid,self.xSpineShoulder],[self.ySpineMid,self.ySpineShoulder],[self.zSpineMid,self.zSpineShoulder])
        # ax.plot([self.xSpineShoulder,self.xNeck],[self.ySpineShoulder,self.yNeck],[self.zSpineShoulder,self.zNeck])
        # ax.plot([self.xSpineBase,self.xSpineMid],[self.ySpineBase,self.ySpineMid],[self.zSpineBase,self.zSpineMid])
        # ax.plot([self.xNeck,self.xHead],[self.yNeck,self.yHead],[self.zNeck,self.zHead])
        # ax.plot([self.xSpineShoulder,self.xShoulderLeft],[self.ySpineShoulder,self.yShoulderLeft],[self.zSpineShoulder,self.zShoulderLeft])
        # ax.plot([self.xSpineShoulder,self.xShoulderRight],[self.ySpineShoulder,self.yShoulderRight],[self.zSpineShoulder,self.zShoulderRight])
        # ax.plot([self.xElbowLeft,self.xShoulderLeft],[self.yElbowLeft,self.yShoulderLeft],[self.zElbowLeft,self.zShoulderLeft])
        # ax.plot([self.xElbowLeft,self.xWristLeft],[self.yElbowLeft,self.yWristLeft],[self.zElbowLeft,self.zWristLeft])
        # ax.plot([self.xWristLeft,self.xHandLeft],[self.yWristLeft,self.yHandLeft],[self.zWristLeft,self.zHandLeft])
        # ax.plot([self.xShoulderRight,self.xElbowRight],[self.yShoulderRight,self.yElbowRight],[self.zShoulderRight,self.zElbowRight])
        # ax.plot([self.xElbowRight,self.xWristRight],[self.yElbowRight,self.yWristRight],[self.zElbowRight,self.zWristRight])
        # ax.plot([self.xWristRight,self.xHandRight],[self.yWristRight,self.yHandRight],[self.zWristRight,self.zHandRight])
        # ax.plot([self.xHipLeft,self.xSpineBase],[self.yHipLeft,self.ySpineBase],[self.zHipLeft,self.zSpineBase])
        # ax.plot([self.xHipLeft,self.xKneeLeft],[self.yHipLeft,self.yKneeLeft],[self.zHipLeft,self.zKneeLeft])
        # ax.plot([self.xKneeLeft,self.xAnkleLeft],[self.yKneeLeft,self.yAnkleLeft],[self.zKneeLeft,self.zAnkleLeft])
        # ax.plot([self.xAnkleLeft,self.xFootLeft],[self.yAnkleLeft,self.yFootLeft],[self.zAnkleLeft,self.zFootLeft])
        # ax.plot([self.xSpineBase,self.xHipRight],[self.ySpineBase,self.yHipRight],[self.zSpineBase,self.zHipRight])
        # ax.plot([self.xHipRight,self.xKneeRight],[self.yHipRight,self.yKneeRight],[self.zHipRight,self.zKneeRight])
        # ax.plot([self.xKneeRight,self.xAnkleRight],[self.yKneeRight,self.yAnkleRight],[self.zKneeRight,self.zAnkleRight])
        # ax.plot([self.xAnkleRight,self.xFootRight],[self.yAnkleRight,self.yFootRight],[self.zAnkleRight,self.zFootRight])
        ax.plot([self.xSpineBase,self.xSpineMid],[self.zSpineBase,self.zSpineMid],[self.ySpineBase,self.ySpineMid])
        ax.plot([self.xSpineMid,self.xSpineShoulder],[self.zSpineMid,self.zSpineShoulder],[self.ySpineMid,self.ySpineShoulder])
        ax.plot([self.xSpineShoulder,self.xNeck],[self.zSpineShoulder,self.zNeck],[self.ySpineShoulder,self.yNeck])
        ax.plot([self.xSpineBase,self.xSpineMid],[self.zSpineBase,self.zSpineMid],[self.ySpineBase,self.ySpineMid])
        ax.plot([self.xNeck,self.xHead],[self.zNeck,self.zHead],[self.yNeck,self.yHead])
        ax.plot([self.xSpineShoulder,self.xShoulderLeft],[self.zSpineShoulder,self.zShoulderLeft],[self.ySpineShoulder,self.yShoulderLeft])
        ax.plot([self.xSpineShoulder,self.xShoulderRight],[self.zSpineShoulder,self.zShoulderRight],[self.ySpineShoulder,self.yShoulderRight])
        ax.plot([self.xElbowLeft,self.xShoulderLeft],[self.zElbowLeft,self.zShoulderLeft],[self.yElbowLeft,self.yShoulderLeft])
        ax.plot([self.xElbowLeft,self.xWristLeft],[self.zElbowLeft,self.zWristLeft],[self.yElbowLeft,self.yWristLeft])
        ax.plot([self.xWristLeft,self.xHandLeft],[self.zWristLeft,self.zHandLeft],[self.yWristLeft,self.yHandLeft])
        ax.plot([self.xShoulderRight,self.xElbowRight],[self.zShoulderRight,self.zElbowRight],[self.yShoulderRight,self.yElbowRight])
        ax.plot([self.xElbowRight,self.xWristRight],[self.zElbowRight,self.zWristRight],[self.yElbowRight,self.yWristRight])
        ax.plot([self.xWristRight,self.xHandRight],[self.zWristRight,self.zHandRight],[self.yWristRight,self.yHandRight])
        ax.plot([self.xHipLeft,self.xSpineBase],[self.zHipLeft,self.zSpineBase],[self.yHipLeft,self.ySpineBase])
        ax.plot([self.xHipLeft,self.xKneeLeft],[self.zHipLeft,self.zKneeLeft],[self.yHipLeft,self.yKneeLeft])
        ax.plot([self.xKneeLeft,self.xAnkleLeft],[self.zKneeLeft,self.zAnkleLeft],[self.yKneeLeft,self.yAnkleLeft])
        ax.plot([self.xAnkleLeft,self.xFootLeft],[self.zAnkleLeft,self.zFootLeft],[self.yAnkleLeft,self.yFootLeft])
        ax.plot([self.xSpineBase,self.xHipRight],[self.zSpineBase,self.zHipRight],[self.ySpineBase,self.yHipRight])
        ax.plot([self.xHipRight,self.xKneeRight],[self.zHipRight,self.zKneeRight],[self.yHipRight,self.yKneeRight])
        ax.plot([self.xKneeRight,self.xAnkleRight],[self.zKneeRight,self.zAnkleRight],[self.yKneeRight,self.yAnkleRight])
        ax.plot([self.xAnkleRight,self.xFootRight],[self.zAnkleRight,self.zFootRight],[self.yAnkleRight,self.yFootRight])

        plt.show()

    """
    Returns the length of a joint, given to Joint Point Arrays each containing XYZ
    """
    @staticmethod
    def jointLength(jointOne,jointTwo):
        return math.sqrt((jointTwo[0]-jointOne[0])**2 + (jointTwo[1]-jointOne[1])**2 + (jointTwo[2]-jointOne[2])**2)

objer = FrontGraphing("walter10-11.csv")
objer.graph()
print(objer.jointLength(objer.shoulderLeft,objer.elbowLeft))
#objer.graph()
