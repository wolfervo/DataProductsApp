shinyUI(
      pageWithSidebar(
      headerPanel("Power of Compounding Interest"),
      sidebarPanel(
            h5('A quick and easy way to project the growth of an investment 
               with compounding interest'),
            numericInput('invest', 'Investment in $', 10000, min = 1000, 
                         max = 100000, step = 1),
            sliderInput('rate', 'Interest Rate %', value = 0.05, min = 0.01, 
                        max = 0.1, step = 0.01),
            sliderInput('years', 'Number of Years', value = 15, min = 2, 
                        max = 50, step = 1),
            submitButton('Submit!'),
            hr(),
            h5('Documentation:'),
            p('This is a calculation and graphing app to display the projected 
              value of an investment with compounding interest.'),
            p('The formula is:'),
            p('Projected Value = Investment x (1 + Interest Rate) ^ Years.'),
            p('Please enter an investment amount, then select a interest rate 
              and number of years. Press the Submit! button to refresh the 
              outputs'),
            p('The app returns the projected value and displays a graph of the 
              annual vestment value.')
      ),
      mainPanel(
            h4('Results of Compound Interest'),
            h5('You Entered:'),
            verbatimTextOutput("inputinvest"),
            verbatimTextOutput("inputrate"),
            verbatimTextOutput("inputyears"),
            h5('Which results in a projected value of $'),
            verbatimTextOutput("projection"),
            plotOutput('newPlot')
      )
)
)