# Similar to the tidyverse package utils.R file

#' List all packages in the crisprVerse
#'
#' @param include_self Include crisprVerse in the list?
#' @export
#' @importFrom utils packageDescription
#' @examples
#' crisprVerse_packages()
crisprVerse_packages <- function(include_self=TRUE){
    raw <- utils::packageDescription("crisprVerse")$Imports
    imports <- strsplit(raw, ",")[[1]]
    parsed <- gsub("^\\s+|\\s+$", "", imports)
    names <- vapply(strsplit(parsed, "\\s+"), "[[", 1,
                    FUN.VALUE = character(1))

    if (include_self){
        names <- c(names, "crisprVerse")
    }
    return(names)
}
