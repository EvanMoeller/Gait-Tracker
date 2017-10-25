import scipy
import staticDistances.py

def filter_data(hipKnee,kneeAnkle,shoulderElbow,elbowHand,neckHead):
    



def smooth_data():
    objer = filter_data(generateDistancesForFile("walter1.csv"))
    graphDistanceData(objer)

"""
This is just included for testing the filter
"""
def main():
    graphDistanceDataForFile("walter1.csv")
    smooth_data()

main()
