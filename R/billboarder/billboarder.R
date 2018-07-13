# formattable Example ----------------------------------------------------------------------------
# <Insert Short Description and Use Cases>

# Libraries -----------------------------------------------------------------------------------
library(billboarder)

# Data sets -----------------------------------------------------------------------------------
data(diamonds)

# Configuration -------------------------------------------------------------------------------




# Bar Charts ----------------------------------------------------------------------------------

# Simple Bar
sample_data <- diamonds %>%
                  filter(carat == 0.3) %>%
                  group_by(cut) %>%
                  summarize_at(vars(price),
                               funs("mean", "sd"))

billboarder() %>%
  bb_barchart(data = sample_data %>% select(cut, mean),
              color = "#1F31EE") %>%
  bb_x_grid(show = FALSE) %>%
  bb_y_grid(show = TRUE) %>%
  bb_legend(show = FALSE) %>%
  bb_labs(title = "Avg Price by Diamond Cut",
          caption = "Code source: http://github.com/jamesgitting/visualizations/",
          y = "Avg Price")

