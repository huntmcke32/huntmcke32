library(shiny)
server3 <- (function(input,output) {
  
  datasetInput <- reactive({
    switch(input$dataset,
           "Bundesliga" = full_bundes,
           "Premier League" = full_epl,
           "Ligue One" = full_ligue)
  })
  
  output$summ <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  
})
