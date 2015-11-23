##Realtionship between CI and Business

PlaceOfBCI=c()
for(i in 1:length(business_data$business_id)){
  Place<-grep(business_data$business_id[i],CI_data$business_id)
   if(length(Place)==0){
  }
   if(length(Place)>0){
     PlaceOfBCI[i]=Place
  }
}

write.csv(PlaceOfBCI,file="Place of Business in Checks in")

##Numbers of CI

NumbersOfCI=c()
for(i in 1:length(CI_data$business_id)){
  Sumatoria1<-sum(CI_data$checkin_info[i,],na.rm=TRUE)
  NumbersOfCI[i]<-Sumatoria1
}

write.table(NumbersOfCI,file = "Numbers of Checks IN")
NumbersOfCI<-read.table("Numbers of Checks IN")
set.seed(487945)

ForEvaluation<-NumbersOfCI[!NumbersOfCI>5000]
Large<-runif(length(ForEvaluation))
FactorNCI<-data.frame(Large,ForEvaluation)
KmeansFNCI<-kmeans(FactorNCI,centers=5)
plot(Large,ForEvaluation,col=KmeansFNCI$cluster,pch=16,cex=0.5)
points(KmeansFNCI$center,col=1:5,pch=3,cex=2)


##Stars given by the people

StarsOfB<-business_data$stars[PlaceOfBCI]
TrueStarsOfB<-StarsOfB[!is.na(StarsOfB)]

##Spliting in categories

Restaurantes<-grep("Restaurants",business_data$categories)
Medicinas<-grep("Health & Medical",business_data$categories)
Hoteles<-grep("Hotels & Travel",business_data$categories)
Nocturno<-grep("Nightlife",business_data$categories)
Hogares<-grep("Home Services",business_data$categories)

##Stars average of categories

SH<-business_data$stars[Hoteles]
SN<-business_data$stars[Nocturno]
SHo<-business_data$stars[Hogares]
SR<-business_data$stars[Restaurantes]
SM<-business_data$stars[Medicinas]

##Test of student
#All test are doing with a 5 % confidence interval, because 
#I am doing 10 test i will add the p-values

HN=t.test(SH,SN,paired=FALSE,var.equal = FALSE)
HHo=t.test(SH,SHo,paired=FALSE,var.equal = FALSE)
HR=t.test(SH,SR,paired=FALSE,var.equal = FALSE)
HM=t.test(SH,SM,paired=FALSE,var.equal = FALSE)
NM=t.test(SN,SM,paired=FALSE,var.equal = FALSE)
NHo=t.test(SN,SHo,paired=FALSE,var.equal = FALSE)
NR=t.test(SN,SR,paired=FALSE,var.equal = FALSE)
HoR=t.test(SHo,SR,paired=FALSE,var.equal = FALSE)
HoM=t.test(SHo,SM,paired=FALSE,var.equal = FALSE)
RM=t.test(SR,SM,paired=FALSE,var.equal = FALSE)

pvalues=c(HN$p.value,HHo$p.value,HR$p.value,HM$p.value,NM$p.value,NHo$p.value,NR$p.value,HoR$p.value,HoM$p.value,RM$p.value)
sum(p.adjust(pvalues,method = "BH")<0.05)

##Merging the data (Stars,Type of business and Numbers Of CheckIns)

PlaceOfEvaluation=c()
k=1
for(i in 1:length(NumbersOfCI)){
  if(NumbersOfCI[i]<=5000){
    PlaceOfEvaluation[k]=i
    k=k+1
  }
}
PlaceOfOthers=c()
k=1
for(i in 1:length(NumbersOfCI)){
  if(NumbersOfCI[i]>5000){
    PlaceOfOthers[k]=i
    k=k+1
  }
}

length(StarsOfB)
NumbersOfCIF<-c(NumbersOfCI[PlaceOfEvaluation],NumbersOfCI[PlaceOfOthers])

TrueStarsOfBF<-c(TrueStarsOfB[PlaceOfEvaluation],TrueStarsOfB[PlaceOfOthers])

Done=c()
for(i in 1:length(KmeansFNCI$cluster)){
  if(KmeansFNCI$cluster[i]==1){
    Done[i]=3
  }
  if(KmeansFNCI$cluster[i]==2){
    Done[i]=2
  }
  if(KmeansFNCI$cluster[i]==3){
    Done[i]=4
  }
  if(KmeansFNCI$cluster[i]==4){
    Done[i]=5
  }
  if(KmeansFNCI$cluster[i]==5){
    Done[i]=1
  }
}

StarsByCluster<-c(Done,rep(5,length(PlaceOfOthers)))



CIAndB<-data.frame(NumbersOfCIF,TrueStarsOfBF,StarsByCluster)
write.table(CIAndB,file="Prototipo de primera tabla")



