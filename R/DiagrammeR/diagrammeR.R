# DiagrammeR Example ----------------------------------------------------------------------------
# <Insert Short Description and Use Cases>


# Libraries -----------------------------------------------------------------------------------
library(DiagrammeR)
library(DiagrammeRsvg)


# Configuration -------------------------------------------------------------------------------
output_dir <- file.path("./DiagrammeR/visuals/")



# Samples -------------------------------------------------------------------------------------

simple_gv <- grViz("

digraph boxes_and_circles {

  node [shape = circle]
  A; B; C; D; E; F

  node [shape = triangle]
  1; 2; 3; 4; 5; 6; 7; 8

  # Edge Statements
  A->1; B->2; B->3;
}

")