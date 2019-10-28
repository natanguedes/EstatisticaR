


library(RODBC)
con <- odbcConnect("XE", uid="SYS", pwd="root", rows_at_time = 500)
sqlSave(con,test_table, "Persons")
sqlQuery(con,"select count(*) from Persons")
close(con)