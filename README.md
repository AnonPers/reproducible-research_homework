# Reproducible research: version control and R

## Answers

***Q 1-3 Answers link :***

<https://github.com/AnonPers/logistic_growth>

***Question 4 :***

Code for this question can be found in 'Question_4_code.r'

-   *A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)*

Initially, what I can observe is that both plots appear to show patterns of random walks almost symmetrical to one another. The scales for the y and x axes are different for both plots. Plot 1 y axis ranges from -3-3, while the x-axis spans from -1-4. The y axis on plot 2, however, ranges from -4-2, while the x-axis ranges from -6-0. I can observe from both plots that both random walks approach the similar maximum y coordinate of \~2, but have different minimum y-coordinates they approach. In plot 1 this is \~-3 and in plot 2 this is shown to be -4. It appears that the random walk in plot 2 spans a larger range of y and x coordinates, while the random walk in plot 1 covers a larger area on the plot despite confining itself to a smaller interval compared to plot 2. In plot 1, the random walk displays a more pronounced presence of peaks and appears to quickly move from higher, peak y-values (\~2) and lower y-values. This creates a visually distinct pattern characterised by frequent upward and downward fluctuations. In contrast, plot 2 appears to have comparatively fewer peaks. Furthermore, plot 1 has noticeable clustering from the random walk, with the random walk often converging and diverging to previous points it had previously went over. This leads to a more clustered appearance of plot 1. Plot 2, however, has a more evenly spread walk, so the pattern is less clustered and more dispersed; this could be due to a larger range of y and x values being spanned during the random walk.

At the beginning of the time step, below 200, both plots show that the random walk remains mostly within the y-coordinates -2 and 1. However, in plot 1, the random walk initially starts between the x-coordinates -1 and 1, and then as the time steps continue and approaches 500, the random walk moves toward the right of the plot and remains mostly within the x-coordinates 2 and 4. From plot 2 I can observe that the random walk initially starts and mainly remains within x-coordinates -2 and 0, but the opposite pattern observed in model 1 occurs, in which the random walk moves toward the left of the plot. Toward the end of the time step as it approaches 500, the random walk remains mainly between x-coordinates -5 and -3. Comparatively, it appears as though the random walks have gone in opposite directions, leading to overall symmetrical patterns, with more clustering in plot 1 and a more dispersed walk observed in plot 2.

It should be mentioned that running the code will produce different plots every time, so I have provided an image of the plots that I observed.

-   *Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)*

Random seeds are numerical values, used to initialise the random number generator (RNG) state for random number generation in R. True randomness if difficult to achieve in statistical and computer modelling, so often RNGs are used to generate number sequences that appear random. These sequences of numbers are based on these initial 'random seeds'. In the context of models that use randomness, such as Brownian motion simulation, random seeds initialise the RNGs that generate random output values. These random seeds can be set using the 'set.seed( )' function in R, meaning that once the seed is set (setting a set of numerical values for input), any subsequent calls to functions that generate random numbers will provide an output of the same sequence of random numbers every time it is ran, given the same seed. This means if we have models that use randomness, by setting the seed the output of the model will always be the same every time we run the code. In the case of the previous question, setting the seed would mean the 'question-4-code' is run, the random_walk simulated/plotted would be the same every time. Setting random seeds is really important for reproducibility, as it provides the same output for the same code every time, meaning other users of your R code can reproduce your results, or you can recreate your own analysis in future.

-   *Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)*

Script edit seen in answer to below question

-   Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

***Question 5 :***

Code for this question can be found in 'Question_5_code.r'

-   *Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)*

The table has 33 rows and 13 columns.

-   *What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)*

You can apply a log transformation to fit a linear model to the data. This is because the genome size of viral particles and volume of genome particles have an allometric relationship described by : V = βL\^α

So I can make the relationship linear by logging the allometric equation : Log(V) = log(β) + αlog(L).

I subset the data to create a data frame only including virion length and genome size, and then applied a log transformation, which can be seen in the "Question_5_code.R" file, but I have also provided an image of my code.

-   *Find the exponent (*$\alpha$*) and scaling factor (*$\beta$*) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)*

The summary of the linear model from the logged data gave an estimate for the intercept to be 7.0748. This can be used to find the scaling factor, ($\beta$), by doing e^7.0748^. I found the value of ($\beta$) = 1181.807, which can be rounded to give ($\beta$) = \~1182. The P-value for this was 2.28e-10\*\*\*, which is highly significant (P \< 0.001).

The value of the exponent can be found from the summary of the linear model from the logged data by looking at the estimate for log_genome_length. I found the value of ($\alpha$) = 1.5152 = \~1.52. The P-value for this was 6.44e-10, which is also highly significant (P\<0.001).

In table 2 of the paper provided, it appears I found the same values for the allometric exponent (1.52 with 95% confidence interval of 1.16-1.87 in the paper) and the scaling factor, (1182 with 95% confidence interval of 246-5675 in the paper).

-   *Write the code to reproduce the figure shown below. (10 points)*

library(scales)

library(ggplot2)

ggplot(logged_length_volume_data, aes(x = log_genome_length, y = log_virion_volume)) + geom_point() + geom_smooth(method = "lm", se = TRUE, color = "blue") +\
labs( x = expression(bold("log[Genome length (kb)]")), y = expression(bold("log[Virion volume (nm3)]")) ) + theme_bw()

```         
<p align="center">

<img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500"/>

</p>
```

-   *What is the estimated volume of a 300 kb dsDNA virus? (4 points)*

In order to find the estimated volume of a 300 kb dsDNA virus, I needed to first create a new data frame of the log of this new genome length :

new_genome_length \<- data.frame(log_genome_length = log(300))

Then I used the predict function to predict the estimated volume from the linear model I made for earlier questions in Q5 :

predict(linear_model_volume_length, new_genome_length)

The output I gained was 15.71733. As the genome length was logged, I had to do e^15.71733^ to gain the actual estimated volume.

From these steps I found for a genome length of 300 kb, the estimated volume of the ds DNA virus was 6698070 nm^3^.

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
