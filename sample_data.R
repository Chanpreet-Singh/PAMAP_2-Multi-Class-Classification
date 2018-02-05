for(k in c(1:8)){
  print(paste0("Iteration:",k))
  first<-"C:/Users/Chanpreet/Desktop/Project/PAMAP2_Dataset/PAMAP2_Dataset/Protocol/subject10"
  second<-toString(k)
  third<-".dat"
  filename<-paste(first,second,third,sep = "")
  
  data<-read.table(filename)
  na.omit(data)
  
  u<-sort(unique(data$V2))
  
  framed_data<-data.frame(data)
  if(k==1)
    final_data<-framed_data[1,]
  
  for(j in u){
    
    temp1<-framed_data[framed_data$V2==j,]
    
    x<-floor(nrow(temp1)/5)
    
    sampled_data<-temp1[sample(nrow(temp1),x), ]
    
    final_data <- rbind(final_data[,], sampled_data[,])
    
  }
}
  final_data<-final_data[-c(1),]
  row.names(final_data)<-NULL
  names(final_data)<-NULL
  #write.table(final_data,"sampled_data.dat")
  
  
  final_data2<-final_data[,-c(1,3,18,19,20,35,36,37,52,53,54)]
  final_data3<-final_data2
  
  write.table(final_data2,"omitted_data.dat")
  write.csv(final_data2,"omitted_data.csv")  
    