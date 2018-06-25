# Sunburst Example ----------------------------------------------------------------------------
# Sunburst charts can be a good visualization for sequential data.
# One scenario is identifying user navigation of a website.
# Using clickstream data, we can visualize paths users are taking and perhaps identifying
# areas to improve our UI


# Libraries -----------------------------------------------------------------------------------
library(sunburstR)
library(htmltools)
library(htmlwidgets)
library(tidyverse)

clickstream <- read_csv(system.file("examples/visit-sequences.csv", package="sunburstR"),
                        col_names = c("sequence", "ct")) %>% 
                  arrange(desc(ct))

# Simple read-out of the percentage of users navigating a particular path
# Note: javascript syntax to work the visualization
explain <- "
  function(d){
    return (d.value / this * 100).toPrecision(3) + '% of users<br>followed this path'
  }
"

viz <- sunburst(clickstream,
                legend = list(w=80, h=25, r=5, s=5),
                explanation = explain)

viz <- viz %>%
          prependContent(h1("Sample Clickstream Sunburst Visualization")) %>%
          prependContent(a("Github Link", href="https://github.com/jamesgitting/visualizations/")) %>%
          prependContent(hr())

viz