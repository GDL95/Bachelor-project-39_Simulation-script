#Preparation of the analysis

### factors of the design:
samp1 <- c(10, 15, 30)
nr <- c(1, 2) # multiplier 
samp2 <- c(samp1[1]*nr[1:2], samp1[2]*nr[1:2])  
var <- c(1, 2) # variance
es <- c(0, 0.2, 0.5, 0.8) # effectsize
condition <- c(1,2,3,4)


Design <- expand.grid(samp1=samp1, samp2=samp2, var=var, es=es, condition=condition) 
Design <- Design[c(1, 4, 8, 11:13, 16, 20, 23:25, 28, 32, 35:37, 40, 44, 47:49, 52, 56, 59:61, 64, 68, 71:73, 76, 80, 83:85, 88, 92, 95:97, 100, 104, 107:109, 112, 116, 119:121, 124, 128, 131:133, 136, 140, 143:145, 148, 152, 155, 156:157, 160, 164, 167:169, 172, 176, 179:181, 184, 188, 191:193, 196, 200, 203:205, 208, 212, 215:217, 220, 224, 227:229, 232, 236, 239:241, 244, 248, 251:253, 256, 260, 263:265, 268, 272, 275:277, 280, 284, 287:289, 292, 296, 299:301, 304, 308, 311:313, 316, 320, 323:325, 328, 332, 335:337, 340, 344, 347:349, 352, 356, 359:361, 364, 368, 371:373, 376, 380, 383:384),]

##remove hashtag to install necessary packages
#install.packages(c('PearsonDS', 'gsl', 'GFD', 'haven', 'dplyr'))

library(PearsonDS)
library(gsl)
library(GFD)
library(stats)
library(haven)
library(dplyr)

source('#file location MyDataGeneration.R')
source('#file location Method_new.R')
source('#file location Method_old.R')
source('#file location MyEvaluation.R')
