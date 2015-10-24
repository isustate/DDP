library(shiny)

function(input, output) {
  
    dataset <- mtcars
    output$HeaderSize <- renderPrint((input$HeaderSize))
    output$HeaderLabel <- renderPrint(paste('First ',input$HeaderSize,' Rows of mtcars'))
    output$HeaderData <- renderPrint(head(dataset, n = input$HeaderSize))

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
  
}