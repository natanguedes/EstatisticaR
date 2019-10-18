
# Create data for the graph.
x <-  c(21, 62, 10,53)
labels <-  c("London","New York","Singapore","Mumbai")

piepercent<- round(100*x/sum(x), 1)

# Give the chart file a name.


# Plot the chart.
pie(x, labels = piepercent, main = "City pie chart",col = rainbow(length(x)))
legend(1.5, 0.5,  c("London","New York","Singapore","Mumbai"), cex = 0.8,
       fill = rainbow(length(x)))

# Save the file.

