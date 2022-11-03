# Similar to the tidyverse package attach.R file

core <- c("crisprBase",
          "crisprBowtie",
          "crisprScore",
          "crisprScoreData",
          "crisprDesign",
          "crisprViz")

core_unloaded <- function(){
    search <- paste0("package:", core)
    core[!search %in% search()]
}


loadPackage <- function(pkg) {
    loc <- if (pkg %in% loadedNamespaces()) dirname(getNamespaceInfo(pkg, "path"))
    do.call("library", list(pkg, 
                            lib.loc=loc,
                            character.only=TRUE,
                            warn.conflicts=FALSE))
}

crisprVerse_attach <- function(){
    pkgsToLoad <- core_unloaded()
    if (length(pkgsToLoad) == 0){
        return(invisible())
    }
    suppressPackageStartupMessages(
        lapply(pkgsToLoad, loadPackage)
    )
    invisible()
}
