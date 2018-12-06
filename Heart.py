import numpy as np
import matplotlib.pyplot as plt

def file1():
	with open('final_ecg.txt','r') as f:
		d=f.read().split()
		g=[float(i) for i in d ]
		return g
'''
def file2():
	with open('final_ecg_down.txt','r') as f:
		d=f.read().split()
		g=[float(i) for i in d ]
		h=np.asarray(g)
		return h
'''
def derivative(der):
	f=[]
	for j in range(len(der)-1):
		c=(der[j+1]-der[j])*360
		f.append(c)
	return f

def hbpm(heart,l):
	hb = (heart/(l/360.00))*60.00
	return hb

if __name__ == '__main__':
	a=file1()
	t = []
	heartbeat = 0.00
	hr =[]
	derv = derivative(a)
	derv1=np.zeros(len(derv))
	for k in range(1,len(derv)-2):
		if derv[k]>derv[k-1] and derv[k]>derv[k+1] and derv[k]>(0.6*max(derv)):
			current =  k
			t.append(k)
			derv1[k]=1
			heartbeat+=1
			hr.append(hbpm(heartbeat,k))
			

	plt.plot(derv[0:1000],'r')
	plt.plot(derv1[0:1000],'b')
	plt.show()		

	
	
