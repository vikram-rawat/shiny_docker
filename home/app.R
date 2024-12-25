library(shiny)

ui <- fluidPage(
  titlePanel("HOME"),
  h1("home"),
  fluidRow(
    column(6, a(href = "/app1", class = "btn btn-primary", "Go to App 1")),
    column(6, a(href = "/app2", class = "btn btn-primary", "Go to App 2"))
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
