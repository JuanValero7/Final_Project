#Data frame CI/Business/Tips

NumberOfComments=c()
for(i in 1:length(PlacesOfTips)){
  NumberOfComments[i]=length(PlacesOfTips[[i]])
}

NumberOfComments1=c()
for(i in 1:length(PlacesOfTips1)){
  NumberOfComments1[i]=length(PlacesOfTips1[[i]])
}

NumberOfComments2=c()
for(i in 1:length(PlacesOfTips2)){
  NumberOfComments2[i]=length(PlacesOfTips2[[i]])
}

NumberOfCommentsF<-c(NumberOfComments,NumberOfComments1,NumberOfComments2)

#EL DATA FRAME TENDRA NCI/SBC/TS/NC/NW/PROP(CON NO TIPS)

Proportions=c()
for(i in 1:length(NumberOfWords)){
  if(NullorNotF[i]=="SI"){
    Proportions[i]="No comments"
  }
  if(NullorNotF[i]=="NO"){
    if(NumberOfWords[i]!="It is ok"){
    Proportions[i]=(as.numeric(NumberOfWords[i]))/NumberOfCommentsF[i]
    }
    if(NumberOfWords[i]=="It is ok"){
    Proportions[i]="Not neccesary"  
    }
    }
}

CIandBandTips<-data.frame(CiandB,NumberOfWords,NumberOfCommentsF,NullorNotF,Proportions)
CIandBandTips[55:63,]

write.table(CIandBandTips,file="Tabla para evaluar")

