#-----------------------
# ch04

english <- c(90,80,60,70)
math <- c(50,60,100,20)
english
math

df_midterm <- data.frame(english,math)
df_midterm

class <- c(1,1,2,2)
df_midterm <- data.frame(english,math,class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
                         
df_midterm

#--------------------------------------------------
# p88_exercise

fruit <- c("apple","strawberry", "watermelon")
price <- c(1800,1500,3000)
sales <- c(24,38,13)
df_fruit <- data.frame(fruit,price,sales )
df_fruit
mean(df_fruit$price)
mean(df_fruit$sales)

#---------------------------------------------------
# excel package 설치

install.packages("readxl")
library(readxl)

#---------------------------------------------------
# excel 파일 읽기

df_excel <- read_excel("excel_exam.xlsx")
df_excel

df_excel <- read_excel("./excel_exam.xlsx") # 현 폴더와 저장 폴더가 동일한 경우
df_excel
df_excel <- read_excel("c:/works/cho4/excel_exam.xlsx")
df_excel

df_excel_mean_math <- mean(df_excel$math)
df_excel_mean_math
df_excel_mean_english <- mean(df_excel$english)
df_excel_mean_english
df_excel_mean_science <- mean(df_excel$science)
df_excel_mean_science

#------------------------------------------------
# excel head가 없는 경우

df_excel_novar <- read_excel("./excel_exam_novar.xlsx")
df_excel_novar

df_excel_novar <- read_excel("./excel_exam_novar.xlsx", col_names=F)
df_excel_novar

#-------------------------------------------------
# excel sheet

df_excel_sheet <- read_excel("./excel_exam_sheet.xlsx", sheet=3)
df_excel_sheet

#---------------------------------------------------
# CSV
# csv_exam.csv

df_csv_exam <- read.csv("./csv_exam.csv")
df_csv_exam

# CSV - 숫자가 아닌 문자가 들어있는 파일 읽을 경우
df_csv_exam <- read.csv("./csv_exam.csv", stringAsFactors=F)
df_csv_exam

#---------------------------------------------------
# csv 파일 저장

df_midterm
write.csv(df_midterm,file="df_midterm.csv")
df_midterm_csv <- read.csv("df_midterm.csv")
df_midterm_csv


#----------------------------------------------------
# RData

save(df_midterm, file="df_midterm.rda")
rm(df_midterm)
df_midterm # error
load("df_midterm.rda")
df_midterm

#--------------------------------------------------
# p98 exercise

english <- c(90,80,60,70)
math <- c(50,60,100,20)
data.frame(english, math)

library(readxl)
df_exam <- read_excel("excel_exam.xlsx")
df_exam

df_csv_exam <- read.csv("excel_exam.csv")
df_csv_exam

df_midterm_csv <- write.csv(df_midterm, file="df_midterm.csv")
df_midterm_csv
write.csv(df_midterm, file="df_midterm.csv")
read.csv("df_midterm.csv")

load("df_midterm.rda")
save(df_midterm, file="df_midterm.rda")






