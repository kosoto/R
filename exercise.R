help("solve")
2:10
?solve
objects("hello world!!")
a <- "3"
a
b <- 4
b
c <- a+ b
c


a <- c(1,2,3,4)
a
a <- c(1,"2",3,"4")
a
x <-c(1,2,3,4,5)
my_sum <-sum(x)
my_sum
my_mean <-mean(x)
my_mean
my_lenght <- length(x)
my_lenght
sum((x-mean(x))^2)/(length(x)-1)
sum((x-mean(x))^2)/(length(x)-1)
sum(1:100)
?sum
?seq
x <- seq(length=10,from = 1, by =1)
sum(seq(length=100,from = 1, by =1))
?sample
sample(c(0,2,5),1,replace = TRUE)
my <- 5
com <-sample(c(0,2,5),1,replace = TRUE)
com
# if - else
if((my-com) %in% c(-3,-2,5)) print("승리") else
  if((my-com) %in% c(2,3,-5)) print("패배") else 
    print("비김")

# swich 
my <- 5
com <-sample(c(0,2,5),1,replace = TRUE)
cat("컴퓨터 :",com)
res <- tostring(my-com)
cat("결과 :",res)
x<-switch(
  res,
  '-3','-2','5' = {"승리"},
  '2','3','-5' = {"패배"},
  '0' = {"비김"}
)
print(x)

my <- 5
print(
  switch(
  toString(my-sample(c(0,2,5),1,replace = TRUE)),
  '-3'= {"승리"},
  '-2'= {"승리"},
  '5' = {"승리"},
  '2' = {"패배"},
  '3' = {"패배"},
  '-5' = {"패배"},
  '0' = {"비김"}
)
)
# BMI
h <- 180
w <- 70
if ((bmi <- w/((h/100)^2)) < 18.5) result = "저체중" else 
  if (bmi < 23) result = "정상" else 
    if (bmi < 25) result = "비만 전단계" else 
      if (bmi < 30) result = "1단계 비만" else 
        if (bmi < 35) result = "2단계 비만" else 
          result = "3단계 비만"
print(result)

print(c(1:10))
print(seq(from=1,length=10,by=2))
print(seq(1,10,2))
print(rep(1:5))
print(rep(1:5,each=2))
print(rep(1:5,times=2))
print(rep(1:5,each=2,times=3))
print(rep(1:5,times=3,each=2))
print (rep(1:5,times=3,each=2,len=5))
print (rep(1:5,each=2,times=3,len=5))

# 기본타입 : character, wide character, integer, floating point,
# double floating point, Boolean etc.
# R-objects : vector, List, Matrix, Array, factor, Data Frame
# Vector 의 6개 타입
# Logical(T,F), Numeric(실수), Integer(정수)
# Complex (허수), Character(문자열), Raw(주소값)

# Calculator
x <- 15
opcode <- "+"
y <- 20
print(
switch(
  opcode,
  "+" = x + y,
  "-" = x - y,
  "*" = x * y,
  "/" = x %/% y,
  "%" = x %% y
))

x <- 15
opcode <- "*"
y <- 20
cat(x,opcode,y,"=",(switch(
  opcode,
  "+" = x + y,
  "-" = x - y,
  "*" = x * y,
  "/" = x %/% y,
  "%" = x %% y
)))

# 1+2+3+...+5=15 출력
a<-c(1:5)
for(i in a){
  if(i==length(a)){
    cat(i,"=",sum(a))
  }else{cat(i,"+")}
}

# 1-2+3-4+...-100 = -50 출력

for(i in 1:100){
  if(i == 100)
    cat(i,"= ",sum(seq(from=1,to=99,by=2))-sum(seq(from=2,to=100,by=2)))
  else if(i %% 2 == 0)
    cat(i,"+ ")
  else 
    cat(i,"- ")
}

# Grade Report
name <- "홍길동"
kor <- 89
math <-90
eng <-90
cat("이름 : ",name,"총점 : ",(kor+math+eng),
    "평균 : ",round(((kor+math+eng)/3),2),
    "학점 : ",(switch(
                  toString((kor+math+eng)%/%30),
                  "10" = "A",
                  "9" = "A",
                  "8" = "B",
                  "7" = "C",
                  "6" = "D",
                  "5" = "E",
                  "F"
                )
             )
)












