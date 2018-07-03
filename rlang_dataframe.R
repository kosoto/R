grade <- function(name,kor,eng,math){
  x <- c(kor,eng,math)
  return(list(name=name,
              sum=sum(x),
              mean=round(mean(x),2),
              grade=switch(
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

x <- x+1 <x+2
park <- grade('박지성',90,90,90)
Lee <- grade('이순신',100,100,100)
kim <- grade('김구',80,90,100)
jang <- grade('장보고',80,90,70)
cho <- grade('조조',50,60,70)

# Create the data frame.
emp.data <- data.frame(
  id = c (1:5), 
  name = c(park$name,Lee$name,kim$name,jang$name,cho$name),
  sum = c(park$sum,Lee$sum,kim$sum,jang$sum,cho$sum), 
  mean = c(park$mean,Lee$mean,kim$mean,jang$mean,cho$mean), 
  grade = c(park$grade,Lee$grade,kim$grade,jang$grade,cho$grade), 
  stringsAsFactors = FALSE
)
# Print the data frame.			
print(emp.data) 

print(data.frame(emp.data$name,emp.data$sum))

x <- c(park$sum,Lee$sum,kim$sum,jang$sum,cho$sum)
labels <- c(park$name,Lee$name,kim$name,jang$name,cho$name)
pie(x,labels,col=rainbow(5))
pie(x)

barplot(c(7,12,28,3,41))
















