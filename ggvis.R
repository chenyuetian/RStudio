
library(ggvis)
# import raw data, make sure Forbes2000_clean.csv is available
forbes <- read.csv("Forbes2000_clean.csv",header=T,stringsAsFactors = FALSE,na.strings ="NA",sep=",")

# basic usage, similiar to ggplot2, but requires layer function to display the graphic
p <- ggvis(forbes, x = ~sales, y = ~marketvalue)
layer_points(p)

# rewrite with %>% (pronounced pipe) func
forbes %>%
  ggvis(x = ~sales, y = ~marketvalue) %>%
  layer_points()

# x and y can be dropped out
forbes %>%
  ggvis(~sales, ~marketvalue) %>%
  layer_points()

# rewrite with %>% (pronounced pipe) func
forbes %>%
  ggvis(~sales, ~profits,shape=~country) %>%
  layer_points()

# add $country to describe the shape (or fill, stroke, size)
forbes %>%
  ggvis(~sales, ~marketvalue,stroke=~country) %>%
  layer_points()

forbes %>%
  ggvis(~sales, ~profits,size=~marketvalue) %>%
  layer_points()

forbes %>%
  ggvis(~sales, ~marketvalue,fill=~country) %>%
  layer_points()
# Make the points a fixed property (use := instead of =)

forbes %>%
  ggvis(~sales, ~marketvalue,fill:="blue",stroke := "black",shape=~country) %>%
  layer_points()
# Add interactivity
# add size and opacity sliders
forbes %>%
  ggvis(x=~sales, y=~marketvalue,fill:="blue",stroke := "black",shape=~country,size := input_slider(10, 100),opacity := input_slider(0, 1)) %>%
  layer_points()
# Layer visual elements by histograms with additional
forbes %>% 
  ggvis(~profits) %>% 
  layer_histograms(width =  input_slider(0, 30, step = 1, label = "width"),
                   center = input_slider(-15, 15, step = 1, label = "center"),fill:="#E74C3C") %>%
  add_axis("x", title = "Profit") %>%  
  add_axis("y", title = "Bin Count")