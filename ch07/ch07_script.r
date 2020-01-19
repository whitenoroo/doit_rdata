#---------------------------------------------------------------
#ch07-1

df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,4,NA))
df

is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

mean(df$score)
sum(df$score)

library(dplyr)

df %>%filter(is.na(score))
df %>%filter(is.na(sex))

df %>%filter(!is.na(score))
df %>%filter(!is.na(sex))

df %>%filter((!is.na(sex)) & (!is.na(score)))

na.omit(df)

mean(df$score, na.rm=T)             
sum(df$score, na.rm=T)             

exam <- read.csv("C:/works/works_r/ch06/csv_exam.csv")
head(exam)
table(is.na(exam))

exam[c(3,8,15),"math"] <- NA
table(is.na(exam))

exam %>%summarise(mean_math=mean(math))

exam %>%summarise(mean_math=mean(math, na.rm=T))

exam %>%summarise(mean_math=mean(math, na.rm=T),
                  sum_math=sum(math, na.rm=T),
                  median_math=median(math, na.rm=T))


## 평균값 결측치 대체

mean_math <- mean(exam$math, na.rm=T)

exam$math <- ifelse(is.na(exam$math),55,exam$math)
exam
table(is.an(exam))
mean(exam$math)


# p170

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <- NA

table(is.na(mpg$drv))
table(is.na(mpg$hwy))


mpg %>% filter(!is.na(hwy)) %>%
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) 

#-----------