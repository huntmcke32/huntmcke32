library(shiny)
ui3 <- fluidPage(
  headerPanel(title = "Ligue One season statistics"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "select the year", c("2014" = "2014", "2015" = "2015", "2016" = "2016", "2017" = "2017", "2018" = "2018", "2019" = "2019"))
      
    ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Data", tableOutput("full_ligue")),
                  tabPanel("Summary", verbatimTextOutput("summ")))
    )
  )
)



library(shiny)
server3 <- function(input, output) {
  output$full_ligue <- renderTable({
    full_ligue
  })
  
  output$summ <- renderPrint({
    summary(full_ligue)
  })
  
}

shinyApp(ui3, server3)

