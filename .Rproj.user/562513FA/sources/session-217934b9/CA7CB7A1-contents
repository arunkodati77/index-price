library(shiny)
library(ggplot2)
library(reshape2)
library(dplyr)
library(data.table)
options(shiny.maxRequestSize = 30*1024^2)
source("utils.R")

server <- function(input, output) {
  index_data_reactive_Val <- reactiveVal(NULL)
  output$index_table <- renderUI({
    tagList(
      tags$h3("No Data"),
      tags$h4("Please upload deals data to calculate index prices")
    )
    
  })
  observeEvent(input$calculate, {
    req(input$file1)

    if(grepl("csv",input$file1$type)){
      deals <- fread(input$file1$datapath)
      
      #Assumed User will always upload teh csv with same column Names
      if(all(names(deals) %in% c("ID","DEAL DATE","COMMODITY",
                                 "COMMODITY SOURCE LOCATION","DELIVERY LOCATION",
                                 "DELIVERY MONTH","DELIVERY YEAR","VOLUME","PRICE"))){
        
        # Assume we are calculating the index price for only Coal
        deals <- deals|>filter(COMMODITY=="Coal")
        coal2_data <- calculate_index_price(deals, "COAL2")
        coal4_data <- calculate_index_price(deals, "COAL4")
        
        index_data <- left_join(coal2_data%>%select(deal_date,coal2_index_price = index_price),
                               coal4_data%>%select(deal_date,coal4_index_price = index_price),by="deal_date")
        
        index_data_reactive_Val(index_data)
        output$index_table <- renderUI({
          renderTable({
            
            index_data_reactive_Val()
            
            })
        })
        
      }else{
        shinyalert("Warning", "Uploaded csv file must be same as template.", type = "warning")
      }
      
    }else{
      shinyalert("Warning", "Only accepts csv file", type = "warning")
    }
    
    
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      "sample-data.csv"  # Name of the file to be downloaded
    },
    content = function(file) {
      # Path to the file to be downloaded
      file.copy("www/data/sample-data.csv", file)
    }
  )
  
  output$barPlot <- renderPlot({
    req(index_data_reactive_Val())
    data_melted <- melt(index_data_reactive_Val(), id.vars = "deal_date", variable.name = "Index", value.name = "Price")
    
    ggplot(data_melted, aes(x = deal_date, y = Price, fill = Index)) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(x = "Deal Date", y = "Index Price", title = "Coal Index Prices") +
      scale_fill_manual(values = c("coal2_index_price" = "#4d9de1", "coal4_index_price" = "#add3f3"), 
                        labels = c("Coal 2 Index Price", "Coal 4 Index Price")) +
      theme_minimal() + theme(plot.title = element_text(hjust = 0.5, size = 24))
  })
  
  
  output$note <- renderUI({
    tagList(
      tags$h5(strong("Note:")),
      tags$p("1) COAL2 index are delivered into Northwest Europe (delivery location in ARA, AMS, ROT, ANT)."),
      tags$p("2) COAL4 index are delivered from South Africa.")
    )
  })
}
