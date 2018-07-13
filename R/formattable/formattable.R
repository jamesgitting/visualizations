# formattable Example ----------------------------------------------------------------------------
# <Insert Short Description and Use Cases>

# Libraries -----------------------------------------------------------------------------------
library(formattable)
library(tidyverse)
library(babynames)

# Configuration -------------------------------------------------------------------------------



# Sample --------------------------------------------------------------------------------------

set.seed(2018)

sample_data <- babynames %>% 
                  sample_n(20, replace = FALSE) %>%
                  mutate(age = as.integer(format(Sys.Date(), "%Y")) - year) %>%
                  rowid_to_column("id") %>%
                  select(id, name, sex, age)

formattable(sample_data,
            list(
             age = color_tile("yellow", "red"),
             sex = formatter("span", style = x ~ style(color = ifelse(x == "F", "red", "blue")))
            ))