# Reproducible research: version control and R

##   INSERT ANSWERS HERE 

***Q 1-3 Answers link :***

<https://github.com/AnonPers/logistic_growth>

***Question 4 :***

Code for this question can be found in 'Question_4_code.r'

-   *A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)*

Initially, what I can observe is that both plots appear to show patterns of random walks almost symmetrical to one another. The scales for the y and x axes are different for both plots. Plot 1 y axis ranges from -3-3, while the x-axis spans from -1-4. The y axis on plot 2, however, ranges from -4-2, while the x-axis ranges from -6-0. I can observe from both plots that both random walks approach the similar maximum y coordinate of \~2, but have different minimum y-coordinates they approach. In plot 1 this is \~-3 and in plot 2 this is shown to be -4. It appears that the random walk in plot 2 spans a larger range of y and x coordinates, while the random walk in plot 1 covers a larger area on the plot despite confining itself to a smaller interval compared to plot 2. In plot 1, the random walk displays a more pronounced presence of peaks and appears to quickly move from higher, peak y-values (\~2) and lower y-values. This creates a visually distinct pattern characterised by frequent upward and downward fluctuations. In contrast, plot 2 appears to have comparatively fewer peaks. Furthermore, plot 1 has noticeable clustering from the random walk, with the random walk often converging and diverging to previous points it had previously went over. This leads to a more clustered appearance of plot 1. Plot 2, however, has a more evenly spread walk, so the pattern is less clustered and more dispersed; this could be due to a larger range of y and x values being spanned during the random walk.

At the beginning of the time step, below 200, both plots show that the random walk remains mostly within the y-coordinates -2 and 1. However, in plot 1, the random walk initially starts between the x-coordinates -1 and 1, and then as the time steps continue and approaches 500, the random walk moves toward the right of the plot and remains mostly within the x-coordinates 2 and 4. From plot 2 I can observe that the random walk initially starts and mainly remains within x-coordinates -2 and 0, but the opposite pattern observed in model 1 occurs, in which the random walk moves toward the left of the plot. Toward the end of the time step as it approaches 500, the random walk remains mainly between x-coordinates -5 and -3. Comparatively, it appears as though the random walks have gone in opposite directions, leading to overall symmetrical patterns, with more clustering in plot 1 and a more dispersed walk observed in plot 2. Although there are overall symmetrical patterns, there does not appear any clear sense of direction in the walk, so I would determine this to be random.

It should be mentioned that running the code will produce different plots every time, so I have provided an image of the plots that I observed.




<img width="993" alt="Screenshot 2023-12-06 at 21 08 01" src="https://github.com/AnonPers/reproducible-research_homework/assets/150166853/08820ded-6927-46fb-a890-9b5ffa4e2dbf">





-   *Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)*

Random seeds are numerical values, used to initialise a random number generator (RNG) state for random number generation in R. True randomness is difficult to achieve in statistical and computer modelling, so often RNGs are used to generate number sequences that appear random. These sequences of numbers are based on these initial 'random seeds'. In the context of models that use randomness, random seeds initialise the RNGs that generate random output values. These random seeds can be set using the 'set.seed( )' function in R, meaning that once the seed is set (setting a set of numerical values for input), any subsequent calls to functions that generate random numbers will provide an output of the same sequence of random numbers every time it is ran, given the same seed. This means if we have models that use randomness, by setting the seed the output of the model will always be the same every time we run the code. In the case of the previous question, setting the seed would mean the 'question-4-code' is run the random_walk simulated/plotted would be the same every time. Setting random seeds is really important for reproducibility, as it provides the same output for the same code every time, meaning other users of your R code can reproduce your results, or you can recreate your own analysis in the future.

-   *Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)*

Script edit seen in answer to below question

-   Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)


Code on the red shows the original code. Code on the green background shows the changes I made to the code to make a reproducible simulation of Brownian motion.




