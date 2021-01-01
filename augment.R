library(dplyr)
library(broom)
library(datasets)
library(ggplot2)

df<- data.frame(iris)

fitlm <- lm(Sepal.Length ~ Petal.Length, data=df)

summary(fitlm)

tidy(fitlm)

fittab <- augment(fitlm)

temp <- ggplot(fittab, aes(x=.fitted, y=.resid))+geom_point()#+geom_hline(yintercept = mean(fittab$.resid))

temp+theme_bw()+xlab("Fitted Value")+ylab("Residual")+geom_smooth(method="lm")

species.2 <- df %>% 
    filter(Species == c("setosa", "versicolor")) %>% 
    mutate(new.species = ifelse(Species == "setosa", 1, 0))

ggplot(species.2, aes(x=Sepal.Width, y=new.species))+
    geom_point()+
    geom_smooth(method = "glm",method.args= list(family="binomial"), se=FALSE)+
    geom_line(data=aug_bi, aes(y=.fitted), color="Red", se=FALSE)+
    theme_bw()

bi_log <- glm(new.species ~ Sepal.Width, data=species.2, family=binomial)


#Without type.predict the .fitted values are log(odds) which are not useful to us.
aug_bi <- augment(bi_log, type.predict = "response")

new_width <- data.frame(Sepal.Width = c(2.6,3.7,4.5,3.22,3,2.4,3.9))

prediction <- augment(bi_log, newdata=new_width, type.predict = "response")
prediction$species_hat <- NA

for (i in c(1:length(prediction$.fitted))){
    if(prediction$.fitted[i] >=.75){
        print("Setosa")
        prediction$species_hat[i] = "Setosa"
    }else{
        print("Vericolor")
        prediction$species_hat[i] = "Vericolor"
    }
}


    
}

aug_temp <- aug_bi %>% mutate(species.hat = round(.fitted))

mod<-aug_temp %>%select(new.species, species.hat) %>% table()

mod.df <- data.frame(mod)

confusionMatrix(aug_temp$species.hat, aug_temp$new.species)


library(plotly)

lm(Petal.Width ~ Sepal.Length + Sepal.Width, data=df)

plot_ly(data = df, z = ~Petal.Width, x = ~Sepal.Length, y = ~Sepal.Width, opacity = 0.6) %>%
    add_markers(color=~Species) 

p %>% add_surface(x = ~x, y = ~y, z = ~plane, showscale = FALSE) 












