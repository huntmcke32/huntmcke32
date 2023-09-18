#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np


# In[29]:


# question 2 making a function that creates a array from 0-100 with 100 values
def Create_Data():
    global x
    x = np.random.choice(range(0,100),100)
    print ("Data created.")
    return x

    
    


# In[30]:


# example to see if create data function works which it does
Create_Data()


# In[31]:


# question 3 sort the data function
def Sort_Data():
    (np.sort(x))
    print ("Data sorted")


# In[33]:


# testing to see if we get right output from function which we do
Sort_Data()


# In[34]:


#question 4 summarize data function
def Summarize_Data():
    print('My data has {}'.format(len(x)) + ' elements')
    print('The mean is {}'.format(np.mean(x)))
    print('The maximum is {}'.format(max(x)))
    print('The minimum is {}'.format(min(x)))


# In[35]:


# testing summarize data function to see if it works which it does
Summarize_Data()


# In[36]:


# question 5
def Even_Values():
    evenNumbers = 0
    for i in x:
        if i % 2 == 0:
            evenNumbers += 1
            
    print('My data has', evenNumbers, 'even values.' )
            


# In[37]:


# seeing if even values function works which it does
Even_Values()


# In[38]:


#question 1 and 6. Put at the end so the supplementary functions would run in main 
def main():
    Create_Data()
    Sort_Data()
    Summarize_Data()
    Even_Values()
    


# In[39]:


# correct output from main
# second time calling main to see if it works on it's own which it does
main()


# In[ ]:




