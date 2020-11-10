## Analysis of 20201110_Hormone.csv ##
# Setting working directory #

# Setting working directory. Change path to the folder where you installed the project.
folder <- "~/test RDM"
setwd(folder)

# Import libraries
# Install packages
library(ggplot2)

# Import the data 
Hormone <- read.csv2("data/20201110_Hormone.csv")
# Change name of the third column
names(Hormone)[3] <- "Concentration"
Hormone

# Open a pdf file where the plot will be saved
png(file = "results/plots/20201102-effect-drug-concentration.png", width=600, height=350)

# Create plot of effect of drug in concentration of substance.
Hormone_plot <- ggplot(Hormone, aes(Drug,Concentration)) +
	          stat_summary(fun=mean,geom="bar") +
		              stat_summary(fun.data=mean_cl_normal,geom="errorbar",
					                                           width=0.25) + geom_point() +
  coord_flip()



Hormone_plot


# Close the file handle
dev.off()