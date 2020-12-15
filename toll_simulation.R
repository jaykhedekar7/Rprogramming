library(dplyr)
library(ggplot2)
library(tidyr)
library(readr)
library(zoo)
library(gganimate)

vehicle.type <- c("Car", "Truck", "Multi-axle")

vehicle.in <- c("NA")
wait.time <- c()
wait<-0
simulation <- 1000

#sample(vehicle.type, 1,prob = c(0.5, 0.5, 0.3))

for (i in 1:simulation) {
    vehicle.in[i] <- sample(vehicle.type, 1, replace=TRUE, prob = c(0.7,0.5,0.3))
    if(vehicle.in[i] == "Car"){
        wait <- 20
        wait.time[i]<-wait
    }
    else if(vehicle.in[i] == "Truck"){
        wait<- 35
        wait.time[i]<- wait
    }
    else{
        wait <- 50
        wait.time[i] <- wait
    }
}

data.1 <- data.frame(vehicle.in, wait.time)

data.2 <- data.1 %>% mutate(cum_wait.time = cumsum(wait.time))


data.2 <- data.2 %>% mutate(x.index = c(1:1000))

data.2 <- data.2 %>% mutate(main.cumsum = rollsumr(wait.time, k = 6, fill = NA))

ggplot(data.2[1:500,], aes(x=x.index, y=(main.cumsum)))+
    geom_line()+
    theme_bw()

data.2 <- data.2 %>% mutate(roll_avg = rollmean(main.cumsum, k = 6, fill = NA, align="right"))

mean.roll = mean(data.2$main.cumsum)

ggplot(data.2[1:500,], aes(x=x.index, y=roll_avg))+
    geom_line(color="red")+
    theme_bw()+
    xlab("Nth vehicle")+
    ylab("Average wait time")+
    geom_hline(yintercept = mean(data.2$roll_avg[11:500], na.rm = TRUE), linetype='dotted', size=2)+
    transition_reveal(x.index)
    #geom_smooth(method=lm, formula = y~1, color='#2C3E50')mean
anim_save("287-smooth-animation-with-tweenr.gif")


p<- ggplot(data.2[1:500,], aes(x=x.index, y=roll_avg))+
    geom_line(color="red")+
    theme_bw()+
    xlab("Nth vehicle")+
    ylab("Average wait time")+
    geom_hline(yintercept = mean(data.2$roll_avg[11:500], na.rm = TRUE), linetype='dotted', size=2)+
    transition_reveal(x.index)
anim <- p + transition_states(x.index, transition_length = 10, state_length = 1)

anim_save("287-smooth-animation-with-tweenr.gif")

data.2 <- data.2 %>% mutate(tempo = rollmean(main.cumsum, k = 2, fill = NA, align = "right"))
