a4=c()
a5<-0
r<-1



for(i in 1:length(PlacesOfTips)){
  if(Ok_NotOk[i]=="HIGH"){
    for(j in 1:length(good_works)){
      a1<-grep(good_works[j],tip_data$text[PlacesOfTips[[i]]])
      a5<-length(a1)+a5
    }
      a4[r]<-a5
  }
  if(Ok_NotOk[i]=="LOW"){
    for(k in 1:length(bad_works)){
      a3<-grep(bad_works[k],tip_data$text[PlacesOfTips[[i]]])
      a5<-length(a3)+a5
    }
  }
      a4[r]<-a5
    if(Ok_NotOk[i]=="It is ok"){
      a4[r]="It is ok"
    }
      r<-r+1
      a5<-0
}

a6=c()
a5<-0
r<-1

for(i in 1:length(PlacesOfTips1)){
  if(Ok_NotOk[i+16982]=="HIGH"){
    for(j in 1:length(good_works)){
      a1<-grep(good_works[j],tip_data$text[PlacesOfTips1[[i]]])
      a5<-length(a1)+a5
    }
    a6[r]<-a5
  }
  if(Ok_NotOk[i+16982]=="LOW"){
    for(k in 1:length(bad_works)){
      a3<-grep(bad_works[k],tip_data$text[PlacesOfTips1[[i]]])
      a5<-length(a3)+a5
    }
  }
  a6[r]<-a5
  if(Ok_NotOk[i+16982]=="It is ok"){
    a6[r]="It is ok"
  }
  r<-r+1
  a5<-0
}

a7=c()
a5<-0
r<-1

for(i in 1:length(PlacesOfTips2)){
  if(Ok_NotOk[i+26982]=="HIGH"){
    for(j in 1:length(good_works)){
      a1<-grep(good_works[j],tip_data$text[PlacesOfTips2[[i]]])
      a5<-length(a1)+a5
    }
    a7[r]<-a5
  }
  if(Ok_NotOk[i+26982]=="LOW"){
    for(k in 1:length(bad_works)){
      a3<-grep(bad_works[k],tip_data$text[PlacesOfTips2[[i]]])
      a5<-length(a3)+a5
    }
  }
  a7[r]<-a5
  if(Ok_NotOk[i+26982]=="It is ok"){
    a7[r]="It is ok"
  }
  r<-r+1
  a5<-0
}



NumberOfWords<-c(a4,a6,a7)

NullorNot=c()
a=1
for(i in 1:length(PlacesOfTips)){
  if(length(PlacesOfTips[[i]])==0){
    NullorNot[a]="SI"
    a=a+1  
    }
  if(length(PlacesOfTips[[i]])>0){
    NullorNot[a]="NO"
    a=a+1  
  }
}

NullorNot1=c()
a=1
for(i in 1:length(PlacesOfTips1)){
  if(length(PlacesOfTips1[[i]])==0){
    NullorNot1[a]="SI"
    a=a+1  
  }
  if(length(PlacesOfTips1[[i]])>0){
    NullorNot1[a]="NO"
    a=a+1  
  }
}

NullorNot2=c()
a=1
for(i in 1:length(PlacesOfTips2)){
  if(length(PlacesOfTips2[[i]])==0){
    NullorNot2[a]="SI"
    a=a+1  
  }
  if(length(PlacesOfTips2[[i]])>0){
    NullorNot2[a]="NO"
    a=a+1  
  }
}


NullorNotF<-c(NullorNot,NullorNot1,NullorNot2)
length(NullorNotF)
table(NullorNotF)
