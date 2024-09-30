library(tidyverse)
#library(patchwork)

Tem <- read.table("GSL_T.dat", header = TRUE, sep = "", col.names = c("Year", "D150m", "D200m", "D250m", "D300m"))

ggpT <- ggplot(Tem) + geom_line(aes(x=Year, y=D150m), color = "black", linewidth = 1.0) +
  geom_point(aes(x=Year, y=D150m), color = "black") +
  geom_smooth(aes(x=Year, y=D150m), method = "lm", se = TRUE, color = "black") +
  geom_label(aes(x=2028, y=3.7, label = "150 m"), color = "black")
ggpT <- ggpT + geom_line(aes(x=Year, y=D200m), color = "red")  +
  geom_point(aes(x=Year, y=D200m), color = "red")  +
  geom_smooth(aes(x=Year, y=D200m), method = "lm", se = TRUE, color = "red") +
  geom_label(aes(x=2028, y=5.7, label = "200 m"), color = "red")
ggpT <- ggpT + geom_line(aes(x=Year, y=D300m), color = "blue") +
  geom_point(aes(x=Year, y=D300m), color = "blue") +
  geom_smooth(aes(x=Year, y=D300m), method = "lm", se = TRUE, color = "blue") +
  geom_label(aes(x=2028, y=6.9, label = "300 m"), color = "blue")
ggpT <- ggpT + ylab(expression("Layer Average Temperature (\u00B0C)"))  + xlab("")

# fit a linear model to the anomaly data
model_150 <- lm(Tem$D150m ~ Tem$Year)
# estimate the 95% confidence interval
confidence_95_150 <- confint(model_150, level = 0.95)
# fit a linear model to the anomaly data
model_200 <- lm(Tem$D200m ~ Tem$Year)
# estimate the 95% confidence interval
confidence_95_200 <- confint(model_200, level = 0.95)
# fit a linear model to the anomaly data
model_300 <- lm(Tem$D300m ~ Tem$Year)
# estimate the 95% confidence interval
confidence_95_300 <- confint(model_300, level = 0.95)


# ggsave("GSL.png", scale = 1)
ggsave("GSL_T_with_lm.png", width = 6, height = 3, units = "in", scale = 1.5, dpi = 1200)
