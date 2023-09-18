#!/usr/bin/env python
# coding: utf-8

# In[3]:


z = [6,3,8,5,5,7,5,7,6,2,5,5,6,6,2,4,5,3,5,4,5,2,5,4,6,9,6,4,

       7,1,6,5,3,6,5,4,2,3,5,2,6,12,8,2,5,1,2,4,9,3,3,6,2,9,4,3,

       8,8,3,4,6,8,7,10,3,7,4,3,3,3,1,11,5,4,10,8,4,7,5,4,6,2,6,

       6,5,7,2,2,1,6,2,4,5,3,8,5,4,6,9,5,4,4,6,6,6,6,5,5,5,7,6,

       4,4,5,4,3,2,3,6,5,7,5,6,2,7,6,3,2,7,5,4,4,7,4,6,4,3,4,9,6,

       5,8,2,3,7,1,10,8,5,7,4,4,7,5,4,4,4,3,2,7,5,7,3,3,3,4,3,3,

       7,7,4,11,4,5,4,4,5,7,4,9,6,8,7,6,6,3,7,6,5,5,3,6,2,4,2,5,

       6,7,10,5,8,4,7,8,3,4,1,6,6,3,5,5,2,2,1,3,5,3,5,3,2,5,3,5,

       8,3,2,6,3,12,3,4,3,7,8,8,5,4,4,5,5,7,5,8,4,5,3,3,7,6,7,2,

       4,5,5,5,5,1,4,4,4,6,1,2,5,2,5,8,3,8,5,4,6,5,2,5,3,7,6,6,

       4,6,6,3,7,6,5,4,2,12,3,8,5,4,9,4,4,5,5,4,8,4,6,5,6,3,12,6,

       2,7,8,4,3,5,5,5,2,3,5,7,6,6,4,4,5,7,4,3,7,4,3,2,3,4,2,7,4,

       4,5,6,1,4,4,3,6,6,5,8,6,1,3,2,7,2,6,5,6,5,7,4,2,4,6,6,6,6,

       5,4,9,4,7,2,2,8,3,10,7,6,7,9,6,6,4,2,2,7,8,5,7,6,0,3,5,1,

       4,1,8,2,6,3,7,5,3,3,1,8,6,4,7,4,8,4,4,6,8,4,5,7,9,7,4,0,2,

       2,6,4,3,6,7,7,9,8,8,9,7,4,8,6,8,10,5,6,1,4,3,9,7,4,6,7,6,

       5,5,3,1,5,4,7,3,4,2,7,4,5,3,9,8,7,3,9,9,4,7,8,4,4,4,5,6,7,

       5,11,6,3,4,0,4,5,3,5,6,5,4,5,5,1,4,3,5,3]


# In[4]:


import numpy as np


# In[5]:


# Assign a value to a to be your random seed for this assignment.
a = 2319
np.random.seed(a)


# In[6]:


# Create your array 
size = np.random.choice(range(10,50), 1)
x = np.random.choice(z, size)


# In[47]:


# values in x array
x
print(x)


# In[48]:


#length of the array
len(x)
print(len(x))


# In[49]:


#sum of the array
sum(x)
print(sum(x))


# In[50]:


#mean of the array
np.mean(x)
print(np.mean(x))


# In[51]:


# standard deviation of x array
np.std(x, ddof = 1)
print(np.std(x, ddof =1))


# In[52]:


# standard deviation of first 10 values in x array
np.std(x[0:10], ddof = 1)
print(np.std(x[0:10], ddof =1))


# In[53]:


#values in x array where index is even
x[::2]
print(x[::2])


# In[54]:


# sum of values in x array where index is even
sum(x[::2])
print(sum(x[::2]))


# In[55]:


# boolean statement to find even values in x array
even_numbers = 0 == (x % 2)


# In[56]:


# boolean mask of x array values
even_numbers
print(even_numbers)


# In[57]:


# values of true statements from boolean mask aka all the even values in the x array
x[even_numbers]
print(x[even_numbers])


# In[58]:


#sum of all even values in x array
sum(x[even_numbers])
print(sum(x[even_numbers]))


# In[ ]:




