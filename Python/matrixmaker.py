
# coding: utf-8

# In[105]:


import pandas as pd
import numpy as np
from sklearn import linear_model
import matplotlib.pyplot as plt


# In[106]:


from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
from sklearn.metrics import accuracy_score
from sklearn.metrics import r2_score


# In[107]:


# name tester file and produce array to be used in linear regression for constrained
# df=pd.read_csv("DeltaF1large.csv")
nameoftester="Deltaf2smalltest.csv"
nameoffile="Deltaf2smalltest1.csv"
test=pd.read_csv(nameoftester)


# In[108]:


test1=np.array(test)
# test1
test2=pd.DataFrame(test1)
# test2


# In[109]:


poly_reg=PolynomialFeatures(degree=2)
poly_testvar=poly_reg.fit_transform(test1)

poly_testvar


# In[110]:


# saves file in csv format
np.savetxt(nameoffile, poly_testvar, delimiter=",")

