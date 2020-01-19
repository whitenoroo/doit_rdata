# ch05 -----------------------

df_csv_exam <- read.csv("C:/works/cho4/csv_exam.csv")
df_csv_exam
head(df_csv_exam)
tail(df_csv_exam)
dim(df_csv_exam)
summary(df_csv_exam)
str(df_csv_exam)
View(df_csv_exam)

install.packages("ggplot2")
library(ggplot2)
head(mpg)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)

#----------------------------------------------------
# 변수명 바꾸기

rvar1=c(1,2,1)
rvar2=c(2,3,2)
df_raw <-data.frame(rvar1,rvar2)

# rename df's column name

install.packages("dplyr")
library(dplyr)

df_new <- df_raw
df_new <- rename(df_new, v2=rvar2)
df_raw
df_new


head(mpg)
mpg_new <- rename(mpg, highway=hwy)
head(mpg_new)

#--------------------------------------------------------
# 파생변수 만들기

var1 <- c(4,3,8)
var2 <- c(2,6,1)
df <- data.frame(var1, var2)
df
df_new <- df
df_new

df_new$var_sum <- df_new$var1 + df_new$var2
df_new

df_new$var_mean <- (df_new$var1 + df_new$var2)/2
df_new

mpg$total <- (mpg$cty +mpg$hwy)/2
head(mpg)
mean(mpg$total)

mpg_new$total <- (mpg_new$cty +mpg_new$highway)/2
head(mpg_new)
mean(mpg_new$total)
summary(mpg_new$total)

hist(mpg_new$total)


#--------------------------------------------------------
# 조건문을 이용한 파생변수 만들기

mpg_new$test <- ifelse(mpg_new$total>=20,"pass","fail")
head(mpg_new,10)
table(mpg_new$test)
View(mpg_new)
library(ggplot2)
qplot(mpg_new$test)

mpg_new$grade <- ifelse(mpg_new$total>=30,"A",
                        ifelse(mpg_new$total>=20,"B","C"))
head(mpg_new)
str(mpg_new)
View(mpg_new)
table(mpg_new$grade)
qplot(mpg_new$grade)


#--------------------------------------------------------
# p123 - ggplot2 : midwest

head(midwest)
midwest_new <- as.data.frame(midwest)
head(midwest_new)
View(midwest_new)
dim(midwest_new)
str(midwest_new)

library(dplyr)

midwest_new <- rename(midwest_new, total=poptotal, asian=popasian)
head(midwest_new)
View(midwest_new)

midwest_new$asian_ratio <- (midwest_new$asian / midwest_new$total)*100
head(midwest_new)
View(midwest_new)
hist(midwest_new$asian_ratio)

asian_ratio_mean <- mean(midwest_new$asian_ratio)

midwest_new$asian_size <- ifelse(midwest_new$asian_ratio>=asian_ratio_mean,"large","small")
table(midwest_new$asian_size)
qplot(midwest_new$asian_size)












