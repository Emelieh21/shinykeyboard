#' Function that generates js to bind keyboard to textIds that are generated in the serverside
#' @param textIds character or list with characters, indicating the id's of the textInputs where the virtual keyboard should be applied
#'
#' @author Emelie Hofland, \email{emelie_hofland@hotmail.com}
#'
#' @examples
#' observeEvent(input$text, {
#'     shinyjs::runjs(updateKeyboard("text"))
#'  })
#'
#' @export
#' 
updateKeyboard <- function(textIds) {
  bindjs <- "jQuery(function($) {"
  for (id in textIds) {
    include <- paste0("$('#", id, "').keyboard({ layout: 'qwerty' });$('.version').html( '(v' + $('#", 
                      id, "').getkeyboard().version + ')' );")
    bindjs <- paste0(bindjs, include)
  }
  bindjs <- paste0(bindjs, "});")
  return(bindjs)
}
