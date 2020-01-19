####################################
# project ch03  ch03_1_variable.r
#
a=1
b=2
c="hello world"
a=12
c<-a+b
c
# -------------------
var1 <- seq(1,10, by=2)
var1
c<-20
c
numbofCompanyMember = 100
# -------------------
var1 <- c(1,2,5,7,8)
var2 <- c(1:5)
var3 <- seq(1,5)
var4 <- seq(1,10, by=2)
var5 <- seq(1,10, by=3)
var1+2
var1+var2
var1+var5
var1[1:4]+var5

str1<-"a"
str2<-"text"
str3<-"Hello World!"
str4<-c("a","b","c")
str5<-c("Hello", "World", "is", "good!")
#-------------------------------------------------
var5_max = max(var5)
var5_min = min(var5)
var5_mean = mean(var5)
var5_max * var5_min
var5_max * var5_mean
#-------------------------------------------------
str5
paste(str5,collapse = ",")
paste(str5,collapse = " ")
paste(str1, str2)
paste(str1, str2, collapse=",")

--------------------------------------------------
# package 설치, 사용하기
  
install.packages("ggplot2")
library(ggplot2)
qplot(str4)
qplot(var1)

x<-c("a","a","b","c")
qplot(x)
qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)
qplot(data=mpg, x=drv, y=hwy)
qplot(data=mpg, x=drv, y=hwy, geom="line")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", colour=drv)

#-----------------------------------------------------------
# p77_exercise

x <- c(80,60,70,50,90)
x
mean(x)
y <- c(30,50,70,90,110)
y
mean(y)

#----------------------------------------------------------
# data frame


