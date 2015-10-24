library(shiny)

dataset <- mtcars

fluidPage(

  titlePanel("Mtcars Data Explorer"),

  sidebarPanel(

    h4('This ShinyApp explores the variables in the mtcars data.  '),
    h4('Move the slider to see how many sample rows of data on the right.'),
    sliderInput('HeaderSize', 'Rows of Sample Data to Display', min=1, max=nrow(dataset),
                value=9, step=4, round=1),

    h4('Select a variable to explore to see descriptive statistics and a histogram.'),
    selectInput('VarOfInterest', 'Variable to Examine', c(None='.', names(dataset))),

    h4('Select a second variable to see a scatter plot with fit lines.'),
    selectInput('CorrVar', 'Variable to Correlate', c(None='.', names(dataset))),
    
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