<img width="616" alt="Screenshot 2023-12-07 at 13 20 14" src="https://github.com/AnonPers/reproducible-research_homework/assets/150166853/878ced2c-469b-4e08-a472-3a4b823036c2">
<img width="615" alt="Screenshot 2023-12-07 at 13 20 42" src="https://github.com/AnonPers/reproducible-research_homework/assets/150166853/ef1a688b-ced2-453b-893d-342ebd827304">


<img width="615" alt="Screenshot 2023-12-07 at 13 22 00" src="https://github.com/AnonPers/reproducible-research_homework/assets/150166853/a77fd323-9c14-4b84-b1f9-a27105c40b4d">
<img width="614" alt="Screenshot 2023-12-07 at 13 22 29" src="https://github.com/AnonPers/reproducible-research_homework/assets/150166853/29b2bac3-bf8d-4f88-84b7-108d0594efa5">

<img width="614" alt="Screenshot 2023-12-07 at 13 22 39" src="https://github.com/AnonPers/reproducible-research_homework/assets/150166853/dfa381df-2b00-47da-a5e1-d0c02fe0c928">








***Question 5 :***

Code for this question can be found in 'Question_5_code.r'

-   *Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)*

The table has 33 rows and 13 columns.

-   *What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)*

You can apply a log transformation to fit a linear model to the data. This is because the genome size of viral particles and volume of genome particles have an allometric relationship described by : V = βL\^α

So I can make the relationship linear by logging the allometric equation : Log(V) = log(β) + αlog(L).

I subset the data to create a data frame only including virion length and genome size, and then applied a log transformation, code of which is below : 

```
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

#applying log transformation to the subset data

length_volume_virus_data$log_genome_length <- log(length_volume_virus_data$genome_length_kb)
length_volume_virus_data$log_virion_volume <- log(length_volume_virus_data$virion_volume_nm_nm_nm)

#putting the logged transformed genome length and virion volume into a new data set 

logged_length_volume_data <- data.frame(
  log_genome_length = log(length_volume_virus_data$genome_length_kb),
  log_virion_volume = log(length_volume_virus_data$virion_volume_nm_nm_nm)
)

```

-   *Find the exponent (*$\alpha$*) and scaling factor (*$\beta$*) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)*

The summary of the linear model from the logged data gave an estimate for the intercept to be 7.0748. This can be used to find the scaling factor, ($\beta$), by doing e^7.0748^. I found the value of ($\beta$) = 1181.807, which can be rounded to give ($\beta$) = \~1182. The P-value for this was 2.28e-10\*\*\*, which is highly significant (P \< 0.001).

The value of the exponent can be found from the summary of the linear model from the logged data by looking at the estimate for log_genome_length. I found the value of ($\alpha$) = 1.5152 = \~1.52. The P-value for this was 6.44e-10, which is also highly significant (P\<0.001).

In table 2 of the paper provided, it appears I found the same values for the allometric exponent (1.52 with 95% confidence interval of 1.16-1.87 in the paper) and the scaling factor, (1182 with 95% confidence interval of 246-5675 in the paper).

-   *Write the code to reproduce the figure shown below. (10 points)*

  
```
library(scales)

library(ggplot2)

ggplot(logged_length_volume_data, aes(x = log_genome_length, y = log_virion_volume)) + geom_point() + geom_smooth(method = "lm", se = TRUE, color = "blue") +
labs( x = expression(bold("log[Genome length (kb)]")), y = expression(bold("log[Virion volume (nm3)]")) ) + theme_bw()
```


-   *What is the estimated volume of a 300 kb dsDNA virus? (4 points)*

In order to find the estimated volume of a 300 kb dsDNA virus, I needed to first create a new data frame of the log of this new genome length :

```
new_genome_length <- data.frame(log_genome_length = log(300))
```

Then I used the predict function to predict the estimated volume from the linear model I made for earlier questions in Q5 :

```
predict(linear_model_volume_length, new_genome_length)
```

The output I gained was 15.71733. As the genome length was logged, I had to do e^15.71733 to gain the actual estimated volume.

