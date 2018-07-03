bmi <- function(name,height,weight){
  bmi <- (weight / (height/100)^2)
  return(c(name,height,weight,(
    if(bmi < 18.5) "저체중" else 
      if(bmi<23) "정상" else 
        if(bmi<25) "비만 전단계" else 
          if(bmi<30) "1단계 비만" else 
            if(bmi<35) "2단계 비만" else 
              "3단계 비만"
    )))
}
res <- bmi("홍길동",180,90)
cat("이름 : ",res[1],"키 : ",res[2],"몸무게 : ",res[3],
    "결과 : ",res[4])
