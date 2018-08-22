# shinykeyboard
_A basic touch screen keyboard for R shiny apps._


## Installation

To install, run:
```
if (!require(devtools)) {
  install.packages('devtools')
}
devtools::install_github('Emelieh21/shinykeyboard')
```

## Usage

This package contains two functions: `generateVirtualKeyboard()` and `activateVirtualKeyboard()`. For usage see the following example:

_apps.R_
```
library(shiny)
library(shinykeyboard)

textIds = c("text", "text2")
keyboard <- generateVirtualKeyboard(textIds)

ui <- fluidPage(
  activateVirtualKeyboard(keyboard),
  textInput("text","Write something:"),
  textInput("text2","Write something more:"),
  textOutput("content")
)

server <- function(input, output, session){
  output$content <- renderText({
    paste0(input$text," ",input$text2)
  })
}

shinyApp(ui,server)
```


![image](/assets/screenshot.png)



## About the virtual keyboard

The integrated virtual keyboard is a jQuery on-screen keyboard (OSK) plugin that works in the browser. Originally posted by Jeremy Satterfield in his [blog](http://jsatt.blogspot.com/2010/01/on-screen-keyboard-widget-using-jquery.html), [jQuery plugins](http://plugins.jquery.com/project/virtual_keyboard) and on [Snipplr](http://snipplr.com/view/21577/virtual-keyboard-widget/). Currently maintained by [Mottie](https://github.com/Mottie/Keyboard). For more information, see the keyboards' repository [here](https://github.com/Mottie/Keyboard). 



> To do:
>
> * Update package DESCRIPTION
> * Expand readme
> * Implement in app https://github.com/Emelieh21/touch-screen-pi-sonos-app