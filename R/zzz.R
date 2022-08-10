# Similar to the tidyverse package zzz.R file

.onAttach <- function(...) {
    needed <- core[!is.attached(core)]
    if (length(needed) == 0){
        return()
    }
    crisprVerse_attach()
}

is.attached <- function(x) {
    paste0("package:", x) %in% search()
}
