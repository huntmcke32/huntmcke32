#!/usr/bin/env python
# coding: utf-8

# In[1]:


dict = {'Make': 'Toyota', 'Year': 2003, 'Seats': 5, 'Horsepower': 130, 'Transmission': 'Automatic', 'Compact': True, 'Cylinders': 4, 'Engine Size': 1.8, 'Turning Radius': 35.2}


# In[2]:


print (dict['Make'])


# In[3]:


print(dict['Seats'])


# In[4]:


CorollaKeyTypes = []


# In[5]:


CorollaValueTypes = []


# In[6]:


for key in dict:
    CorollaKeyTypes.append(type(key))


# In[7]:


CorollaKeyTypes


# In[8]:


for key in dict:
    print(key)


# In[9]:


for key in dict:
    print(type(key))


# In[10]:


for value in dict.values():
    print(value)


# In[11]:


for value in dict.values():
    CorollaValueTypes.append(type(value))


# In[12]:


CorollaValueTypes


# In[13]:


CarLot = {'Corolla': {'Make': 'Toyota', 'Year': 2003, 'Seats': 5, 'Horsepower': 130, 'Transmission': 'Automatic', 'Compact': True, 'Cylinders': 4, 'Engine Size': 1.8, 'Turning Radius': 35.2},
         'Mustang': {'Make': 'Ford', 'Year': 2015, 'Seats': 4, 'Horsepower': 435, 'Transmission': 'Manual', 'Compact': False, 'Cylinders': 8, 'Engine Size': 5.1, 'Turning Radius': 37.8},
         'RSX': {'Make': 'Acura', 'Year': 2005, 'Seats': 4, 'Horsepower': 210, 'Transmission': 'Manual', 'Compact': True, 'Cylinders': 4, 'Engine Size': 2.2, 'Turning Radius': 38.1 }}


# In[14]:


CarLot['Corolla']['Make']


# In[15]:


CarLot['Mustang']['Horsepower']


# In[16]:


CarLot['RSX']['Horsepower']


# In[17]:


CarLotCorollaValueTypes = []


# In[18]:


CarLotCorollaValueTypes
    


# In[19]:


CarLot['Corolla'].values()


# In[20]:


for key in CarLot['Corolla'].values():
    print(type(key))


# In[21]:


print(CorollaValueTypes)


# In[22]:


for key in CarLot['Corolla'].values():
    CarLotCorollaValueTypes.append(type(key))


# In[23]:


print(CarLotCorollaValueTypes)
print(CorollaValueTypes)


# In[26]:


for i in CarLot['Mustang'].items():
    print (i)


# In[56]:


print('The horsepower of a {}'.format(CarLot['Corolla']['Year']) + ' ' + (CarLot['Corolla']['Make']) + " is " + str(CarLot['Corolla']['Horsepower']))


# In[ ]:




