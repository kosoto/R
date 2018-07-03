# 정수 계산
calc <- function(num1,opcode,num2){
  return(c(num1,opcode,num2,switch(
    opcode,
    "+" = num1 + num2,
    "-" = num1 - num2,
    "*" = num1 * num2,
    "/" = num1 %/% num2,
    "%" = num1 %% num2
  )))
}
res <- calc(2,"+",3)
cat(res[1],res[2],res[3],"=",res[4])
