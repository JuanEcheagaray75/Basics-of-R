roll <- function(die = 1:6){
    val <- sum(sample(x = die, size = 2, replace = T))
    return(val)
}

roll()