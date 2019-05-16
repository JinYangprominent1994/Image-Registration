import math
import numpy as np
import random
import matplotlib.pyplot as plt
import math
from scipy.special import comb

t=np.arange(1,5,0.01)
x=np.array([1,2,3,4,5])
y = np.array([1 - 0.5*math.exp((-2)*i) + 0.5*math.exp((-4)*i) for i in t])
y1=np.array([0.9313,0.9914,0.9991,0.9999,1.0000])
y2=np.array([0.9365,0.9911,0.9989,0.9999,1.0000])
y3=np.array([0.9405,0.9910,0.9988,0.9998,1.0000])
y4=np.array([0.9410,0.9910,0.9988,0.9998,1.0000])
y5=np.array([0.9414,0.9910,0.9988,0.9998,1.0000])
#y2=np.array([4*math.exp(-12*i*i) for i in x])

plt.plot(t,y,label="exact",linewidth=0.5)
plt.plot(x,y1,label="step=0.1",linewidth=0.5)
plt.plot(x,y2,label="step=0.05",linewidth=0.5)
plt.plot(x,y3,label="step=0.01",linewidth=0.5)
plt.plot(x,y4,label="step=0.005",linewidth=0.5)
plt.plot(x,y5,label="step=0.001",linewidth=0.5)
#plt.plot(x,y)
#plt.plot(x,y2,label="Hoeffding")
plt.xlabel("t")
plt.ylabel("y")
plt.legend()
plt.show()
