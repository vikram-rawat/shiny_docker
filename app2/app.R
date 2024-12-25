library(shiny)

ui <- fluidPage(
  titlePanel("Hello app2!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "obs",
        "Number of Observations",
        min = 10,
        max = 1000,
        value = 200
      ),
      radioButtons(
        "action",
        "Choose an Actions: ",
        choices = c(
          "Run" = "run",
          "Crash" = "crash"
        )
      )
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(
    input$action,
    {
      if (input$action == "crash") {
        stopApp("App Crashed as Requested")
      }
    }
  )

  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = "darkorange")
  })
}

shinyApp(
  ui = ui,
  server = server,
  options = list(
    host = "0.0.0.0"
  )
)
