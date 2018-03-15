pa299 <- read.csv("penaddict299.csv")
names(pa299) <- c("Name", "Episode", "Title", "Guests", "Date", "Length", "QA")

pa299$Date <- as.Date(pa299$Date)

library(ggplot2)
p1 <- ggplot(pa299, aes(x=Date, y=Length)) + geom_point()

pred <- predict(lm(Length~Date, pa299))
p1 + geom_line(aes(y = pred)) + geom_point(aes(color = Length)) + geom_smooth() + labs(y = "Length (minutes)")

ggsave(filename = "tpa299.png", p1 + geom_line(aes(y = pred)) + geom_point(aes(color = Length)) + geom_smooth() + labs(y = "Length (minutes)"), width = 10, height = 6, dpi=300, units = "in", device = 'png')
