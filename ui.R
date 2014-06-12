library(shiny)

shinyUI(navbarPage("Iris RandomForest Classifier",
                   tabPanel("Welcome",h2("Shiny App for Coursera's course 'Developing Data Products'"),
                                      h3("This app uses the iris dataset."),
                            
                            HTML("This app contains three tabs:<br/>
<ol>
<li>In the first one, called 'Descriptive Analitics', the user can view an histogram of each feature present in the iris dataset. </li>
<li>In the second one, called 'Prescriptive Analitycs', a Random Forest classifier is trained and it tries to guess the Species value for the data introduced by the user.</li>
<li>In the third and last one, called 'Raw Data', the user can visualize the original dataset. In this tab the user can filter the samples using the form provided.</li></ol>")),
                   
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
                                     plotOutput("distPlot")
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
