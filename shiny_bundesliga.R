library(shiny)
ui1 <- fluidPage(
  headerPanel(title = "Bundesliga season statistics"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "select the year", c("2014" = "2014", "2015" = "2015", "2016" = "2016", "2017" = "2017", "2018" = "2018", "2019" = "2019"))
    
      ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Data", tableOutput("full_bundes")),
                  tabPanel("Summary", verbatimTextOutput("summ")))
    )
  )
)




library(shiny)
server1 <- function(input, output) {
  output$full_bundes <- renderTable({
    full_bundes
  })
  
  output$summ <- renderPrint({
    summary(full_bundes)
  })
  
}


shinyApp(ui1, server1)
