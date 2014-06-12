library(shiny)
library(datasets)
library(randomForest)

data(iris);

classifier <- randomForest(x=iris[,1:4],y=iris$Species);

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <- iris[, as.numeric(input$feature)]  # Old Faithful Geyser data
    # draw the histogram with the specified number of bins
    hist(x, col = input$color, border = 'white')
  })
  
  output$predicted <- renderText({
    inputClass <- vector();
    inputClass[1] <- as.numeric(input$seplen)
    inputClass[2] <- as.numeric(input$sepwid)
    inputClass[3] <- as.numeric(input$petlen)
    inputClass[4] <- as.numeric(input$petwid)
    out <- predict(classifier,inputClass);
    classifier$classes[out];
    });
  
  output$dataTable <- renderTable({
    if (input$useFilter == "TRUE") {
     if (as.numeric(input$featureFilter)<=4){
       value <-  as.numeric(input$valueFilter);
     } else {
       value <- input$valueFilter;
     }
     tempSet <- subset(iris,iris[, as.numeric(input$featureFilter)]==value);
     if (nrow(tempSet)==0){
       tempSet <- data.frame();
     }
     tempSet;
    } else {
     iris
    }
    });
  #}
  
})
