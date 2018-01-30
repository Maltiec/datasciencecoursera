complete<-function(directory,id=1:10) {
  complete_data<-data.frame(id=0,nobs=0)
  file_list<-list.files(paste(getwd(),directory,sep="/"))
  for (file_name in file_list){
    complete_table<-data.frame(Date=0,sulfate=0,nitrate=0,ID=0)
    current_table<-read.csv(paste(getwd(),directory,file_name,sep="/"))
    for (current_id in id)  {
      if (current_id %in% current_table[["ID"]]) {
        not_na<-complete.cases(current_table)
        complete_table<-rbind(complete_table,current_table[not_na,])
        complete_table<-complete_table[-c(1),]
        complete_data_nobs<-nrow(complete_table)
        complete_data_id<-complete_table$ID[2]
        complete_data<-rbind(complete_data,c(complete_data_id,complete_data_nobs))
        ##print(complete_data_id)
        ##print(mean_value)
      }
      
    }
    
  }
  complete_data<-complete_data[-c(1),]  
  print(complete_data)
  }