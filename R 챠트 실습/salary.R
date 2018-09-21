# [1] 데이터 로딩
# http://www.data.go.kr
## -------------------------------------------------------------------------------
var.csv <- "https://www.dropbox.com/s/9gchq4nbt67lpxu/example_salary.csv?dl=1"
var.salary <- read.csv(
  var.csv,
  stringsAsFactors = T,
  na = "-"
)
head(var.salary)
# [2] 구조 파악
colnames(var.salary)  #getter
# [1] "연령"               
# [2] "월급여액..원."      
# [3] "연간특별급여액..원."
# [4] "근로시간..시간."    
# [5] "근로자수..명."      
# [6] "경력구분"           
# [7] "성별" 
colnames(var.salary) <- c(  #setter
  "age","wage","special","workingTime","workerCount","career","gender"
)
colnames(var.salary)
# [3] 검색대상을 data.frame 으로 전환하기
attach(var.salary)

# [4] 전체 임금 평균 구하기
wage.range <- range(wage,na.rm = T) #wage 높이 제한,na.rm 값이 없는것을 제거
wage.range
# [1] 1117605 4064286
highWage <- which(wage==4064286)
# [1] 48 인덱스 값
var.salary[highWage,]  #[행,열] 열이 비었으면 그 행의 모든 값을 리턴
# age    wage  special workingTime
# 48 50-54 4064286 12716896       178.2
# workerCount   career gender
# 48      439450 10년이상     남

# 사분위 구하기
qnt <- quantile(wage,na.rm = T)
qnt
# 0%     25%     50%     75% 
#   1117605 1689658 2120345 2519221 
# 100% 
# 4064286

# 리스트에 담기
wage.list <- list(
  월급평균 = mean(wage,na.rm = T),
  월급중앙값 = median(wage,na.rm = T),
  월급범위 = range(wage,na.rm = T),
  월급사분위 = quantile(wage,na.rm = T)
)
wage.list

wagePerGender <- tapply(
  wage, gender, mean, na.rm=T  #임금을 성별별로 평균내기
)
wagePerGender
# 남      여 
# 2477332 1865823 

t <- reshape2::melt(wagePerGender)
t
ggplot2::ggplot(
  t,
  aes(
    x = Var1,
    y = value,
    fill = Var1
  )
)+geom_bar(
  stat = "identity"
)

wagePerCareer <- tapply(
  wage, career , mean, na.rm=T  #임금을 성별별로 평균내기
)
wagePerCareer
t <- reshape2::melt(wagePerCareer)
ggplot2::ggplot(
  t,
  aes(
    x = Var1,
    y = value,
    group = 1
  )
)+geom_line(
  color = 'blue',
  size = 2
)+coord_polar()+
  ylim(0,max(t$value))
































