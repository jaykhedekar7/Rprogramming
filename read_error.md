---
title: "read function doubt"
author: "Jay Khedekar"
date: "13/04/2020"
output:
  pdf_document: default
  html_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Error
The data I use contains columns as date, county (place) and cases. When I use data.csv() to import I get a very strange graph as to when I use data_csv(). Why does it shows different graphs?


## Following code is used
```{r cars}
library(gapminder)
library(dplyr)
library(readr)
library(ggplot2)

data_withnodot <- read_csv('us-counties.csv')
data_withdot <- read.csv('us-counties.csv')

nodot <- data_withnodot %>% filter(county == 'New York City')
yesdot <- data_withdot %>% filter(county == 'New York City')

print(ggplot(nodot, aes(x = date, y = cases)) + geom_point() + ggtitle("read_csv graph"))
print(ggplot(yesdot, aes(x = date, y = cases)) + geom_point() + ggtitle("read.csv graph"))
```
