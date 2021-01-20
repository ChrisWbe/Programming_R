corr = function(directory, threshold=0){
    id=1:332
    char_id = sprintf(sprintf("%03d",id))
    archives = paste(directory,"/",char_id,".csv",sep = "")
    
    p_nitrate = vector()
    p_sulfate = vector()

    
    for(i in 1:332){
        #print(archives[i])
        data = as.data.frame(read.csv(archives[i]))
        pollutan_data = data[,c('sulfate','nitrate')]
        bad= !is.na(pollutan_data)
        bad = bad[,'sulfate'] & bad[,'nitrate']
        #print(bad)
        p_nitrate = append(p_nitrate,data[bad,c('nitrate')])
        p_sulfate = append(p_sulfate,data[bad,c('sulfate')])
    }
    df = data.frame(nitrate=p_nitrate,sulfate=p_sulfate)
    cor(df[,'sulfate'],df[,'nitrate'])
    
}