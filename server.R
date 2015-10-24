library(shiny)
library(ggplot2)

function(input, output) {
  
    dataset <- mtcars
    output$HeaderSize <- renderPrint((input$HeaderSize))
    output$HeaderLabel <- renderPrint(paste('First ',input$HeaderSize,' Rows of mtcars'))
    output$HeaderData <- renderPrint(head(dataset, n = input$HeaderSize))

#    output$Test <- renderPrint(input$VarOfInterest)

    output$SummaryData <- renderPrint(
      if(paste(input$VarOfInterest) != '.') 
      {
        summarydata <- dataset[,paste(input$VarOfInterest)]
        summary(summarydata)
      } 
    )

    output$histogram <- renderPlot({
      if(paste(input$VarOfInterest) != '.') 
      {
          histdata <- dataset[,paste(input$VarOfInterest)]
          hist(histdata, main = paste('Histogram of ',input$VarOfInterest), xlab = input$VarOfInterest)
      }
      })

    output$scatter <- renderPlot({
      if(paste(input$VarOfInterest) != '.' && paste(input$CorrVar) != '.') 
      {
        scatterdata1 <- dataset[,paste(input$VarOfInterest)]
        scatterdata2 <- dataset[,paste(input$CorrVar)]
        plot(scatterdata1, scatterdata2, main = paste('Scatterplot'),xlab=input$VarOfInterest, ylab = input$CorrVar)
        abline(lm(scatterdata2~scatterdata1), col="red")
        lines(lowess(scatterdata1,scatterdata2), col="blue")
      }
    })

    
#    output$plot <- c('Hi Mom')
#     output$plot <- renderPlot({
#     
#     p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
#     
#     if (input$color != 'None')
#       p <- p + aes_string(color=input$color)
#     
#     facets <- paste(input$facet_row, '~', input$facet_col)
#     if (facets != '. ~ .')
#       p <- p + facet_grid(facets)
#     
#     if (input$jitter)
#       p <- p + geom_jitter()
#     if (input$smooth)
#       p <- p + geom_smooth()
#     
#     print(p)
#     
#   }, height=700)
  
}