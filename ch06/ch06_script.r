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


# ch06-5 : mutate --------------------------------------------------------------

exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% 
  head

exam %>% 
  mutate(test=ifelse(science>=60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3,
         test=ifelse(mean>=60, "pass", "fail")) %>% 
  head


exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3,
         test=ifelse(mean>=60, "pass", "fail")) %>%
  arrange(desc(total)) %>% 
  head


# ch06-6 : group_by, summarise ----------------------------------

exam %>% summarise(mean(math))
exam %>% summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math=sum(math),
            median_math=median(math),
            sd_math=sd(math),
            n=n())

mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head()

mpg %>%
  group_by(manufacturer) %>%
  filter(class=="suv") %>%
  mutate(tot=(cty+hwy)/2) %>%
  summarise(mean_tot=mean(tot)) %>%
  arrange(desc(mean_tot)) %>%
  head(5)


# p144 ---------------------------------------

mpg_new <- mpg
head(mpg_new)
mpg_new %>% mutate(fuelcost = cty+hwy) 
mpg_new %>% mutate(mean_cost = (cty+hwy)/2) 

mpg_new %>%
  mutate(mean_cost = (cty+hwy)/2) %>% 
  arrange(desc(mean_cost)) %>%
  head(3)

mpg_new %>%
  mutate(fuelcost=cty+hwy,
         mean_cost = fuelcost/2) %>% 
  arrange(desc(mean_cost)) %>%
  head(3)


# p150 ------------------------

mpg <- as.data.frame(ggplot2 ::mpg)
mpg %>%
  group_by(class) %>%
  summarise(mean_cty=mean(cty)) %>%
  arrange(desc(mean_cty))

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy=mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

mpg %>%
  filter(class=="compact") %>%
  group_by(manufacturer) %>%
  summarise(count=n()) %>%
  arrange(desc(count))
