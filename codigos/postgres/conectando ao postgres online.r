
install.packages("RPostgreSQL")

library(RPostgreSQL)

#servidor site: https://customer.elephantsql.com/login

# create a connection
# save the password that we can "hide" it as best as we can by collapsing it
pw <- {
  "tkachrpq"
}

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "tkachrpq",
                 host = "hansken.db.elephantsql.com", port = 5432,
                 user = "tkachrpq", password = pw)
rm(pw) # removes the password

con

