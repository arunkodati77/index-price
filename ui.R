library(shiny)
library(shinyalert)
# UI for the Shiny app
ui <- fluidPage(
  tags$div(id="header-argus",
    tags$img(src = "./img/argus-media.png", height = "50px"),
    tags$p(id="header-text",strong("Index Price Calculation")),
  ),
  useShinyalert(),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "./css/style.css")
  ),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      fluidRow(
        actionButton("calculate", "Process",class = "btn-primary"),
        downloadButton("downloadData", "Download Sample")
      ),
      
      uiOutput("note")
    ),
    mainPanel(
      
      uiOutput("index_table"),
      plotOutput("barPlot")
    )
  )
)
