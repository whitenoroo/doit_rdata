# -------------------------------------
# ch06 - 조건에 맞는 데이터 추출하기

library(dplyr)
getwd()
exam <- read.csv("csv_exam.csv")
head(exam)
str(exam)

exam %>% filter (class==1)
View(exam)
exam %>% filter (class==1 | class==2)
exam %>% filter (class>3)
exam %>% filter (class!=1)
exam %>% filter (class<3)
exam %>% filter (class<2 & math>=50)
exam %>% filter (math<60 & english>80)
exam %>% filter (math<60 & english>80 & class==2)
exam %>% filter ((math<60 | english>80) & class==2)

exam %>% filter (class %in% c(1,3,5))

class1 <- exam %>% filter (class %in% c(1))
class2 <- exam %>% filter (class %in% c(2))
mean(class1$math)
mean(class2$math)


# --- p133 exercise

library(ggplot2)
head(mpg)
str(mpg)

# Q1
mpg_a <- mpg %>% filter(displ<=4)
mpg_b <- mpg %>% filter(displ>=5)
mean(mpg_a$hwy)
mean(mpg_b$hwy)

# Q2
mpg_audi <- mpg %>% filter(manufacturer=="audi")
mpg_toyota <- mpg %>% filter(manufacturer=="toyota")
mean(mpg_audi$cty)
mean(mpg_toyota$cty)

#Q3
mpg_manufacturer <- mpg %>% filter(manufacturer=="chevrolet" | manufacturer=="ford" | manufacturer=="honda")
mean(mpg_manufacturer$hwy)

mpg_manufacturer <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_manufacturer$hwy)


# ch06-3 (P134)------------------------------------------------------------

head(exam)
str(exam)

head(exam %>% select(class, math,english))
head(exam %>% select(-math))
head(exam %>% select(-math, -english))

head(exam %>% filter(class==1) %>% select(english))
exam_class1_eng <- exam %>% filter(class==1) %>% select(english)
mean(exam_class1_eng$english)

exam %>% 
  filter(class==1) %>% 
  select(english) %>% 
  head(5)


# ch06-4 ----------------------------

exam %>% 
  select(id, math) %>% 
  head(10) %>% 
  arrange(math)

exam %>% 
  select(id, math) %>% 
  head(10) %>% 
  arrange(desc(math)) %>% 
  head(3)

exam %>% arrange(class, math)

exam %>% 
  arrange(desc(math), desc(english), class)

exam %>% 
  arrange(class, desc(math), desc(english))


# p138

# Q1

mpg_class.cty <- mpg %>% select(class, cty)
head(mpg_class.cty)

# Q2

table(mpg_class.cty$class)

mpg_suv <- mpg_class.cty %>% filter(class=="suv")
mpg_compact <- mpg_class.cty %>% filter(class=="compact")
mean(mpg_suv$cty)
mean(mpg_compact$cty)


# P141, Q1

mpg %>% 
  filter(manufacturer=="audi") %>%
  arrange(desc(hwy)) %>% 
  head(5)

# -----------



