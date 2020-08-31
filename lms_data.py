import matplotlib.pyplot as plt
import numpy as np

l_data = np.zeros([251,2])
plt.figure(dpi=150)
plt.xlim([-1.2,1.2])
plt.ylim([-1.2,1.2])

x = np.linspace(0,0,251)*(5/24)
y = np.linspace(0,-4,251)*(1/4)
l_data[:,0] = x
l_data[:,1] = y
plt.plot(x,y)

plt.show()

np.savetxt('./l_data.csv', l_data, delimiter=',')

m_data = np.zeros([251, 2])

plt.figure(dpi=150)
plt.xlim([-1.2,1.2])
plt.ylim([-1.2,1.2])

x = np.linspace(0,0,71)*(5/24)
y = np.linspace(0,-2,71)*(1/4)
m_data[:71,0] = x
m_data[:71,1] = y
plt.plot(x,y)

x = np.linspace(0,2,90)
y = -2 + 2*np.sqrt(1-(x-1)**2)
x = x*(5/24)
y = y*(1/4)
m_data[71:161,0] = x
m_data[71:161,1] = y
plt.plot(x,y)

x = np.linspace(2,4,90)
y = -2 + 2*np.sqrt(1-(x-3)**2)
x = x*(5/24)
y = y*(1/4)
m_data[161:,0] = x
m_data[161:,1] = y
plt.plot(x,y)

plt.show()

np.savetxt('./m_data.csv', m_data, delimiter=',')

s_data = np.zeros([251, 2])

plt.figure(dpi=150)
plt.xlim([-1.2,1.2])
plt.ylim([-1.2,1.2])

x = np.linspace(0,-2,84)
y = (1/2)*np.sqrt(1-(x+1)**2)
x = x*(5/24)
y = y*(1/4)
s_data[:84,0] = x
s_data[:84,1] = y
plt.plot(x,y)

x = np.linspace(-2,-1,42)
y = (-1/2)*np.sqrt(1-(x+1)**2)
x = x*(5/24)
y = y*(1/4)
s_data[84:126,0] = x
s_data[84:126,1] = y
plt.plot(x,y)

x = np.linspace(-1,0,41)
y = -1 + (1/2)*np.sqrt(1-(x+1)**2)
x = x*(5/24)
y = y*(1/4)
s_data[126:167,0] = x
s_data[126:167,1] = y
plt.plot(x,y)

x = np.linspace(0,-2,84)
y = -1 + (-1/2)*np.sqrt(1-(x+1)**2)
x = x*(5/24)
y = y*(1/4)
s_data[167:,0] = x
s_data[167:,1] = y
plt.plot(x,y)

plt.show()

np.savetxt('./s_data.csv', s_data, delimiter=',')