import angles.py

"""
Using data from Max's angles.py going to start trying to build an algorithm
based on the little data that we know
"""

def main(file):
    weighted_var = 50;
    angles = generateAnglesForFile(file)

   """
   Trying to measure and weight the hip angle
   """
    if(angles[2]>45):
        weighted_var += 1(15)
    else if (angles[2]<45):
        weighted_var -= 1(15)
    else:
        weighted_var = weighted_vars

    """
    Trying to measure and weight the arm swing
    """
    if(angles[0]<70):
        weighted_var += 1(5)
    else if(angles[0]>70):
        weighted_var -= 1(5)
    else:
        weighted_var = weighted_var





    if(weighted_var<35):
        print "Subject is a MALE"
    else if(weighted_var>65):
        print "Subject is a FEMALE"
    else:
        print "Data is too close to tell. Please try again."
