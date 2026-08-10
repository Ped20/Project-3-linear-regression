# PROJECT 3: Predicting Plant Height using Linear Regression
# Goal: Building simple and multiple regression models to predict Height

# 1. Load Libraries
library(ggplot2)
library(readxl)

# 2. Read Data
proj1 <- read_excel("C:/Users/prath/OneDrive/Desktop/proj1.xlsx", 
                    col_types = c("text", "numeric", "numeric", 
                                  "numeric", "numeric", "text"))
d<- proj1    #assaining object "d" for the dataset
View(proj1)

# 3. Simple Linear Regression: Length ~ Shoot_Length
lm1 <- lm(L ~ B, data= d) #linear model for L and B
lm2 <- lm(L ~ SL, data= d)  #linear model for L and SL
lm3 <- lm(L ~ RL, data= d)  #linear model for L and RL
s1<- summary(lm1)
s2<- summary(lm2)
s3<- summary(lm3)
print(s1);print(s2);print(s3)

# 4. Multiple Linear Regression: Height ~ Shoot + Root + Width
mlr <- lm(L ~ B+SL+RL, data= d) #mlr object for multiple linear regression
ms<- summary(mlr)               #object created for summary
print(ms)

#5. Regression Line Visualization

pr<- ggplot(d, aes(SL, L))+
  geom_point(colour = "black", size=2)+
  geom_smooth(method = "lm", colour = "red")+
  labs(title = "Regression model for the Two Parameters", 
       x="Shoot Length", y="Length")+
  theme_classic()
print(pr)

ggsave(filename = "Regression_map.png", units = 'in', height = 8, width = 8, dpi=300)

# 6. Model Diagnostics (Residual Check)
png(filename = "Residual_check.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA)

par(mfrow = c(2, 2))
plot(mlr)    
par(mfrow= c(1,1))


dev.off()
