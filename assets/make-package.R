library(devtools)
library(dplyr)

#create("naRTools")
setwd(gsub("/assets","",dirname(rstudioapi::getSourceEditorContext()$path)))
document()
build()
install()