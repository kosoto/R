# ggplot2 패키지에는 미국 동북중부 437개 지역의 
# 인구통계 정보를 담은 midwest 라는 데이터가 
# 들어 있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오
# 1.  poptotal 변수를 total 로, popasian 변수를 
# asian 으로 수정하세요
# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 
# 백분율' 파생변수를만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보시오.
# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large' , 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
midwest$total <- midwest$poptotal
midwest$asian <- midwest$popasian
midwest$asian_per_total <- (midwest$asian / midwest$total)

hist(names.arg=midwest$county,midwest$asian_per_total)
mean(midwest$asian_per_total)
midwest$flag <- ifelse(
  midwest$asian_per_total > mean(midwest$asian_per_total),"large","small")
table(midwest$flag)
qplot(midwest$flag)

# 문제를 전부 푼 후 ...
# 변환된 데이터를 csv 파일로 저장합니다.
# 그러면 변형시킨 데이터를 csv를 통해 다른 프로그램
# 예를들면 엑셀이나 DB에 다시 전달할 수 있습니다.

write.csv(midwest, file = "update_midwest.csv")
