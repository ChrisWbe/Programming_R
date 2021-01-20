complete = function(directory, id=1:332){
    char_id = sprintf(sprintf("%03d",id))
    archives = paste(directory,"/",char_id,".csv",sep = "")
    print(archives)
    
    p_id = vector()
    p_bouns = vector()

    for(i in 1:length(id)){
        data = as.data.frame(read.csv(archives[i]))
        pollutant_data = data[["sulfate"]]
        pollutant_data = pollutant_data[!is.na(pollutant_data)]
        p_id[i] = id[i]
        p_bouns[i] = length(pollutant_data)
    }
    df = data.frame(id=p_id, nobs=p_bouns)
    df
    
    
    
    
}