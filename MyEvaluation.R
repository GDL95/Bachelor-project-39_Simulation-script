#Evaluation Criterion:

MyEvaluation <- function(MyAnalysisResult, es){
  if (es == 0){
    if (MyAnalysisResult < 0.05 ){
      res = 1
    }
    else{
      res = 0
    }
  }
  else{
    if (MyAnalysisResult > 0.05 ){
      res = 1
    }
    else{
      res = 0
    }
  }
  return(res)
}