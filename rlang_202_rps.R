rps <- function(my){
  com <- sample(c(0,2,5),1,replace = TRUE)
  ref <- my - com
    return(c(my,com,(
    if(ref %in% c(-3,-2,5)) "승리"else 
      if(ref %in% c(-5,2,3))"패배" else "비김")))
}
rps(2)
res <- rps(0)
cat("나 : ",res[1],"com : ",res[2],"결과 : ",res[3])

