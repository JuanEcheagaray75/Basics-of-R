# Author: Juan Pablo Echeagaray González
# Date: 12/01/22
# Desc: First project of "Hands-on programming with R"

# Packages
library("ggplot2")
library("gridExtra")

roll <- function(die = 1:6){
    val <- sum(sample(x = die, size = 2, replace = T))
    return(val)
}

weight_roll <- function(die = 1:6, prob_dist = c(rep(1/8, times = 5), 3/8)){
    val <- sum(sample(x = die, size = 2, replace = T, prob = prob_dist))
    return(val)
}

n_rolls <- 1e5
rolls <- replicate(n_rolls, roll())
unfair_rolls <- replicate(n_rolls, weight_roll())
plot1 <- qplot(rolls, binwidth = 1, ylab = "Frequency")
plot2 <- qplot(unfair_rolls, binwidth = 1)

pdf("out//project1.pdf")
grid.arrange(plot1, plot2, ncol = 2, top = "Comparison of 2 dies")
dev.off()
