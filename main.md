Monte Carlo Simulation
================
Jay Khedekar
16/12/2020

## Monte Carlo Simulation of \(\pi\)

Imagine you have a circular plated placed inside a square plate. The
\(diameter\) of circle is equal to \(side\) of square. You then throw
marbles randomly from top. Once done you then count the number of
marbles that fell inside the circular plate and compare that to number
fell in square plate. Ideally they should be in proportion to their
areas.

``` r
num_darts <- 99999999
num_darts_in_circle <- 0

x <- runif(n=num_darts, min=-1, max=1)
y <- runif(n=num_darts, min=-1, max=1)

sum_sqr <- x^2 + y^2
indexes_darts_in_circle <- which(sum_sqr<=1)
num_darts_in_cir <- length(indexes_darts_in_circle)

sprintf("%.15f",4*num_darts_in_cir/num_darts)
```

    ## [1] "3.141331151413311"

``` r
coin <- c(0,1)
simulation <- 100000
heads <- 0
for(i in 1:simulation){
    temp <- sample(coin, 1,replace=TRUE)
    if(temp==0){
        heads <- heads + 1
    }
}

print(paste0("Probability of heads: ", heads/simulation))
```

    ## [1] "Probability of heads: 0.49906"

``` r
library(ggplot2)

x.1 <- c(-20:30)
iterate <- c(1:51)
val <- c()
m <- 0
for(i in c(1:51)){
    m <- x.1[i]^2 + 2
    val[i] <- m
}

df <- data.frame(x.1,val)
```

![](main_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->
