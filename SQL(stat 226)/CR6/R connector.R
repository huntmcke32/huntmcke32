install.packages("RMySQL")

library(RMySQL)

mydb = dbConnect(MySQL(), user='student', 
password='stats123', dbname='classicmodels', host='localhost')

dbListTables(mydb) #shows the tables from a certain database
dbListFields(mydb, 'customers') #list fields from a certain table
dbSendQuery() #this sends querys to mysql from R. 

dbWriteTable(mybd, name='table_name', value=data.frame.name)
#create tables in the db using r dataframes

rs = dbSendQuery(mydb, "select * from some_table")
#retrieve data rom the db and save it in rs

data = fetch(rs, n=-1)
#allows us to access the results of the data in r, and saves it as a 
#dataframe object