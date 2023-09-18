library(shiny)
ui2 <- fluidPage(
  headerPanel(title = "Premier League season statistics"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "select the year", c("2014" = "2014", "2015" = "2015", "2016" = "2016", "2017" = "2017", "2018" = "2018", "2019" = "2019"))
      
    ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Data", tableOutput("full_epl")),
                  tabPanel("Summary", verbatimTextOutput("summ")))
    )
  )
)



library(shiny)
server2 <- function(input, output) {
  output$full_epl <- renderTable({
    full_epl
  })
  
  output$summ <- renderPrint({
    summary(full_epl)
  })
  
}

shinyApp(ui2, server2)
