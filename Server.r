shinyServer(function(input, output) {
 
  
model <- reactive ({
    model1 <- glm(mpg~wt + cyl, data=mtcars)
    
  model1
})  
  


PrValue <- reactive ({
  newData <- data.frame(wt=c(input$weight),cyl=(input$cyl))
  model2 <- predict(model(),newdata=newData)
  model2
})

output$Documentation <- renderUI({
    str1 <- paste("This is a small application that calculates the expected miles per gallon")
    str2 <- paste(" ")
    str3 <- paste("the application takes into account")
    str4 <- paste("- the weight of the car")
    str5 <- paste("- the number of cylinders of the car")
    str6 <- paste("")
    str7 <- paste("Beside weight other features are examined to see whether they influence miles per gallon. The features examined are")
    str8 <- paste("- the number of cylinders of the car, which do have impact")
    str9 <- paste("- the type of shift, there seems to be very limited influence and the feature is not used for prediction")
    str10 <- paste("- the number of gears, there seems to be very limited influence and the feature is not used for prediction")
    str11 <- paste("- the number of cylinders of the car")
    str12 <- paste("")
    str13 <- paste("The application contains the following tabs")
    str14 <- paste("- basic     , This demonstrates a strong relationship between miles per gallon and weight")
    str15 <- paste("- Cylinders , This demonstrated that there is an impact on the amount of cylinders")
    str16 <- paste("- Shift type, There is almost no impact between shift types manual/automatic")
    str17 <- paste("- #gears    , There is almost no impact between the number of gears")
    str18 <- paste("- Table     , This is an overview of the dataset used")
    str19 <- paste("- Model     , This is an overview of the prediction model")
    str20 <- paste("- Predict   , This is the prediction application")
    HTML(paste(str1, str2,str3,str4,str5,str6,str7,str8,str9,str10,str11,str12,str13,str14,str15,str16,str17,str18,str19,str20, sep = '<br/>'))
  })



  output$plotCyl <- renderPlot({
    coplot(mpg ~ wt | as.factor(cyl), data = mtcars, xlab = ("Car Weight"), ylab = ("Miles per gallon"), panel = panel.smooth, rows = 1)
  })

  output$plotAm <- renderPlot({
    coplot(mpg ~ wt | as.factor(am), data = mtcars, xlab = ("Car Weight"), ylab = ("Miles per gallon"), panel = panel.smooth, rows = 1)
  })

  output$plotGear <- renderPlot({
    coplot(mpg ~ wt | as.factor(gear), data = mtcars, xlab = ("Car Weight"), ylab = ("Miles per gallon"), panel = panel.smooth, rows = 1)
  })


  output$plot <- renderPlot({
      plot(mtcars$mpg, mtcars$wt ,type = "p")
  })
  
  output$summary <- renderTable({
    summary(mtcars)
  })
  
  output$model <- renderTable({
    summary(model())
  })
  
  
  output$table <- renderTable({
    mtcars
  })
  
  output$predictValue <- renderUI({
    str1 <- paste("Weight of the car", input$weight)
    str2 <- paste("Number of cylinders", input$cyl)
    str3 <- paste("predicted miles per gallon",as.data.frame(PrValue()) )
    HTML(paste(str1, str2,str3, sep = '<br/>'))
  })

})
