#!/usr/bin/env python
# coding: utf-8

# In[48]:


import pandas as pd
import numpy as np
import scipy.stats as ss
from scipy.stats import ttest_ind
from scipy.stats import f_oneway


# In[49]:


import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')


# In[50]:


amzbook = pd.read_table('/Users/student/desktop/amazon-books.txt')
amzbook.head()


# In[51]:


amzbook


# In[52]:


# question 1
amzbook.dropna(inplace = True)


# In[53]:


len(amzbook.index)


# In[54]:


print("Question 1: The number of books for us to analyze after removing those with missing information is " + str(amzbook.shape[0]) + ".")
# 310 books

# In[55]:


# question 2
amzbook['Hard/ Paper'].value_counts()


# In[56]:


bookcovers = amzbook.groupby('Hard/ Paper').count()


# In[57]:


print("Question 2: There are " + str(bookcovers.Title.P) + " paperback books and " + str(bookcovers.Title.H) + " hardback books")
# 232 paper back books and 78 hardback books

# In[58]:


azbookmeans = amzbook.groupby(['Hard/ Paper']).agg(['mean'])


# In[59]:


azbookmeans


# In[60]:


azbookdiff = azbookmeans.diff(periods = -1)


# In[61]:


azbookdiff


# In[62]:


azbookdiff.iloc[0,0]


# In[63]:


print("Question 3: The difference in mean list price between hardback and paperback books is about " +
     str(round(azbookdiff.iloc[0,0], 2)))
# the difference in mean list price between hard and paper back books is about 3.03

# In[ ]:





# In[64]:


books300up = amzbook[amzbook['NumPages'] > 300].groupby('NumPages').mean()
mean300up = books300up['List Price'].mean()


# In[65]:


mean300up


# In[66]:


booksless300 = amzbook[amzbook['NumPages'] < 300].groupby('NumPages').mean()
meanless300 = booksless300['List Price'].mean()


# In[67]:


meanless300


# In[68]:


pagepricedif = mean300up - meanless300
pagepricedif


# In[69]:


print("Question 4: The difference of mean prices between books with 300 pages and those with less than 300 pages is $" + str(pagepricedif))
print("In my opinion I don't think it is that big of difference of a price gap between the types of books, however I don't read very much " 
      "so it could be a significant difference for people who read a lot and buy a lot of books. A big difference for me would be around $15 where I would start to take account for the price difference"
      )

# the mean price difference is $4.746487213403885, and in my opinion it's not a significant difference. Rest of explanation
# is in the screenshot

# In[ ]:



# the next few lines of code are the elements that I will put into my function and making sure it works how it should

# In[70]:


n1 = len(amzbook['List Price'])


# In[71]:


float(n1)


# In[72]:


n2 = len(amzbook['Amazon Price'])


# In[73]:


float(n2)


# In[74]:


print(amzbook['List Price'])


# In[75]:


s1 = np.std(amzbook['List Price'])


# In[76]:


s1


# In[77]:


s2 = np.std(amzbook['Amazon Price'])


# In[78]:


s2


# In[79]:


mean1 = amzbook['List Price'].mean()


# In[80]:


mean1


# In[81]:


mean2 = amzbook['Amazon Price'].mean()


# In[82]:


mean2


# In[83]:


firstpart = (n1-1)*(s1**2)


# In[84]:


firstpart


# In[85]:


secondpart = (n2 -1)*(s2**2)


# In[86]:


secondpart


# In[87]:


denominator = (n1+n2)-2


# In[88]:


denominator


# In[89]:


(firstpart + secondpart) / denominator


# In[90]:

#hypothesis testing function

def hypothesis_test(sample1, sample2):
    n1 = len(sample1); #n for list price
    n1 = float(n1); #change type to float
    n2 = len(sample2); #n for amazon price
    n2 = float(n2); # change type to float
    s1 = np.std(sample1); #standard deviation for list price
    s2 = np.std(sample2); # standard deviation for amazon price
    mean1 = np.mean(sample1); # mean of list price
    mean2 = np.mean(sample2); # mean of amazon price
    a = (n1-1) * (s1**2); #first part of t stat numerator
    b = (n2-1) * (s2**2); # second part of t stat numerator
    c = (n1+n2) - 2; # t stat denominator
    teststat = (a + b)/c; # test statistic without square root
    teststat = np.sqrt(teststat) #square root to get test statistic
    p_value = ss.t.cdf(abs(teststat),df = 309); # p value using given function from instructions
    print("test statistic: ");
    print(teststat)
    print("P value: ");
    print(p_value);
    return teststat,p_value;
    
    
    


# In[91]:


output = str(hypothesis_test(amzbook['List Price'], amzbook['Amazon Price']))


# In[92]:


output


# In[93]:


print("Question 5: The test statistic and P-value from the function is: " + output)
print("The P-value is 1.0, and that is greater than aplha set at .05 so we can determine that this the difference between the mean prices for list and amazon is not significant."
)
# output is test statistic: 12.442249048483772 and p-value is 1.0
# explanatin for significance is in the screenshot

# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




