mtx <- matrix(c(1:25),nrow=5,ncol=5,byrow=TRUE)
print(mtx)
mtx2 <- matrix(c(1:25),nrow=5,ncol=5,byrow=FALSE)
print(mtx2)
mtx3 <- matrix(c(1:25),nrow=5,ncol=5)
print(mtx3)

##
x <- c(1,2)
cat(x)
x <- append(x,3)
cat(x)
##
n <- 1
  for(i in 1:8){
    n <- n*2
  }
cat(n)
##
x=c()
x[1]=1
cat(x)
for(i in 2:5){
  x[i]=i
}
cat(x)

x=c(1,2,3,4,5)
y=c(10,9,8,7,6)
z <- append(x,y)
cat(x,"\n",y)

## 왼쪽 삼각형
left <- matrix(c(1,0,0,0,0),nrow=1,ncol=5,byrow=TRUE)
row2 <- c(2,3,0,0,0)
left <- rbind(left,row2)
row3 <- c(4,5,6,0,0)
left <- rbind(left,row3)
row4 <- c(7,8,9,10,0)
left <- rbind(left,row4)
row5 <- c(11:15)
left <- rbind(left,row5)
print(left)

left <- matrix(nrow=5,ncol=5,byrow=TRUE)
count <- 0
for(i in 1:5){
  for(j in 1:i){
    left[i,j] <- count <- count +1
  }
}
print(left)

## 지그재그
zigzag <- matrix(c(1:5),nrow=1,ncol=5,byrow=TRUE)
row2 <- c(10:6)
zigzag <- rbind(zigzag,row2)
row3 <- c(11:15)
zigzag <- rbind(zigzag,row3)
row4 <- c(20:16)
zigzag <- rbind(zigzag,row4)
row5 <- c(21:25)
zigzag <- rbind(zigzag,row5)
print(zigzag)

zigzag <- matrix(nrow=5,ncol=5,byrow=TRUE)
count <- 0
for (i in 1:5) {
  if (i %% 2 == 1) {
    for (j in 1:5) {
      zigzag[i,j] <- count <- count +1
    }
  } else {
    for (j in 5:1) {
      zigzag[i,j] <- count <- count +1
    }
  }
}
print(zigzag)

## 다이아몬드
diamond <- matrix(nrow=5,ncol=5,byrow=TRUE)
count <- 0
for(i in 1:5){
  if(i <= 3){
    for(j in (4-i):(2+i)){
            diamond[i,j] <- count <- count +1
    }
  }else{
    for(j in (i-2):(8-i)){
      diamond[i,j] <- count <- count +1
    }
  }
}
print(diamond)

## 매트릭스 함수
mtx_select <-function(choice){
  mtx <- matrix(nrow=5,ncol=5,byrow=TRUE)
  count <- 0
  switch(
    toString(choice),
    "1" = (for(i in 1:5){
      for(j in 1:i){
        mtx[i,j] <- count <- count +1
      }
    }),
    "2" = (for (i in 1:5) {
      if (i %% 2 == 1) {
        for (j in 1:5) {
          mtx[i,j] <- count <- count +1
        }
      } else {
        for (j in 5:1) {
          mtx[i,j] <- count <- count +1
        }
      }
    }),
    "3" = (for(i in 1:5){
      if(i <= 3){
        for(j in (4-i):(2+i)){
          mtx[i,j] <- count <- count +1
        }
      }else{
        for(j in (i-2):(8-i)){
          mtx[i,j] <- count <- count +1
        }
      }
    })
  )
  return(mtx)  
}
## 1.왼쪽 삼각형, 2.지그재그 3.다이아몬드
mtx_select(1)
mtx_select(2)
mtx_select(3)


## snail
snail <- matrix(nrow=5,ncol=5,byrow=TRUE)
count <- 0
rotation <- 5
sign <- 1
row <-1
column <- 0
for(k in 1:5){
  for(j in 1:rotation){
    column <- column +sign
    snail[row,column] <- count <- count + 1
    
  }
  rotation <- rotation - 1
  for(i in 1:rotation){
    row <- row +sign
    snail[row,column] <- count <- count + 1
  }
  sign <- sign *(-1)
}
snail 



























