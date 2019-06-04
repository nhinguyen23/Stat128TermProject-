library(RSQLite)
myconnection<- dbConnect(drv = SQLite(), dbname= "C:\\Users\\nhing\\Desktop\\uw-madison-courses\\database.sqlite3")
dbListTables(myconnection)
dbListFields(myconnection,"grade_distributions")
dbListFields(myconnection,"subject_memberships")
#S= Satisfied, U= UNsatisfied, P= Progress, I= Incomplete, CR= Credit, N= No Credit
#NW= No Work, NR= No Report

#2
subject.grades<- dbGetQuery(myconnection, "SELECT * FROM grade_distributions
INNER JOIN subject_memberships")

library(plyr)
num.couse.by.grade=count(subject.grades, "course_offering_uuid")

