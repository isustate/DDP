library(shiny)
library(ggplot2)

dataset <- mtcars

fluidPage(

  titlePanel("Data Set Explorer"),

  sidebarPanel(

    sliderInput('HeaderSize', 'Rows of Sample Data to Display', min=1, max=nrow(dataset),
                value=9, step=4, round=1),

    h4('Select a variable to explore'),
    selectInput('VarOfInterest', 'Variable to Examine', c(None='.', names(dataset))),

    selectInput('CorrVar', 'Variable to Correlate', c(None='.', names(dataset))),
    
#    selectInput('x', 'X', names(dataset))
#     selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
#     selectInput('color', 'Color', c('None', names(dataset))),
# 
#     checkboxInput('jitter', 'Jitter'),
#     checkboxInput('smooth', 'Smooth'),
# 
#     selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))

  submitButton('Submit')

  ),

  mainPanel(
    verbatimTextOutput("HeaderLabel"), 
    verbatimTextOutput("HeaderData"),
    h4('Here is a summary view of the variable.'),
    verbatimTextOutput("SummaryData"),
    h4('This is a histogram of the variable.'),
    plotOutput('histogram'),
    h4('This is a scatterplot of selected variables.'),
    plotOutput('scatter')
    
    )
)