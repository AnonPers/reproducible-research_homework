library(readr)
install.packages("janitor")
library(janitor)

ds_virus_data <- read_csv("question-5-data/Cui_etal2014.csv")
View(ds_virus_data)

#Cleaning the column names in "ds_virus_data" to make them human and computer readable 

cleaned_virus_data <- ds_virus_data %>%
  clean_names()

#subsetting data to only include genome length and virion volume 

length_volume_virus_data <- cleaned_virus_data[, c("genome_length_kb", "virion_volume_nm_nm_nm")]

#plotting subset data  

ggplot(length_volume_virus_data, aes(x = genome_length_kb, y = virion_volume_nm_nm_nm)) +
  geom_point() +
  labs(
       x = "Genome Length (kb)",
       y = "Virion Volume (nm x nm x nm)") +
  theme_minimal()

#applying log transformation to the subset data

length_volume_virus_data$log_genome_length <- log(length_volume_virus_data$genome_length_kb)
length_volume_virus_data$log_virion_volume <- log(length_volume_virus_data$virion_volume_nm_nm_nm)

#putting the logged transformed genome length and virion volume into a new data set 

logged_length_volume_data <- data.frame(
  log_genome_length = log(length_volume_virus_data$genome_length_kb),
  log_virion_volume = log(length_volume_virus_data$virion_volume_nm_nm_nm)
)

#plotting the logged data

ggplot(logged_length_volume_data, aes(x = log_genome_length, y = log_virion_volume)) +
  geom_point() +
  labs(
    x = "Genome Length (kb)",
    y = "Virion Volume (nm x nm x nm)") +
  theme_minimal()

#linear model on the logged data 

linear_model_volume_length <- lm(log_virion_volume ~ log_genome_length, data = logged_length_volume_data)
summary(linear_model_volume_length)

#intercept estimate 7.0748
#log_genome_length estimate 1.5152

#do e^7.0748 to find scaling factor
exp(7.0748)


#plotting logged relationship with regression line 

library(scales)

ggplot(logged_length_volume_data, aes(x = log_genome_length, 
                                      y = log_virion_volume)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue") +  
  labs(
      x = expression(bold("log[Genome length (kb)]")),
      y = expression(bold("log[Virion volume (nm3)]"))
  ) +
  theme_bw() 

#estimated volume of 300kb dsDNA virus 

new_genome_length <- data.frame(log_genome_length = log(300))

predict(linear_model_volume_length, new_genome_length) #output - 15.71733

estimated_volume <- exp(15.71733)






