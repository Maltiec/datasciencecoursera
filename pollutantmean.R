pollutantmean <- function(directory,pollutant,id=1:332) {
  mean_value<-0
  na_cleared_list<-data.frame(Date=as.Date(character()),sulfate=double(),nitrate=double(),ID=integer())
  file_list<-list.files(paste(getwd(),directory,sep="/"))
  for (file_name in file_list){
    current_table<-read.csv(paste(getwd(),directory,file_name,sep="/"))
    for (current_id in id)  {
      if (current_id %in% current_table[["ID"]]) {
      not_na<-complete.cases(current_table[[pollutant]])  
      na_cleared_list<-rbind(na_cleared_list,current_table[not_na,])
      ##print(mean_value)
      }
    }
  }
##  na_cleared_list<-na_cleared_list[-c(1),]
##  print(na_cleared_list)
  mean_value<-colMeans(na_cleared_list[pollutant])
  print(mean_value)
  }