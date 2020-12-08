num_darts <- 500000
num_darts_in_circle <- 0


#For loops are slower in R to iterate then iterating through vector matrices like done below the commented code.
# for(i in 1:num_darts){
#     x <- runif(n=1, min=-1, max=1)
#     y <- runif(n=1, min=-1, max=1)
#     
#     if(x^2 + y^2 <=1){
#         num_darts_in_circle = num_darts_in_circle + 1
#     }
# }

x <- runif(n=num_darts, min=-1, max=1)
y <- runif(n=num_darts, min=-1, max=1)

sum_sqr <- x^2 + y^2
indexes_darts_in_circle <- which(sum_sqr<=1)
num_darts_in_cir <- length(indexes_darts_in_circle)

print(4*num_darts_in_cir/num_darts)
