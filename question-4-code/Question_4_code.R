#install.packages("ggplot2")
#install.packages("gridExtra")
#install.packages("dplyr")

library(ggplot2)
library(gridExtra)
library(dplyr)

random_walk <- function(n_steps, seed_val = NULL) {
  if (!is.null(seed_val)) set.seed(seed_val)  
  #If seed value is given, above line will set random seed - if not, seed value will be NULL 
  #(NULL seed value = different outputs every time code is ran)
  #need to set seed before other lines of code - initialises the brownian motion with specific values
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  df[1,] <- c(0, 0, 1)
  
  for (i in 2:n_steps) {
    h <- 0.25
    angle <- runif(1, min = 0, max = 2 * pi)
    df[i, 1] <- df[i - 1, 1] + cos(angle) * h
    df[i, 2] <- df[i - 1, 2] + sin(angle) * h
    df[i, 3] <- i
  }
  
  return(df)
}

# Function to generate random walk plot

plot_random_walk <- function(random_walk_data) {
  random_walk_data %>%
    ggplot(aes(x = x, y = y)) +
    geom_path(aes(colour = time)) +
    theme_bw() +
    xlab("x-coordinate") +
    ylab("y-coordinate")
}

# Set parameters

seed_val <- 456 #set seed random seed value wanted for specific plot
n_steps <- 500 #set number of time steps

# Generate random walk data
random_walk_data <- random_walk(n_steps, seed_val)

# Plot random walk
plot_random_walk(random_walk_data)


#another plot with different seed values 
#plot will be same every time running below code 

#setting the parameters

seed_val <- 123 #set seed random seed value wanted for specific plot
n_steps <- 500 #set number of time steps

# Generate random walk data
random_walk_data <- random_walk(n_steps, seed_val)

# Plot random walk
plot_random_walk(random_walk_data)


#plot with no set seed value 
#[will be different every time below code is ran]

seed_val <- NULL
n_steps <- 500 

# Generate random walk data
random_walk_data <- random_walk(n_steps, seed_val)

# Plot random walk
plot_random_walk(random_walk_data)



