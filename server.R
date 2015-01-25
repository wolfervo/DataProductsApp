library(ggplot2)
CompInt <- function(invest, rate, years) invest*(1+rate)^years


shinyServer(
      function(input, output) {
            output$inputinvest <- renderPrint({input$invest})
            output$inputrate <- renderPrint({input$rate})
            output$inputyears <- renderPrint({input$years})
            output$projection <- renderPrint({CompInt(input$invest, input$rate, input$years)})
            output$newPlot <- renderPlot({
                  time <- 1:input$years
                  value <- CompInt(input$invest, input$rate, time)
                  pd <- as.data.frame(cbind(time, value))
                  tvplot <- ggplot(data=pd, aes(x=time, y=value)) + 
                        geom_point(aes(size = value), col = "dark blue") +
                        geom_line(col = "dark blue") + xlab("Years Compounded") + 
                        ylab("Investment Value") +
                        ggtitle("Projected Value of Investment Over Time")
                  tvplot
                  })
            })