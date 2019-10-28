install.packages("RPostgreSQL")

library(RPostgreSQL)



# create a connection
# save the password that we can "hide" it as best as we can by collapsing it
pw <- {
  "root"
}

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "postgres",
                 host = "localhost", port = 5432,
                 user = "postgres", password = pw)
rm(pw) # removes the password

con

# check for the cartable
dbExistsTable(con, "filme")
# TRUE

