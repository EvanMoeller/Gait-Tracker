import csv, os
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np

class SideGraphing:

    def __init__(self,namee):
        self.fileName = namee
        """
        Reads in <namee>.csv and makes it into an array
        """
        addr = "../GaitSaving/OutputData/SideViews/" + self.fileName
        with open(os.path.join(os.getcwd(),addr), 'r') as f:
            read = csv.reader(f, delimiter=',')
            self.arr = list(read)

        """
        Converts the Array of strings to an array of Floats
        """
        for i in range(len(self.arr)):
            for j in range(len(self.arr[i])):
                self.arr[i][j] = float(self.arr[i][j])

        """
        Separates each variable into individual Arrays
        """
        self.xNeck = []
        self.yNeck = []
        self.xHead = []
        self.yHead = []
        self.xShoulderLeft = []
        self.yShoulderLeft = []
        self.xElbowLeft = []
        self.yElbowLeft = []
        self.xWristLeft = []
        self.yWristLeft = []
        self.xHandLeft = []
        self.yHandLeft = []
        self.xHipLeft = []
        self.yHipLeft = []
        self.xKneeLeft = []
        self.yKneeLeft = []
        self.xAnkleLeft = []
        self.yAnkleLeft = []
        self.xFootLeft = []
        self.yFootLeft = []
        self.xHandTipLeft = []
        self.yHandTipLeft = []
        self.frameTime = []
        for i in range(len(self.arr)):
            self.xNeck.append(self.arr[i][0])
            self.yNeck.append(self.arr[i][1])
            self.xHead.append(self.arr[i][2])
            self.yHead.append(self.arr[i][3])
            self.xShoulderLeft.append(self.arr[i][4])
            self.yShoulderLeft.append(self.arr[i][5])
            self.xElbowLeft.append(self.arr[i][6])
            self.yElbowLeft.append(self.arr[i][7])
            self.xWristLeft.append(self.arr[i][8])
            self.yWristLeft.append(self.arr[i][9])
            self.xHandLeft.append(self.arr[i][10])
            self.yHandLeft.append(self.arr[i][11])
            self.xHipLeft.append(self.arr[i][12])
            self.yHipLeft.append(self.arr[i][13])
            self.xKneeLeft.append(self.arr[i][14])
            self.yKneeLeft.append(self.arr[i][15])
            self.xAnkleLeft.append(self.arr[i][16])
            self.yAnkleLeft.append(self.arr[i][17])
            self.xFootLeft.append(self.arr[i][18])
            self.yFootLeft.append(self.arr[i][19])
            self.xHandTipLeft.append(self.arr[i][20])
            self.yHandTipLeft.append(self.arr[i][21])
            self.frameTime.append(self.arr[i][22])

        """
        Creates Arrays for all X Data and all Y Data
        """
        self.allXData = [[0 for i in range(11)] for j in range(len(self.arr))]
        self.allYData = [[0 for i in range(11)] for j in range(len(self.arr))]
        for i in range(len(self.arr)):
            self.allXData[i][0] = self.xNeck[i]
            self.allXData[i][1] = self.xHead[i]
            self.allXData[i][2] = self.xShoulderLeft[i]
            self.allXData[i][3] = self.xElbowLeft[i]
            self.allXData[i][4] = self.xWristLeft[i]
            self.allXData[i][5] = self.xHandLeft[i]
            self.allXData[i][6] = self.xHipLeft[i]
            self.allXData[i][7] = self.xKneeLeft[i]
            self.allXData[i][8] = self.xAnkleLeft[i]
            self.allXData[i][9] = self.xFootLeft[i]
            self.allXData[i][10] = self.xHandTipLeft[i]
            self.allYData[i][0] = self.yNeck[i]
            self.allYData[i][1] = self.yHead[i]
            self.allYData[i][2] = self.yShoulderLeft[i]
            self.allYData[i][3] = self.yElbowLeft[i]
            self.allYData[i][4] = self.yWristLeft[i]
            self.allYData[i][5] = self.yHandLeft[i]
            self.allYData[i][6] = self.yHipLeft[i]
            self.allYData[i][7] = self.yKneeLeft[i]
            self.allYData[i][8] = self.yAnkleLeft[i]
            self.allYData[i][9] = self.yFootLeft[i]
            self.allYData[i][10] = self.yHandTipLeft[i]

    """
    Need Python, numpy, matplotlib installed on computer to run. Online instructions help with installation of these libraries
    """

    """
    0: X Neck
    1: Y Neck
    2: X Head
    3: Y Head
    4: X ShoulderLeft
    5: Y ShoulderLeft
    6: X ElbowLeft
    7: Y ElbowLeft
    8: X WristLeft
    9: Y WristLeft
    10: X HandLeft
    11: Y HandLeft
    12: X HipLeft
    13: Y HipLeft
    14: X KneeLeft
    15: Y KneeLeft
    16: X AnkleLeft
    17: Y AnkleLeft
    18: X FootLeft
    19: Y FootLeft
    20: X HandTipLeft
    21: Y HandTipLeft
    22: Time
    """

    """
    Graphing Animation for XY Data. The plot Axes need to be cleaned a bit
    """
    @staticmethod
    def plot_cont(arr, allYData, allXData, name):
        if (".csv" in name):
            name = name.replace(".csv", '')
        xmax = len(arr)
        y = []
        fig = plt.figure()
        ax = fig.add_subplot(1,1,1)
        ax.set_xlabel('Displacement')
        ax.set_ylabel('Height')
        ax.set_title(name)


        def update(i):
            y = allYData[i]
            x = allXData[i]
            ax.clear()
            ax.set_xlabel('Displacement')
            ax.set_ylabel('Height')
            ax.set_title(name)
            ax.set_xlim(-2,2)
            ax.set_ylim(-1.0,1.5)
            ax.autoscale(False)
            ax.set_autoscale_on(False)
            ax.autoscale_view(False)
            ax.use_sticky_edges = False
            x1, y1 = [x[0],x[1]],[y[0],y[1]]
            x2, y2 = [x[2],x[3]],[y[2],y[3]]
            x3, y3 = [x[3],x[4]],[y[3],y[4]]
            x4, y4 = [x[4],x[5]],[y[4],y[5]]
            x5, y5 = [x[5],x[10]],[y[5],y[10]]
            x6, y6 = [x[6],x[7]],[y[6],y[7]]
            x7, y7 = [x[7],x[8]],[y[7],y[8]]
            x8, y8 = [x[8],x[9]],[y[8],y[9]]
            plt.plot(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, marker= 'o')
            ax.scatter(x, y)

        a = animation.FuncAnimation(fig, update, frames=xmax, repeat=True, interval=33)
        plt.show()

#objer = SideGraphing("walter1.csv")
#objer.plot_cont()
