complete<-function(directory,id=1:10) {
  print(id)
  complete_data<-data.frame(id=integer(),nobs=integer(),stringsAsFactors=FALSE)
  ##str(complete_data)
  file_list<-list.files(paste(getwd(),directory,sep="/"))
  for (current_id in id)  {
     for (file_name in file_list){
        complete_table<-data.frame(Date=as.Date(character()),sulfate=double(),nitrate=double(),ID=integer(),stringsAsFactors=FALSE)
        current_table<-read.csv(paste(getwd(),directory,file_name,sep="/"))
        if (current_id %in% current_table[["ID"]]) {
          not_na<-complete.cases(current_table)
          complete_table<-rbind(complete_table,current_table[not_na,])
          ##str(complete_table)
          complete_data_nobs<-nrow(complete_table)
          complete_data_id<-current_table$ID[1]
          complete_data<-bind_rows(complete_data,c(id=complete_data_id,nobs=complete_data_nobs))
          ## str(complete_data)
          ##print(complete_data_id)
          ##print(mean_value)
        }
    }
  }
 ## complete_data<-complete_data[-c(1),]  
  print(complete_data)
}