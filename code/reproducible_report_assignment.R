# Load library ------
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggrepel)
library(lubridate) 

rm(list=ls())

data <- read_csv("result/tidy_dataset_1.csv")

# Filter and process the data
processData <- data %>%
  # Filter for months May, June, and July of the year 2020 and for measures minTemp and maxTemp
  filter(Month %in% c(5, 6, 7) & Year == 2020 & Measure %in% c('minTemp', 'maxTemp')) %>%
  select(-Unit)

# Extract sunData
sunData <- processData %>%
  filter(Condition == "Sun")

# Extract shadeData
shadeData <- processData %>%
  filter(Condition == "Shade") %>%
  group_by(Day, Month, Year, Condition, Measure) %>%
  dplyr::summarise(Value = mean(Value))%>%
  distinct()

# Combine sunData and shadeData by column
combinedData <- rbind(sunData, shadeData) %>%
  mutate(Date = ymd(paste0(.$Year, "-", .$Month, "-", .$Day))) 

# Plot 1: Line plot

plt_line <- ggplot(combinedData, aes(x = Date, y = Value, group = Condition, color = Condition)) +
  geom_line() +
  geom_point(shape = 21, color = "black", fill = "grey", size = 2) +
  facet_wrap(~ Measure, scales = "free_y", ncol = 1) +
  theme_bw()+
  labs(title = "The Daily Minimum and Maximum Temperatures in May, June, and July 2020")


# Save plot to PDF
ggsave("plots/line_plot.pdf", plt_line, width = 8, height = 6, units = "in")

# Plot 2: Scatter plot with error bars
plt_average_1 <- ggplot(combinedData, aes(x = Month, y = Value, color = as.character(Month))) + 
  geom_jitter(alpha = 0.5, width = 0.1) +
  stat_summary(geom = "point", fun = mean, size = 2, color = "black") + 
  stat_summary(geom = "errorbar", fun.data = mean_se, fun.args = list(mult = 1.96), width = 0, color = "black") + 
  labs(x = "Month", title = "Average Minimum and Maximum Temperatures (May - July 2020) with Standard Error Across All Locations") +
  scale_color_manual(values = c("5" = "#4059AD", "6" = "#97D8C4", "7" = "#F4B942"), name = "Month") + 
  facet_wrap(~ Measure, scales = "free_y", ncol = 1) +
  theme_bw() +
  theme(axis.text.x = element_text(hjust = 1))

# Save plot to PDF
ggsave("plots/plt_average_1.pdf", plt_average_1, width = 10, height = 8, units = "in")

# Alternatives 
plt_average_2 <- ggplot(combinedData, aes(Month, Value, group = interaction(Month, Measure))) +
  geom_point(aes(color = Measure, fill = after_scale(alpha(colour, 0.5))), 
             position = position_jitterdodge(dodge.width = 0.9, 0.1),
             size = 2, shape = 21) +
  geom_boxplot(fill = NA, color = "black", width = 0.2, linewidth = 0.4,
               position = position_dodge(0.9)) +
  geom_violin(fill = NA, color = "black", width = 0.8, linewidth = 0.4,
              position = position_dodge(0.9)) +
  geom_point(stat = "summary", size = 4, color = "#8a0f00",
             position = position_dodge(0.9), fun = mean) +
  geom_label_repel(stat = "summary", fun = mean, size = 3,
                   aes(label = paste0("Avg==", 
                                      round(after_stat(y), 2))),
                   parse = TRUE, position = position_dodge(0.9)) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal(base_size = 12) +
  theme(axis.title = element_text(face = 2),
        legend.position = "bottom",
        axis.text.y.right = element_blank()) +
  labs(title = "Minimum and Maximum Temperatures (May - July 2020) Across All Locations")

# Save plot to PDF
ggsave("plots/average_plot_2.pdf", plt_average_2, width = 10, height = 8, units = "in")


