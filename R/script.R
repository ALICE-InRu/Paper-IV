library('ggplot2')

dat <- read.csv('ratioRun.csv')
dat$trainingdata=factor(dat$trainingdata,levels=c('j.rnd','j.rndn','f.rnd','f.rndn','f.jc'))
levels(dat$obj)=c('ES_Cmax','ES_rho')
dat$shop=substr(dat$trainingdata,1,1)

p=ggplot(dat,aes(y=fitness,x=generation,linetype=trainingdata))+geom_line()+facet_wrap(~obj,ncol=1,scales='free')+
  ylab('Fitness value')+
  xlab('Generation')
p=p+scale_linetype_discrete('Problem\nspace')+theme_bw()
p = p + theme(legend.position="bottom")    
p
ggsave(p,filename='../fig/CMAfitnessEvo.eps',height=8,width=4,unit='in')

p=ggplot(dat,aes(y=log(fitness),x=generation,linetype=trainingdata))+geom_line()+facet_wrap(~obj,ncol=1,scales='free')+
  ylab('Log of the fitness value')+
  xlab('Generation')
p=p+scale_linetype_discrete('Problem\nspace')+theme_bw()
p = p + theme(legend.position="bottom")    
p
ggsave(p,filename='../fig/CMAfitnessLogEvo.eps',height=8,width=4,unit='in')

dat <- read.csv('ratioTest.csv')
dat$trainingdata=factor(dat$trainingdata,levels=c('j.rnd','j.rndn','f.rnd','f.rndn','f.jc'))
levels(dat$obj)=c('ES_Cmax','ES_rho')
stat=ddply(dat,~trainingdata+obj,summarise,mu.rho=round(mean(rho),digit=3),mu.Cmax=round(mean(C_max),digit=3))


dat <- read.csv('ratioTrain.csv')
dat$trainingdata=factor(dat$trainingdata,levels=c('j.rnd','j.rndn','f.rnd','f.rndn','f.jc'))
levels(dat$obj)=c('ES_Cmax','ES_rho')
stat=ddply(dat,~trainingdata+obj,summarise,mu.rho=round(mean(rho),digit=3),mu.Cmax=round(mean(C_max),digit=3))
p=ggplot(dat, aes(x=trainingdata, y=rho, fill=obj))+geom_boxplot()
p=p+xlab('')+ylab('Percentage relative deviation from optimality, rho (%)')+theme_bw()+  scale_fill_grey('Objective function')
p = p +theme(legend.position="bottom")  
p
ggsave(p,file='../fig/CMAboxplotEvoTrain.eps',height=5,width=4,unit='in')

dat <- read.csv('weightRun.csv')
dat$trainingdata=factor(dat$trainingdata,levels=c('j.rnd','j.rndn','f.rnd','f.rndn','f.jc'))
levels(dat$obj)=c('ES_Cmax','ES_rho')
dat$feature <- as.factor(dat$feature)
summary(dat)
for(o in unique(dat$obj)){
  p = ggplot(subset(dat,obj==o),aes(x=generation,y=weight,linetype=feature,colour=feature,linetype=feature))+geom_line()
  p = p + facet_grid(obj~trainingdata, scale='free') + theme_bw()
  p = p + scale_colour_hue(guide = guide_legend(), l=10, c=30) 
  p = p + theme(legend.position="bottom")    
  ggsave(p,file=paste('../fig/CMAweightsEvo',o,'eps',sep='.'),height=7,width=10,unit='in')
}

levels(dat$feature)=paste('phi',c('proc','startTime','endTime','macFree','makespan','wrmJob','wrmMWR','slots','slotsTotal','slotsTotalPerOp','wait','slotCreated','totProc'),sep='.')
mdat=dcast(dat,trainingdata+obj+generation~feature,value.var = 'weight')
mdat=ddply(mdat,~trainingdata+obj,'mutate',maxGen=max(generation))
mdat=subset(mdat,generation==maxGen)
mdat$maxGen=NULL;
write.csv(mdat,'weightFinal.csv',row.names=F,quote=F)
