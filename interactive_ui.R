library(shiny)
ui3 <- (fluidPage(
  headerPanel(title = "Top League shiny app"),
  sidebarLayout(
    sidebarPanel(
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("Bundesliga", "Premier League", "Ligue One")),
      
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10)
      ),
    
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Data", tableOutput("view")),
                  tabPanel("Summary", verbatimTextOutput("summ"))
    )
  )
)
)
)

