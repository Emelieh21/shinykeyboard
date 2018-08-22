#' Function that generates and loads the necessary js/css scripts for the virtual keyboard to work
#' @param textIds character or list with characters, indicating the id's of the textInputs where the virtual keyboard should be applied
#'
#' @author Emelie Hofland, \email{emelie_hofland@hotmail.com}
#'
#' @examples
#' keyboard <- generateVirtualKeyboard(textIds)
#'
#' @export
#' 
generateVirtualKeyboard <- function(textIds){
  # function to help
  paste8 <- function(..., sep = " ", collapse = NULL) {
    args <- c(
      lapply(list(...), enc2utf8),
      list(
        sep = if (is.null(sep)) sep else enc2utf8(sep),
        collapse = if (is.null(collapse)) collapse else enc2utf8(collapse)
      )
    )
    do.call(paste, args)
  }
  # prepare js and css scripts
  jscode  <- readLines(system.file("js/jquery.keyboard.js", package = "shinykeyboard"), warn = FALSE, encoding = "UTF-8")
  jscode <- HTML(paste8(jscode, collapse = "\r\n"))
  jscodeExtended  <- readLines(system.file("js/jquery-ui.min.js", package = "shinykeyboard"), warn = FALSE, encoding = "UTF-8")
  jscodeExtended <- HTML(paste8(jscodeExtended, collapse = "\r\n"))
  csscode <- readLines(system.file("css/keyboard.css", package = "shinykeyboard"), warn = FALSE, encoding = "UTF-8")
  csscode <- HTML(paste8(csscode, collapse = "\r\n"))
  csscodeExtended <- readLines(system.file("css/jquery-ui.min.css", package = "shinykeyboard"), warn = FALSE, encoding = "UTF-8")
  csscodeExtended <- HTML(paste8(csscodeExtended, collapse = "\r\n"))
  
  bindjs <- "jQuery(function($) {"
  for (id in textIds){
    include <- paste0("$('#",id,"').keyboard({ layout: 'qwerty' });$('.version').html( '(v' + $('#",id,"').getkeyboard().version + ')' );")
    bindjs <- paste0(bindjs, include)
  }
  bindjs <- paste0(bindjs, "});")
  
  result <- list(jscode,jscodeExtended,csscode,csscodeExtended,bindjs)
  return(result)
}
