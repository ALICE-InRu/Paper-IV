setwd('C:/Users/helga/PhD/Code/Branch/LocalFeatures/wip/')

for(distr in c('j.rnd','j.rndn','f.rnd','f.rndn','f.jc')){
  for(dim in c('6x5','10x10')){
    for(set in c('train','test'))
    {  
      fname=paste(distr,dim,set,'model',distr,'OPT.diff.b.LIBLINEAR.csv',sep='.')
      if(file.exists(fname))
      {
        d <- read.csv(fname,header=TRUE)    
        if(dim=='6x5')
        {
          info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$Rho),median(d$Rho),sd(d$Rho),min(d$Rho),max(d$Rho)); 
        } else {
          info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$ResultingPrefMakespan),median(d$ResultingPrefMakespan),sd(d$ResultingPrefMakespan),min(d$ResultingPrefMakespan),max(d$ResultingPrefMakespan))
        }
        print(paste(info,paste('PREF',distr,dim,set),sep='  %'))  
      }
    }
  }
}

for(dim in c('6x5','10x10'))
{
  if(dim == '6x5')  { 
    dat <- read.csv('../../../matlab/CMA-ES/sol/ratioTrain.csv'); set='train'     
  } else {
    dat <- read.csv('../../../matlab/CMA-ES/sol/ratioTest.csv'); set='test'  
  }
  

  for(o in unique(dat$obj))
  {  
  for( distr in unique(dat$trainingdata)){
    d<-subset(dat,trainingdata==distr & obj==o)
    if(dim == '6x5')  { 
      info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$rho),median(d$rho),sd(d$rho),min(d$rho),max(d$rho)); 
    } else {
      info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$C_max),median(d$C_max),sd(d$C_max),min(d$C_max),max(d$C_max)); 
    }
    print(paste(info,paste('CMA-ES',o,distr,dim,set),sep='  %'))      
  }
  }
}

for(distr in c('j.rnd','j.rndn','f.rnd','f.rndn','f.jc')){

  for(sdr in c('MWR','LWR','LPT','SPT')){  
    dat <- read.csv(paste('../SDR/',distr,'.',sdr,'.csv',sep=''))
  d<-subset(dat,Set=='Train' & NumJobs==6 & SDR==sdr)
  info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$Rho),median(d$Rho),sd(d$Rho),min(d$Rho),max(d$Rho)); 
  print(paste(info,paste(sdr,distr,'6x5','train'),sep='  %'))      
}  
  for(sdr in c('MWR','LWR','LPT','SPT')){  
    dat <- read.csv(paste('../SDR/',distr,'.',sdr,'.csv',sep=''))
  d<-subset(dat,Set=='Test' & NumJobs==10 & SDR==sdr)
  info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$Makespan),median(d$Makespan),sd(d$Makespan),min(d$Makespan),max(d$Makespan)); 
  print(paste(info,paste(sdr,distr,'10x10','test'),sep='  %'))        
}
}



dat <- read.csv(file='C:/Users/helga/Dropbox/jsp/studyGlobal/ratioGlobal_k1/ratio.csv',header=TRUE)
for ( size in unique(dat$dim))  {
  print(size)
  for ( distr in unique(dat$data)) {
    d <- subset(dat, data==distr & dim==size)    
    if(size=='10x10'){
      info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$makespan),median(d$makespan),sd(d$makespan),min(d$makespan),max(d$makespan));       
      print(paste(info,paste('PREF',distr,size,'test'),sep='  %'))            
    }   else {
      info=sprintf('%.2f & %2.f & %2.f & %2.f & %2.f ',mean(d$rho),median(d$rho),sd(d$rho),min(d$rho),max(d$rho)); 
      print(paste(info,paste('PREF',distr,size,'train'),sep='  %'))            
    }
  }  
}


