library(stringr)
pollutantmean <- function(directory, pollutant, id = 1:332) {
#  print(id) 
#   id<-1:10
  str_pad(id,3,side="left",pad="0")->id

  ####### Reading files
  filenames=character()
  for(i in 1:length(id))
  {
    filenames[i]<-paste("specdata\\",directory,'\\',id[i],'.csv',sep='') }
  
  #    as.data.frame( read.csv(paste("specdata\\specdata\\",file[1],'.csv',sep=''),header=T))->spec_dat[1]
  #     
  # }

  # f<-function(x)
  #   {read.csv(,header=F)}
  #   sapply(filenames,funtion(x) read.csv(x,header=F),simplify = F)->specdat
  # class(specdat)
  # str(specdat)
  final<-read.csv(filenames[1],header=T)
  # names(final)<-c("Date","Sulphate","Nitrate","Id")
  if(length(filenames)>1){
    for(k in 2:length(filenames))
    {
      print(filenames[k])
      rbind(read.csv(filenames[k],header=T),final)->final
    }
  }
  # as.data.frame(specdat[1],deparse.level=1)->final
  # table(final$ID)
  # str(final)
  
  ##############
 print(mean(final[,pollutant],na.rm=T))
 
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}

