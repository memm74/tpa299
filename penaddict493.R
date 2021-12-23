pa493 <- read.csv("penaddict493.csv")
names(pa493) <- c("Name", "Episode", "Title", "Guests", "Date", "Length", "QA")

pa493$Date <- as.Date(pa493$Date)

minutes <- sum(pa493$Length)
minutes/60
minutes/60/24

library(ggplot2)
p1 <- ggplot(pa493, aes(x=Date, y=Length)) + geom_point()

pred <- predict(lm(Length~Date, pa493))
p1 + geom_line(aes(y = pred)) + geom_point(aes(color = Length)) + geom_smooth() + labs(y = "Length (minutes)")

ggsave(filename = "tpa493.png", p1 + geom_line(aes(y = pred)) + geom_point(aes(color = Length)) + geom_smooth() + labs(y = "Length (minutes)"), width = 10, height = 6, dpi=300, units = "in", device = 'png')
