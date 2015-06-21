library(shiny)
library(ggplot2)
dataMal <- readRDS("./data/malariadata.rds")
dataMal$Country <- as.factor(dataMal$Country)

function(input, output) {
      dataset <- reactive({
            a <- data.frame("Country" = dataMal[ ,1], "deaths" = dataMal[ ,input$y])
            a <- subset(a, a$deaths > input$thres)
            return(a)
            })
     
      output$plot <- renderPlot({
            p <- ggplot(dataset(), aes(x = Country, y = deaths)) + geom_point(color = "#86458d", size = 5) + geom_point(color = "#fff7fa", size = 3) + labs(y = "Number of deaths", x = "") + theme (axis.text =element_text(size = 9), axis.title =element_text(size=11)) + coord_flip() + scale_y_log10()
            print(p)
      })
      
      # Generate a summary of the data
      output$summary <- renderPrint({
            summary(dataMal[ ,input$y])
      })
      output$subdata <- renderTable({
            dataset()
            
      })
      
}