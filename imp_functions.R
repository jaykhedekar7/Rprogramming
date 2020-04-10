# Common vector used for all function

vec <- c(2,4,1,12,-10,18, -14.3, 25.8, 7.2)

#mean()
# Calculates the mean
mean(vec)
print("Mean")
print(mean(vec))


# abs()
# Makes all the number positive. Works like bar in mathematics
abs(vec)
print("Abs")
print(abs(vec))

#round
# Rounds up a decimal as done in mathematics
round(vec)
print("Round")
print(round(vec))


#seq
# This function creates an arithmetic seqeunce given the first number, last number and difference in consecutive terms
seq(2,20, by= 2)
print("Seq")
print(seq(2,20, by = 2))


#rep
# Function is used to repeat the whole vector as many times needed
rep(vec, times = 2)
print("Rep")
print(rep(vec, times =2))
