library(shiny)
library(shinyjs)
library(shinykeyboard)
library(shinydashboard)

textIds = c("text1", "text2")
keyboard <- generateVirtualKeyboard(textIds)

ui <- dashboardPage(
  dashboardHeader(title = "Quick Example"),
  dashboardSidebar(textInput("text1", "Text 1")),
  dashboardBody(
    useShinyjs(),
    activateVirtualKeyboard(keyboard),
    textInput("text2", "Text 2"),
    textOutput("content1"),
    textOutput("content2"),
    uiOutput("main_input")
  )
)
server <- function(input, output) {
  output$main_input <- renderUI({
    isolate({
      fluidRow(
        column(width = 6, textInput(inputId = "text3", label = "Text 3")),
        column(width = 6, textInput(inputId = "text4", label = "Text 4"))
      )
    })
  })
  # Make keyboard bind to new inputs
  observeEvent({input$text3
                input$text4}, {
      shinyjs::runjs(updateKeyboard(c("text3","text4")))
    })
  output$content1 <- renderText({
    paste0(input$text1)
  })
  output$content2 <- renderText({
    paste0(input$text2)
  })
}
shinyApp(ui, server)