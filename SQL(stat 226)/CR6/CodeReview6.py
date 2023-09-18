#!/usr/bin/env python
# coding: utf-8

# In[13]:


import sqlalchemy
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy import text
from sqlalchemy import and_
from sqlalchemy.sql import select
import pymysql


# In[4]:


engine = create_engine("mysql+pymysql://root:password@localhost/sakila", echo = True)


# In[6]:


s = select([text("* from actor")])
engine.execute(s).fetchall()


# In[12]:


dbConnection = engine.connect()


# In[14]:


frame = pd.read_sql("select * from sakila.actor", dbConnection)


# In[15]:


pd.set_option('display.expand_frame_repr', False)


# In[16]:


print(frame)


# In[17]:


frame['first_name']= frame['first_name'].replace(['NICK'], 'HUNTER')


# In[18]:


print(frame)


# In[31]:


frame['first_name']= 'HOWARD'


# In[32]:


print(frame)


# In[35]:


connection = create_engine("mysql+pymysql://root:password@localhost/stats126", echo = True)


# In[36]:


frame.to_sql('actor_improved',connection)







