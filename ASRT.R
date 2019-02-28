Database <- read.csv(file="adatok.csv", header=TRUE, sep=";")
library (ggplot2)
install.packages('gganimate')
library (gganimate)
install.packages('gifski')
library(gifski)
install.packages('png')
library(png)

Database$stim <- as.factor(Database$stim)


after_bar_error <- ggplot(Database, aes(x=stim, y=after.stimulation, fill=stim)) +
  geom_bar(stat="identity")+theme_minimal() + geom_errorbar(aes(ymin=after.stimulation-SE_during, ymax=after.stimulation+SE_during), width=.2,
                                                           position=position_dodge(.9))
after_bar_error

################################ EPOCHs

###################################
Epochs <- read.csv(file="line.csv", header=TRUE, sep=";")

lineAnim<-ggplot(Epochs, aes(x=Epoch, y=Statistical.learning, group=Stim)) +
  geom_line(aes(color=Stim))+
  geom_point(aes(color=Stim)) + 
  # Here comes the gganimate specific bits
  transition_reveal(Epoch)
animate(lineAnim)
anim_save("cool.gif", animation = last_animation())

lineAnim



lineError

#ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
 # geom_bar(stat="identity", position=position_dodge())