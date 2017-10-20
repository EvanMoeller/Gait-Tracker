import csv, os
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import math
import matplotlib.animation as animation
from numpy import mean, sqrt, square

class FrontGraphingDynamic:

    def __init__(self, namee):
        self.fileName = namee
        """
        Reads in <namee>.csv and makes it into an array and individual objects
        """
        addr = "../GaitSaving/OutputData/FrontViews/Dynamic/" + self.fileName
        with open(os.path.join(os.getcwd(),addr), 'r') as f:
            read = csv.reader(f, delimiter=',')
            arr1 = list(read)
            self.arr = np.array(arr1)

        self.rows = len(self.arr)
        self.cols = len(self.arr[0])
        """
        Converts the Array of strings to an array of Floats
        """
        for i in range(len(self.arr)):
            for j in range(len(self.arr[0])):
                self.arr[i,j] = float(self.arr[i,j])
        self.arr = self.arr.astype(np.dtype(float))

        """
        Separates each variable into individual Objects and Arrays
        """
        self.allXData = np.empty([0])
        self.allYData = np.empty([0])
        self.allZData = np.empty([0])
        self.xSpineBase = np.array(self.arr[:,0])
        self.allXData = np.append(self.allXData, self.xSpineBase)
        self.ySpineBase = np.array(self.arr[:,1])
        self.allYData = np.append(self.allYData, self.ySpineBase)
        self.zSpineBase = np.array(self.arr[:,2])
        self.allZData = np.append(self.allZData, self.zSpineBase)
        self.spineBase = [self.xSpineBase,self.ySpineBase,self.zSpineBase]
        self.xSpineMid = np.array(self.arr[:,3])
        self.allXData = np.append(self.allXData, self.xSpineMid)
        self.ySpineMid = np.array(self.arr[:,4])
        self.allYData = np.append(self.allYData, self.ySpineMid)
        self.zSpineMid = np.array(self.arr[:,5])
        self.allZData = np.append(self.allZData, self.zSpineMid)
        self.spineMid = [self.xSpineMid,self.ySpineMid,self.zSpineMid]
        self.xNeck = np.array(self.arr[:,6])
        self.allXData = np.append(self.allXData, self.xNeck)
        self.yNeck = np.array(self.arr[:,7])
        self.allYData = np.append(self.allYData, self.yNeck)
        self.zNeck = np.array(self.arr[:,8])
        self.allZData = np.append(self.allZData, self.zNeck)
        self.neck = [self.xNeck,self.yNeck,self.zNeck]
        self.xHead = np.array(self.arr[:,9])
        self.allXData = np.append(self.allXData, self.xHead)
        self.yHead = np.array(self.arr[:,10])
        self.allYData = np.append(self.allYData, self.yHead)
        self.zHead = np.array(self.arr[:,11])
        self.allZData = np.append(self.allZData, self.zHead)
        self.head = [self.xHead,self.yHead,self.zHead]
        self.xShoulderLeft = np.array(self.arr[:,12])
        self.allXData = np.append(self.allXData, self.xShoulderLeft)
        self.yShoulderLeft = np.array(self.arr[:,13])
        self.allYData = np.append(self.allYData, self.yShoulderLeft)
        self.zShoulderLeft = np.array(self.arr[:,14])
        self.allZData = np.append(self.allZData, self.zShoulderLeft)
        self.shoulderLeft = [self.xShoulderLeft,self.yShoulderLeft,self.zShoulderLeft]
        self.xElbowLeft = np.array(self.arr[:,15])
        self.allXData = np.append(self.allXData, self.xElbowLeft)
        self.yElbowLeft = np.array(self.arr[:,16])
        self.allYData = np.append(self.allYData, self.yElbowLeft)
        self.zElbowLeft = np.array(self.arr[:,17])
        self.allZData = np.append(self.allZData, self.zElbowLeft)
        self.elbowLeft = [self.xElbowLeft,self.yElbowLeft,self.zElbowLeft]
        self.xWristLeft = np.array(self.arr[:,18])
        self.allXData = np.append(self.allXData, self.xWristLeft)
        self.yWristLeft = np.array(self.arr[:,19])
        self.allYData = np.append(self.allYData, self.yWristLeft)
        self.zWristLeft = np.array(self.arr[:,20])
        self.allZData = np.append(self.allZData, self.zWristLeft)
        self.wristLeft = [self.xWristLeft,self.yWristLeft,self.zWristLeft]
        self.xHandLeft = np.array(self.arr[:,21])
        self.allXData = np.append(self.allXData, self.xHandLeft)
        self.yHandLeft = np.array(self.arr[:,22])
        self.allYData = np.append(self.allYData, self.yHandLeft)
        self.zHandLeft = np.array(self.arr[:,23])
        self.allZData = np.append(self.allZData, self.zHandLeft)
        self.handLeft = [self.xHandLeft,self.yHandLeft,self.zHandLeft]
        self.xShoulderRight = np.array(self.arr[:,24])
        self.allXData = np.append(self.allXData, self.xShoulderRight)
        self.yShoulderRight = np.array(self.arr[:,25])
        self.allYData = np.append(self.allYData, self.yShoulderRight)
        self.zShoulderRight = np.array(self.arr[:,26])
        self.allZData = np.append(self.allZData, self.zShoulderRight)
        self.shoulderRight = [self.xShoulderRight,self.yShoulderRight,self.zShoulderRight]
        self.xElbowRight = np.array(self.arr[:,27])
        self.allXData = np.append(self.allXData, self.xElbowRight)
        self.yElbowRight = np.array(self.arr[:,28])
        self.allYData = np.append(self.allYData, self.yElbowRight)
        self.zElbowRight = np.array(self.arr[:,29])
        self.allZData = np.append(self.allZData, self.zElbowRight)
        self.elbowRight = [self.xElbowRight,self.yElbowRight,self.zElbowRight]
        self.xWristRight = np.array(self.arr[:,30])
        self.allXData = np.append(self.allXData, self.xWristRight)
        self.yWristRight = np.array(self.arr[:,31])
        self.allYData = np.append(self.allYData, self.yWristRight)
        self.zWristRight = np.array(self.arr[:,32])
        self.allZData = np.append(self.allZData, self.zWristRight)
        self.wristRight = [self.xWristRight,self.yWristRight,self.zWristRight]
        self.xHandRight = np.array(self.arr[:,33])
        self.allXData = np.append(self.allXData, self.xHandRight)
        self.yHandRight = np.array(self.arr[:,34])
        self.allYData = np.append(self.allYData, self.yHandRight)
        self.zHandRight = np.array(self.arr[:,35])
        self.allZData = np.append(self.allZData, self.zHandRight)
        self.handRight = [self.xHandRight,self.yHandRight,self.zHandRight]
        self.xHipLeft = np.array(self.arr[:,36])
        self.allXData = np.append(self.allXData, self.xHipLeft)
        self.yHipLeft = np.array(self.arr[:,37])
        self.allYData = np.append(self.allYData, self.yHipLeft)
        self.zHipLeft = np.array(self.arr[:,38])
        self.allZData = np.append(self.allZData, self.zHipLeft)
        self.hipLeft = [self.xHipLeft,self.yHipLeft,self.zHipLeft]
        self.xKneeLeft = np.array(self.arr[:,39])
        self.allXData = np.append(self.allXData, self.xKneeLeft)
        self.yKneeLeft = np.array(self.arr[:,40])
        self.allYData = np.append(self.allYData, self.yKneeLeft)
        self.zKneeLeft = np.array(self.arr[:,41])
        self.allZData = np.append(self.allZData, self.zKneeLeft)
        self.kneeLeft = [self.xKneeLeft,self.yKneeLeft,self.zKneeLeft]
        self.xAnkleLeft = np.array(self.arr[:,42])
        self.allXData = np.append(self.allXData, self.xAnkleLeft)
        self.yAnkleLeft = np.array(self.arr[:,43])
        self.allYData = np.append(self.allYData, self.yAnkleLeft)
        self.zAnkleLeft = np.array(self.arr[:,44])
        self.allZData = np.append(self.allZData, self.zAnkleLeft)
        self.ankleLeft = [self.xAnkleLeft,self.yAnkleLeft,self.zAnkleLeft]
        self.xFootLeft = np.array(self.arr[:,45])
        self.allXData = np.append(self.allXData, self.xFootLeft)
        self.yFootLeft = np.array(self.arr[:,46])
        self.allYData = np.append(self.allYData, self.yFootLeft)
        self.zFootLeft = np.array(self.arr[:,47])
        self.allZData = np.append(self.allZData, self.zFootLeft)
        self.footLeft = [self.xFootLeft,self.yFootLeft,self.zFootLeft]
        self.xHipRight = np.array(self.arr[:,48])
        self.allXData = np.append(self.allXData, self.xHipRight)
        self.yHipRight = np.array(self.arr[:,49])
        self.allYData = np.append(self.allYData, self.yHipRight)
        self.zHipRight = np.array(self.arr[:,50])
        self.allZData = np.append(self.allZData, self.zHipRight)
        self.hipRight = [self.xHipRight,self.yHipRight,self.zHipRight]
        self.xKneeRight = np.array(self.arr[:,51])
        self.allXData = np.append(self.allXData, self.xKneeRight)
        self.yKneeRight = np.array(self.arr[:,52])
        self.allYData = np.append(self.allYData, self.yKneeRight)
        self.zKneeRight = np.array(self.arr[:,53])
        self.allZData = np.append(self.allZData, self.zKneeRight)
        self.kneeRight = [self.xKneeRight,self.yKneeRight,self.zKneeRight]
        self.xAnkleRight = np.array(self.arr[:,54])
        self.allXData = np.append(self.allXData, self.xAnkleRight)
        self.yAnkleRight = np.array(self.arr[:,55])
        self.allYData = np.append(self.allYData, self.yAnkleRight)
        self.zAnkleRight = np.array(self.arr[:,56])
        self.allZData = np.append(self.allZData, self.zAnkleRight)
        self.ankleRight = [self.xAnkleRight,self.yAnkleRight,self.zAnkleRight]
        self.xFootRight = np.array(self.arr[:,57])
        self.allXData = np.append(self.allXData, self.xFootRight)
        self.yFootRight = np.array(self.arr[:,58])
        self.allYData = np.append(self.allYData, self.yFootRight)
        self.zFootRight = np.array(self.arr[:,59])
        self.allZData = np.append(self.allZData, self.zFootRight)
        self.footRight = [self.xFootRight,self.yFootRight,self.zFootRight]
        self.xSpineShoulder = np.array(self.arr[:,60])
        self.allXData = np.append(self.allXData, self.xSpineShoulder)
        self.ySpineShoulder = np.array(self.arr[:,61])
        self.allYData = np.append(self.allYData, self.ySpineShoulder)
        self.zSpineShoulder = np.array(self.arr[:,62])
        self.allZData = np.append(self.allZData, self.zSpineShoulder)
        self.spineShoulder = [self.xSpineShoulder,self.ySpineShoulder,self.zSpineShoulder]
        self.xHandTipLeft = np.array(self.arr[:,63])
        self.allXData = np.append(self.allXData, self.xHandTipLeft)
        self.yHandTipLeft = np.array(self.arr[:,64])
        self.allYData = np.append(self.allYData, self.yHandTipLeft)
        self.zHandTipLeft = np.array(self.arr[:,65])
        self.allZData = np.append(self.allZData, self.zHandTipLeft)
        self.handTipLeft = [self.xHandTipLeft,self.yHandTipLeft,self.zHandTipLeft]
        self.xThumbLeft = np.array(self.arr[:,66])
        self.allXData = np.append(self.allXData, self.xThumbLeft)
        self.yThumbLeft = np.array(self.arr[:,67])
        self.allYData = np.append(self.allYData, self.yThumbLeft)
        self.zThumbLeft = np.array(self.arr[:,68])
        self.allZData = np.append(self.allZData, self.zThumbLeft)
        self.thumbLeft = [self.xThumbLeft,self.yThumbLeft,self.zThumbLeft]
        self.xHandTipRight = np.array(self.arr[:,69])
        self.allXData = np.append(self.allXData, self.xHandTipRight)
        self.yHandTipRight = np.array(self.arr[:,70])
        self.allYData = np.append(self.allYData, self.yHandTipRight)
        self.zHandTipRight = np.array(self.arr[:,71])
        self.allZData = np.append(self.allZData, self.zHandTipRight)
        self.handTipRight = [self.xHandTipRight,self.yHandTipRight,self.zHandTipRight]
        self.xThumbRight = np.array(self.arr[:,72])
        self.allXData = np.append(self.allXData, self.xThumbRight)
        self.yThumbRight = np.array(self.arr[:,73])
        self.allYData = np.append(self.allYData, self.yThumbRight)
        self.zThumbRight = np.array(self.arr[:,74])
        self.allZData = np.append(self.allZData, self.zThumbRight)
        self.thumbRight = [self.xThumbRight,self.yThumbRight,self.zThumbRight]
        #return self

    """
    Graphs the 3D data over time
    """


    def plot_cont(self):
        xmax = len(self.arr)
        fig = plt.figure()
        ax = fig.add_subplot(111, projection='3d')
        ax.set_xlim(-0.5,0.5)
        ax.set_ylim(1.5,2.5)


        def update(i):
            ax.clear()
            ax.plot([self.xSpineBase[i],self.xSpineMid[i]],[self.zSpineBase[i],self.zSpineMid[i]],[self.ySpineBase[i],self.ySpineMid[i]])
            ax.plot([self.xSpineMid[i],self.xSpineShoulder[i]],[self.zSpineMid[i],self.zSpineShoulder[i]],[self.ySpineMid[i],self.ySpineShoulder[i]])
            ax.plot([self.xSpineShoulder[i],self.xNeck[i]],[self.zSpineShoulder[i],self.zNeck[i]],[self.ySpineShoulder[i],self.yNeck[i]])
            ax.plot([self.xSpineBase[i],self.xSpineMid[i]],[self.zSpineBase[i],self.zSpineMid[i]],[self.ySpineBase[i],self.ySpineMid[i]])
            ax.plot([self.xNeck[i],self.xHead[i]],[self.zNeck[i],self.zHead[i]],[self.yNeck[i],self.yHead[i]])
            ax.plot([self.xSpineShoulder[i],self.xShoulderLeft[i]],[self.zSpineShoulder[i],self.zShoulderLeft[i]],[self.ySpineShoulder[i],self.yShoulderLeft[i]])
            ax.plot([self.xSpineShoulder[i],self.xShoulderRight[i]],[self.zSpineShoulder[i],self.zShoulderRight[i]],[self.ySpineShoulder[i],self.yShoulderRight[i]])
            ax.plot([self.xElbowLeft[i],self.xShoulderLeft[i]],[self.zElbowLeft[i],self.zShoulderLeft[i]],[self.yElbowLeft[i],self.yShoulderLeft[i]])
            ax.plot([self.xElbowLeft[i],self.xWristLeft[i]],[self.zElbowLeft[i],self.zWristLeft[i]],[self.yElbowLeft[i],self.yWristLeft[i]])
            ax.plot([self.xWristLeft[i],self.xHandLeft[i]],[self.zWristLeft[i],self.zHandLeft[i]],[self.yWristLeft[i],self.yHandLeft[i]])
            ax.plot([self.xShoulderRight[i],self.xElbowRight[i]],[self.zShoulderRight[i],self.zElbowRight[i]],[self.yShoulderRight[i],self.yElbowRight[i]])
            ax.plot([self.xElbowRight[i],self.xWristRight[i]],[self.zElbowRight[i],self.zWristRight[i]],[self.yElbowRight[i],self.yWristRight[i]])
            ax.plot([self.xWristRight[i],self.xHandRight[i]],[self.zWristRight[i],self.zHandRight[i]],[self.yWristRight[i],self.yHandRight[i]])
            ax.plot([self.xHipLeft[i],self.xSpineBase[i]],[self.zHipLeft[i],self.zSpineBase[i]],[self.yHipLeft[i],self.ySpineBase[i]])
            ax.plot([self.xHipLeft[i],self.xKneeLeft[i]],[self.zHipLeft[i],self.zKneeLeft[i]],[self.yHipLeft[i],self.yKneeLeft[i]])
            ax.plot([self.xKneeLeft[i],self.xAnkleLeft[i]],[self.zKneeLeft[i],self.zAnkleLeft[i]],[self.yKneeLeft[i],self.yAnkleLeft[i]])
            ax.plot([self.xAnkleLeft[i],self.xFootLeft[i]],[self.zAnkleLeft[i],self.zFootLeft[i]],[self.yAnkleLeft[i],self.yFootLeft[i]])
            ax.plot([self.xSpineBase[i],self.xHipRight[i]],[self.zSpineBase[i],self.zHipRight[i]],[self.ySpineBase[i],self.yHipRight[i]])
            ax.plot([self.xHipRight[i],self.xKneeRight[i]],[self.zHipRight[i],self.zKneeRight[i]],[self.yHipRight[i],self.yKneeRight[i]])
            ax.plot([self.xKneeRight[i],self.xAnkleRight[i]],[self.zKneeRight[i],self.zAnkleRight[i]],[self.yKneeRight[i],self.yAnkleRight[i]])
            ax.plot([self.xAnkleRight[i],self.xFootRight[i]],[self.zAnkleRight[i],self.zFootRight[i]],[self.yAnkleRight[i],self.yFootRight[i]])
            #self.something(self.arr[i])


        a = animation.FuncAnimation(fig, update, frames=xmax, repeat=True, interval=33)
        plt.show()

    """
    Returns the length of a joint, given to Joint Point Arrays each containing XYZ
    """
    @staticmethod
    def jointLength(jointOne,jointTwo):
        retArray = np.empty([0])
        for i in range(len(jointOne[0])):
            retArray = np.append(retArray, math.sqrt((jointTwo[0][i]-jointOne[0][i])**2 + (jointTwo[1][i]-jointOne[1][i])**2 + (jointTwo[2][i]-jointOne[2][i])**2))

        return retArray

    """
    Graphs simple data given an Array, and should work with either an array of angles over time or an array of joint length over time.
    Also graphs an ?rms? line (more in depth average?)
    """
    def simpleGrapher(self, xArray):
        plt.plot(xArray)
        plt.axhline(y=self.rms(xArray), color='r', linestyle='--')
        plt.show()

    """
    Attempt at an 'rms' method. After some googling, something suggested this should work. Not definite yet though
    """
    @staticmethod
    def rms(angleOrLengthArray):
        return sqrt(mean(square(angleOrLengthArray)))


objer = FrontGraphingDynamic("MaxTesting10-20.csv")
#objer.plot_cont()
objer.simpleGrapher(objer.jointLength(objer.shoulderLeft,objer.elbowLeft))
# print(objer.jointLength(objer.shoulderLeft,objer.elbowLeft))
# print("-------")
# print(objer.rms(objer.jointLength(objer.shoulderLeft,objer.elbowLeft)))
