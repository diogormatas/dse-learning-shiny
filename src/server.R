
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#



shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2]
    # bins <- seq(min(x), max(x), length.out = input$slider + 1)
    # 
    # # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Edgar Anderson's Iris Data")
  })

  output$progressBox <- renderValueBox({
    valueBox(
      paste0(25 + input$slider, "%"), "Progress", icon = icon("list"),
      color = "purple"
    )
  })
  
  output$approvalBox <- renderValueBox({
    valueBox(
      "80%", "Approval", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
  
  output$table <- renderDataTable(iris)
  
  output$sum <- renderPrint({
    
    summary(iris)
  })
})
