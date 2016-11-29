library(tidyverse)
mdata <- read_csv("drugData.csv")

mdata$Group <- as.factor(mdata$Group)
#officially tells R that something is a categorical variable (made it into a factor)

glimpse(mdata)
psych::describeBy(x=mdata$Arousal,group=mdata$Group)
#we get the mean and SD, all of the skewness stats, etc
#comparing group 0 avg to group 1 avg

#could also do
mdata_grouped <- group_by(mdata, Group)
#in a minute i'm going to summarise and group them by Group
#creates a new data set from mdata where the Group column has been flagged
#creates a new dataset
mdata_grouped %>% summarise(M=mean(Arousal, na.rm=TRUE), SD = sd(Arousal, na.rm=TRUE))
#then we take it and summarise every group in msata to get results based on the categorical variable

install.packages("car",dep=T)
car::leveneTest(mdata$Arousal, group=mdata$Group, center="median")
#this runs levene's test, and tells us that the homogeneity of variance assumption is true
#ns, the variance are the same

exp.group.rows <- mdata %>% filter(Group==0)
control.group.rows <- mdata %>% filter(Group==1)
#breaks them up into groups, gives us a subset of the rows
t.test(x=exp.group.rows$Arousal, y=control.group.rows$Arousal, var.equal=TRUE)
#filter command gives a subset of mdata for those in group 0, same deal for group 1
#2 sets of data, one for the control group, and one for the experimental group
#in the t test, x is one group and y is one group, and we're using the formula where variances are equal

#review group by, summarise, filter, and select for final 
#filter gives you rows, select gives you columns







