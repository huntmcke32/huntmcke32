library(RMySQL)

#building the connector to sakila database in sql
mydb = dbConnect(MySQL(), user='root', 
password='stats123', dbname='sakila', host='localhost')


# list all tables in database to make sure we're in right one
dbListTables(mydb)

#using the connector and a query to select all data from a table in my database
a = dbSendQuery(mydb, "select * from actor")

#fetching all the data 
data = fetch(a, n=-1)

#change all the first names to my first name
data["first_name"] <-"Howard"

mydb2 = dbConnect(MySQL(), user='student', password='stats123', 
                  dbname='stats126', host='localhost')

dbWriteTable(mydb2, name='actor_improved2', value=data, append = TRUE)
