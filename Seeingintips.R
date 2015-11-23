PlaceOfBCI<-read.csv("Place of Business in Checks in",header = TRUE)
PLaceOfBCI<-PlaceOfBCI[,2]

Nombres<-business_data$business_id[PLaceOfBCI]
Nombres<-Nombres[!is.na(Nombres)]

PlacesOfTips<-list()
for(i in 1:length(Nombres)){
  PlacesOfTips[[i]]<-grep(Nombres[i],tip_data$business_id)
}

PlacesOfTips1<-list()
for(i in 1:10000){
  PlacesOfTips1[[i]]<-grep(Nombres[i+16982],tip_data$business_id)
}

PlacesOfTips2<-list()
for(i in 1:18184){
  PlacesOfTips2[[i]]<-grep(Nombres[i+26982],tip_data$business_id)
}

good_works<-c("good","awesome","great","best","fun","better","love","nice","like","favorite")

bad_works<-c("waste","bad","worst","ugly","boring","worse","hate")


for(i in 1:length(good_works)){
aver<-grep(good_works[i],tip_data$text[PlacesOfTips1[[4566]]])
}

