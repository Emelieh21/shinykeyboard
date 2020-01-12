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

This package contains two functions: `generateVirtualKeyboard()` and `activateVirtualKeyboard()`. 

The input for the `generateVirtualKeyboard()` is the `inputId` (or a list of multiple `inputId`'s) of the `textInput()` fields. The touch screen keyboard will open automatically when any of these input field are clicked. `generateVirtualKeyboard()` needs to be executed before the `ui` is generated, and the `activateVirtualKeyboard()` function within the `ui`.

For usage see the following example:

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


## On the Raspberry Pi with Touchscreen Display

I needed a virtual keyboard for a R Shiny app running on my touch screen Raspberry Pi, because (unlike IPad's and smartphones) this device doesn't open a keyboard automatically when a text input field is clicked. To install the shinykeyboard package with devtools, you might need to install devtools first. If the installation of devtools gives you errors, it might be that you need to install the following two dependencies first:

```
sudo apt-get install libgit2-dev
sudo apt-get install libssl-dev
```

## Don't like gray, QWERTY keyboards?

Feel free to contribute and improve this keyboard integration. It should be totally possible to have more options to customize the layout. I am not the biggest JS star (honestly, I don't know JS _at all_), so please, feel very welcome to improve the scripts.