if("rJava" %in% installed.packages("rJava") == FALSE)install.packages("rJava")
library(rJava)
if("KoNLP" %in% installed.packages("KoNLP") == FALSE)install.packages("KoNLP")
library(KoNLP)
if("tm" %in% installed.packages("tm") == FALSE)install.packages("tm")
library(tm)
if("wordcloud" %in% installed.packages("wordcloud") == FALSE)install.packages("wordcloud")
library(wordcloud)

target <- readLines("https://www.dropbox.com/s/ehabdjfue4m2lmr/seoul_new.txt?dl=1")  #비정형 데이터, 리스트 구조
target
useSejongDic() ## 세종 사전에 있는것만 가져온다.
target <- gsub("\\d+|O+","",target)   ##문장에서 숫자들을 제외.
target <- sapply(target, extractNoun,USE.NAMES = F) ##use.name =F , 컬럼명을 사용하지 않는다.
target
target <- unlist(target)
class(target)
target <- Filter(function (x){!nchar(x)==1},target)
head(sort(target,decreasing = T),20)
target

#sequence
seq <- c(1:10)

#print loop
for(i in seq){
  print(i)
}

# A sum variable
sum <- 0

# Sum loop
for(i in seq){
  sum <- seq[i] + sum
  print(sum)
}
###############
getwd()
killer <- readline("C:\\Users\\1027\\Documents\\killer.txt")
killer <- unlist(killer)
killer
for(i in 1:length(killer)){
  target <- gsub(killer[i],"",target)
}
target
target <- unlist(target)
target <- Filter(function(x){!ncahr})
#############
target <- readLines("https://www.dropbox.com/s/ehabdjfue4m2lmr/seoul_new.txt?dl=1")
target
useSejongDic()
# target <- gsub("\\W+","",target)
target <- gsub("\\d+|O+","",target)
target <- sapply(target, extractNoun, USE.NAMES = F)
target
target<-unlist(target)
class(target)
target <- Filter(function(x){!nchar(x) == 1},target)
head(sort(target,decreasing=T),20)
target


getwd()
killer <- readLines("C:\\Users\\1027\\Documents\\killer.txt")
killer
for(i in 1:length(killer)){
  target <- gsub(killer[i],"",target)
}
target
target<-unlist(target)
target <- Filter(function(x){!nchar(x) == 0},target)

write(unlist(target),"seoul__new__result.txt")
target <- read.table("C:\\Users\\1027\\Documents\\seoul__new__result.txt")
target <- table(target)
target
pal <- brewer.pal(8,"Dark2")
## wordcloud:: 는 package
wordcloud::wordcloud(
  names(target),
  freq = target,
  min.freq = 1,
  max.words = 200,
  random.order = F,
  rot.per = .1,
  scale = c(4,0.3),
  color = pal
)






