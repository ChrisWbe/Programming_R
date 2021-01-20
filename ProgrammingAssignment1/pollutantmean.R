pollutantmean = function(directory, pollutant, id=1:332){
    char_id = sprintf(sprintf("%03d",id))
    archives = paste(directory,"/",char_id,".csv",sep = "")
    print(archives)
    
    pollutant_data_list = 0
    for(i in 1:length(id)){
        print(i)
        print(archives[i])
        data = as.data.frame(read.csv(archives[i]))
        pollutant_data = data[[pollutant]]
        pollutant_data = pollutant_data[!is.na(pollutant_data)]
        print(pollutant_data)
        pollutant_data_list = append(pollutant_data_list,pollutant_data)
    }
    mean(pollutant_data_list)
    
    
}