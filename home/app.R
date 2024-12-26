library(shiny)

ui <- fluidPage(
  titlePanel("HOME"),
  fluidRow(
    style = "height: 200px;"
  ),
  fluidRow(
    column(
      width = 6,
      a(
        style = "height: 200px;text-align: center;background-color: #4169E1;",
        href = "/app1/",
        class = "btn btn-primary btn-block btn-lg",
        "Go to 1st Shiny App"
      )
    ),
    column(
      6,
      a(
        style = "height: 200px;text-align: center;background-color: #FF8C00;",
        href = "/app2/",
        class = "btn btn-primary btn-block btn-lg",
        "Go to 2nd Shiny App"
      )
    )
  )
)

server <- function(input, output, session) {
}

shinyApp(
  ui = ui,
  server = server,
  options = list(
    host = "0.0.0.0"
  )
)
