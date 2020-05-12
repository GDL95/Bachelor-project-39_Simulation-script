
MyDataGeneration <- function(samp1, samp2, var, es, condition){
  SDpooled =  sqrt((1^2 + var^2)/2)
  if(condition==1){
  #conditie 1: slightly skewed and kurtotic, unequal asymmetry
  #for (-)0.75 skewness, the normal kurtosis value is (0.75^2)+(1+3)=4.56
  a<-pearsonFitM(0,1, 0.75, 5.31) #positively skewed (0.75), lepto kurtic (0.75)
  b<-pearsonFitM(0+(SDpooled*es),1*var,-0.75, 3.81) #negatively skewed (-0.75), platy kurtic (-0.75) 
  
  group1 <- rpearson(samp1, a) 
  group2 <- rpearson(samp2, b)
  }
  
  #conditie 2: moderately skewed and kurtotic, unequal asymmetry
  #for (-)1.25 skewness, the normal kurtosis value is (1.25^2)+(1+3)=5.56 
  if(condition==2){
  c<-pearsonFitM(0,1,1.25,6.81) #positively skewed (1.25), lepto kurtic (1.25)
  d<-pearsonFitM(0+(SDpooled*es),1*var,-1.25,4.31) #negatively skewed (-1.25), platy kurtic (-1.25) 
  
  group1 <- rpearson(samp1, c) 
  group2 <- rpearson(samp2, d)
  }
  
  #conditie 3: highly skewed and kurtotic, unequal asymmetry
  #for (-)1.75 skewness, the normal kurtosis value is (1.75^2)+(1+3)=7.06
  if(condition==3){
  e<-pearsonFitM(0,1,1.75,8.31) #negatively skewed (1.75), platy kurtic (1.75) 
  f<-pearsonFitM(0+(SDpooled*es),1*var,-1.75,5.81) #negatively skewed (-1.75), platy kurtic (-1.75) 
  
  group1 <- rpearson(samp1, e) 
  group2 <- rpearson(samp2, f)
  }
  
  #conditie 4: extremely skewed and kurtotic, unequal asymmetry
  #for (-)2.25 skewness, the normal kurtosis value is (2.25^2)+(1+3)=9.06 
  if(condition==4){
    e<-pearsonFitM(0,1,2.25,11.31) #negatively skewed (2.25), platy kurtic (2.25) 
    f<-pearsonFitM(0+(SDpooled*es),1*var,-2.25,6.81) #negatively skewed (-2.25), platy kurtic (-2.25) 
    
    group1 <- rpearson(samp1, e) 
    group2 <- rpearson(samp2, f)
  }
  
  #grouping generated data 
  na.pad <- function(x,len){
    x[1:len]
  }
  
  PaddedDataFrame <- function(l,...){
    maxlen <- max(sapply(l,length))
    data.frame(lapply(l,na.pad,len=maxlen),...)
  }
  
  var1 <- c(group1)
  var2 <- c(group2)
  Y <- c(var1, var2)
  group <- as.factor(c(rep(1, samp1), rep(2,samp2)))
  dat <- PaddedDataFrame(list(Y=Y,group=group))
  return(dat)
}