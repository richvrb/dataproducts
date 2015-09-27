library(shiny)

shinyUI(pageWithSidebar(
  
  
  headerPanel("miles per gallon prediction for cars"),
  sidebarPanel( 
      
      sliderInput("weight", 
                  label = "Weight in lb/1000", 
                  value = 0.5,
                  min = 1.0, 
                  max = 6.0,
                  step = 0.1
                ),
  
     sliderInput( "cyl", 
                  label = "Number of cylinders in the engine", 
                   value = 4,
                   min = 1, 
                   max = 8,
                   step = 1
                )
    ),
  
  mainPanel(
      tabsetPanel(
              tabPanel("documentation",tableOutput("Documentation")),
              tabPanel("Basic", plotOutput("plot")), 
              tabPanel("Cylinders", plotOutput("plotCyl")),
              tabPanel("Shift Type ", plotOutput("plotAm")),
              tabPanel("#Gears", plotOutput("plotGear")), 
              tabPanel("Table", tableOutput("table")),
              tabPanel("Model", tableOutput("model")),
              tabPanel("Predict", tableOutput("predictValue"))
      )
  )  
)
)