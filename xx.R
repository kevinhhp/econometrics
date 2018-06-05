library("knitr")
options(digits=3) 
spends<-readxl::read_xlsx(path = "data/Lab3-family-spends.xlsx")
students<-read.csv("data/students-list-2018-spring.csv",header = T,sep=",")
k<-dim(students)[1]
n<-dim(spends)[1]
rdm<-matrix(rnorm(n*k),nrow=n)
food_rdm<-rdm+matrix(spends$food,nrow=n)
table_1r<-t(students)
table_rdm<-rbind(table_1r,food_rdm)
blank1<-data.frame(rep(NA,dim(table_1r)[1]))
blank2<-data.frame(spends$totexp)
dimnames(blank1)[2]<-names(blank2)
table_same<-rbind(blank1,blank2)
table_exercise<-cbind(table_same,table_rdm)
table_exercise[1:4,1]<-"totexp"
dimnames(table_exercise)[1]<-list(c(-3:0,1:(dim(table_exercise)[1]-4)))
write.csv(format(table_exercise,digits=3),"data/lab3-family-spend-random.csv")


