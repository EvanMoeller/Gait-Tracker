import csv, os, time
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
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
Reads in test.csv and makes it into an array
"""
with open(os.path.join(os.getcwd(),'../GaitSaving/OutputData/test.csv'), 'r') as f:
    read = csv.reader(f, delimiter=',')
    arr = list(read)

"""
Converts the Array of strings to an array of Floats
"""
for i in range(len(arr)):
    for j in range(len(arr[i])):
        arr[i][j] = float(arr[i][j])

"""
Separates each variable into individual Arrays
"""
xNeck = []
yNeck = []
xHead = []
yHead = []
xShoulderLeft = []
yShoulderLeft = []
xElbowLeft = []
yElbowLeft = []
xWristLeft = []
yWristLeft = []
xHandLeft = []
yHandLeft = []
xHipLeft = []
yHipLeft = []
xKneeLeft = []
yKneeLeft = []
xAnkleLeft = []
yAnkleLeft = []
xFootLeft = []
yFootLeft = []
xHandTipLeft = []
yHandTipLeft = []
frameTime = []
for i in range(len(arr)):
    xNeck.append(arr[i][0])
    yNeck.append(arr[i][1])
    xHead.append(arr[i][2])
    yHead.append(arr[i][3])
    xShoulderLeft.append(arr[i][4])
    yShoulderLeft.append(arr[i][5])
    xElbowLeft.append(arr[i][6])
    yElbowLeft.append(arr[i][7])
    xWristLeft.append(arr[i][8])
    yWristLeft.append(arr[i][9])
    xHandLeft.append(arr[i][10])
    yHandLeft.append(arr[i][11])
    xHipLeft.append(arr[i][12])
    yHipLeft.append(arr[i][13])
    xKneeLeft.append(arr[i][14])
    yKneeLeft.append(arr[i][15])
    xAnkleLeft.append(arr[i][16])
    yAnkleLeft.append(arr[i][17])
    xFootLeft.append(arr[i][18])
    yFootLeft.append(arr[i][19])
    xHandTipLeft.append(arr[i][20])
    yHandTipLeft.append(arr[i][21])
    frameTime.append(arr[i][22])

"""
Creates Arrays for all X Data and all Y Data
"""
allXData = [[0 for i in range(11)] for j in range(len(arr))]
allYData = [[0 for i in range(11)] for j in range(len(arr))]
for i in range(len(arr)):
    allXData[i][0] = xNeck[i]
    allXData[i][1] = xHead[i]
    allXData[i][2] = xShoulderLeft[i]
    allXData[i][3] = xElbowLeft[i]
    allXData[i][4] = xWristLeft[i]
    allXData[i][5] = xHandLeft[i]
    allXData[i][6] = xHipLeft[i]
    allXData[i][7] = xKneeLeft[i]
    allXData[i][8] = xAnkleLeft[i]
    allXData[i][9] = xFootLeft[i]
    allXData[i][10] = xHandTipLeft[i]
    allYData[i][0] = yNeck[i]
    allYData[i][1] = yHead[i]
    allYData[i][2] = yShoulderLeft[i]
    allYData[i][3] = yElbowLeft[i]
    allYData[i][4] = yWristLeft[i]
    allYData[i][5] = yHandLeft[i]
    allYData[i][6] = yHipLeft[i]
    allYData[i][7] = yKneeLeft[i]
    allYData[i][8] = yAnkleLeft[i]
    allYData[i][9] = yFootLeft[i]
    allYData[i][10] = yHandTipLeft[i]

"""
Graphing Animation for XY Data. The plot Axes need to be cleaned a bit
"""
def plot_cont(xmax):
    y = []
    fig = plt.figure()
    ax = fig.add_subplot(1,1,1)


    def update(i):
        y = allYData[i]
        x = allXData[i]
        ax.clear()
        ax.set_xlim(-2,2)
        ax.set_ylim(-1.5,1.5)
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

plot_cont(len(arr))
