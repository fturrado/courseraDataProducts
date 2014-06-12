library(shiny)

shinyUI(navbarPage("Iris RandomForest Classifier",
                   tabPanel("Descriptive Analitycs",
                            sidebarLayout(
                                   sidebarPanel(
                                     selectInput("feature", label = h3("Feature"), 
                                                 choices = list("Sepal.Length" = 1, "Sepal.Width" = 2,
                                                                "Petal.Length" = 3, "Petal.Width" = 4
                                                                ), selected = 1),
                                     selectInput("color", label = h3("Bar Color"), 
                                                 choices = list("Blue" = "blue", "Red" = "red",
                                                                "Green" = "green", "Black" = "black"
                                                 ), selected = "blue")
                                   ),
                                   
                                   # Show a plot of the generated distribution
                                   mainPanel(
                                     plotOutput("distPlot"),
                                     plotOutput("anotherPlot")
                                   )
                                 )
                            ),
                   tabPanel("Predictive Analitycs",
                            sidebarLayout(
                              sidebarPanel(
                                numericInput("seplen", 
                                             label = h6("Sepal Lenght"), 
                                             value = 0),
                                numericInput("sepwid", 
                                           label = h6("Sepal Width"), 
                                           value = 0)  ,
                                numericInput("petlen", 
                                         label = h6("Petal Lenght"), 
                                         value = 0)  ,
                   numericInput("petwid", 
                                label = h6("Petal Width"), 
                                value = 0)  
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(h3("Forecast"),
                                        textOutput("predicted")                          
                              )
                            )
                   ),
                   tabPanel("Raw Data",
                            sidebarLayout(
                              sidebarPanel(
                                checkboxInput("useFilter",label="Apply filter",value=FALSE),
                                selectInput("featureFilter", label = h3("Feature Filter"), 
                                            choices = list("Sepal.Length" = 1, "Sepal.Width" = 2,
                                                           "Petal.Length" = 3, "Petal.Width" = 4,
                                                           "Species" = 5), selected = 1),
                                textInput("valueFilter", 
                                             label = h6("Value"), 
                                             value = 5.10)
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(
                                tableOutput("dataTable")
                              )
                            )
                    )
))