From these steps I found for a genome length of 300 kb, the estimated volume of the ds DNA virus was 6698070 nm^3^.


**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).


Reproducibility in scientific research is when existing data is reanalysed, using the same research methods, yielding the same results each time. For scientific research to be reproducible, necessary raw data is required, to run the same analysis again. Replicability is when a new data set is analysed but with the same research methods, and the same results are still yielded. A study can be reproducible, but not necessarily replicable, and reproducibility alone is not enough to determine that results obtained from scientific research are correct. Testing for reproducibility, however, is necessary, as it can allow a researcher or others to note any inconsistencies in the data.  Both reproducibility and replicability enhance the reliability of results from scientific research, and they allow scientific researchers to check the quality of their work, and the work of others. It allows scientific research to remain honest.

Git and Git Hub can be used to enhance reproducibility and replicability of work, especially in data science. They allow others to check the quality of a code-base used for data analysis. A git is version control system designed to track changes in a code over time. Git Hub is a web platform built on top of git-technology to make it easier to track and merge changes when many people want to work on the same project. One way git and GitHub enhances reproducibility and replicability is through version control. As mentioned, a git tracks changes to a code over time, and any changes to the code can be “committed.” A ‘commit’ represents each specific state a project has been in. This means that it is possible to recreate and reproduce previous versions of the data code and others can run the exact same code from each ‘commit’ to others obtain the same results. Additionally, version control means that it is easy for others to see other versions of your code, so they can easily replicate your work also. 

Git repositories can also be branched, which allow others to work on your code, adding or changing different features, without affecting the main code base. This allows for reproducibility as others can isolate their changes and independently reproduce separate analyses. If one finds after reproducible research there is a mistake in the original code, or it can be improved, a forked branch can be merged with the main branch. This creates a pull request, through which the new code can be reviewed. This ensures that any modifications to the original code are valid, and don’t compromise reproducibility, On GitHub, there is also the option to fork, which creates a copy of a git repository. This allows for replicability, because others can use a codebase as a starting point for their own research or analyses in a different context. 

Git repositories also have the option of containing a README file, which can be used to document the progression of a project. This can enhance reproducibility, as it allows others to understand why specific changes may have been made. This also provides information that may be useful for those that want to replicate or build on this work.

From this it is clear that Git and GitHub allow for collaboration, where multiple researchers can work on the same project at the same time, without interfering with one another. This enhances reproducibility, as the ‘commit history’ will show what is contributed and when, and also replicability, as others fork their own repositories to work and collaborate on.

There are limitations, however to the use of Git and Git Hub. The main limitation is that they are not useful for sharing or documenting experimental protocols or methods in scientific research. If data is obtained from a specific experimental protocol and method, rather than from an online database or code, it is important to know if these experimental protocol methods are also reproducible and replicable, and if they will yield the same results. GitHub hosts and manages code repositories, so it will not be very useful if you want to document and share experimental protocols and methods in scientific research. There are online platforms, however, that can be used to do this. One example being protocols.io. Protocols.io provides a platform specifically for researchers to share detailed steps of their experimental procedures. Users can collaborate on experimental methods, and even comment on other users experimental methods with improvements. GitHub and protocol.io are similar in the sense that they both allow for collaboration, but GitHub is used more so for data science research, while protocol.io is tailored to refining and improving experimental procedures. 

Another limitation is that gits can manage and store text-based files very well, but it is less efficient at storing large binary files, such as images. If these are stored in repositories, this can increase repository sizes. Having larger repositories can lead to performance issues, such as slower running of code. 










## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the \# INSERT ANSWERS HERE \# section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions

1)  (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which \*.csv file you used).

2)  (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?

3)  (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.

4)  (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

    -   A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
    -   Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
    -   Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
    -   Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5)  (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: <https://doi.org/10.1128/jvi.00362-14>) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form $`V = \beta L^{\alpha}`$, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

    -   Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
    -   What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
    -   Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
    -   Write the code to reproduce the figure shown below. (10 points)

<p align="center">

<img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500"/>

</p>

-   What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
