## stmt 를 합치면 function이 된다.
## 4가지가 반드시 있어야한다.  (R 의 Syntax)
grade <- function(name,kor,eng,math){
  x <- c(kor,eng,math)
  return(c(name,sum(x),round(mean(x),2),switch(
    toString(mean(x)%/%10),
    "10" = "A",
    "9" = "A",
    "8" = "B",
    "7" = "C",
    "6" = "D",
    "5" = "E",
    "F"
  )))
}
res <- grade("홍길동",50,90,90)
cat("************************************\n",
    "|  이름   |  총점   |  평균  | 등급  |\n",
"-------------------------------------\n",
"| ",res[1]," | ",res[2]," | ",res[3]," | ",res[4]," |\n",
"************************************")
