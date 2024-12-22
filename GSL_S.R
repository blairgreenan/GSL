library(tidyverse)
#library(patchwork)

Sal <- read.table("GSL_S.dat", header = TRUE, sep = "", col.names = c("Year", "D150m", "D200m", "D250m", "D300m"))

ggpS <- ggplot(Sal) + geom_line(aes(x=Year, y=D150m), color = "black", linewidth = 1.0) +
  geom_point(aes(x=Year, y=D150m), color = "black") +
  geom_smooth(aes(x=Year, y=D150m), method = "lm", se = TRUE, color = "black") +
  geom_label(aes(x=2020, y=33.1, label = "150 m"), color = "black")
ggpS <- ggpS + geom_line(aes(x=Year, y=D200m), color = "red")  +
  geom_point(aes(x=Year, y=D200m), color = "red")  +
  geom_smooth(aes(x=Year, y=D200m), method = "lm", se = TRUE, color = "red") +
  geom_label(aes(x=2020, y=33.9, label = "200 m"), color = "red")
ggpS <- ggpS + geom_line(aes(x=Year, y=D300m), color = "blue") +
  geom_point(aes(x=Year, y=D300m), color = "blue") +
  geom_smooth(aes(x=Year, y=D300m), method = "lm", se = TRUE, color = "blue") +
  geom_label(aes(x=2020, y=34.5, label = "300 m"), color = "blue")
ggpS <- ggpS + ylab(expression("Layer Average Salinity")) + xlab("Year")

# fit a linear model to the anomaly data
model_150 <- lm(Sal$D150m ~ Sal$Year)
# estimate the 95% confidence interval
confidence_95_150 <- confint(model_150, level = 0.95)
# fit a linear model to the anomaly data
model_200 <- lm(Sal$D200m ~ Sal$Year)
# estimate the 95% confidence interval
confidence_95_200 <- confint(model_200, level = 0.95)
# fit a linear model to the anomaly data
model_300 <- lm(Sal$D300m ~ Sal$Year)
# estimate the 95% confidence interval
confidence_95_300 <- confint(model_300, level = 0.95)


# ggsave("GSL.png", scale = 1)
ggsave("GSL_S_with_lm.png", width = 6, height = 3, units = "in", scale = 1.0, dpi = 1200)
