#' Function that activates a virtual keyboard
#' @param keyboard list of js/css scripts generated with generateVirtualKeyboard() function
#'
#' @author Emelie Hofland, \email{emelie_hofland@hotmail.com}
#'
#' @examples
#' activateVirtualKeyboard("text")
#'
#' @export
#' 
activateVirtualKeyboard <- function(keyboard) {
  tags$head(
    tags$script(keyboard[1]),
    tags$script(keyboard[2]),
    tags$style(keyboard[3]),
    tags$style(keyboard[4]),
    tags$script(keyboard[5])
  )
}
