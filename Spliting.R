CiandB<-read.table("Prototipo de primera tabla")

##Acorde/No acorde
Ok_NotOk<-c()

for(i in 1:length(CiandB$TrueStarsOfBF)){
  if(CiandB$StarsByCluster[i]>=CiandB$TrueStarsOfBF[i]-0.5 & CiandB$StarsByCluster[i]<=CiandB$TrueStarsOfBF[i]+0.5){
    Ok_NotOk[i]="It is ok"
  }
  if(CiandB$StarsByCluster[i]<=CiandB$TrueStarsOfBF[i]-0.5){
    Ok_NotOk[i]="HIGH"
  }
  if(CiandB$StarsByCluster[i]>=CiandB$TrueStarsOfBF[i]+0.5){
    Ok_NotOk[i]="LOW"
  }
}
table(Ok_NotOk)
#We found evidence that doesn't exist a relation between the CI and Business

Proporcion<-990/(44176+990)
Proporcion

#So we have to see the trend of people who comment about a business and in
#base of that make inference


