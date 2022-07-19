pkgs <- c("crisprBase",
          "crisprScore",
          "crisprBowtie",
          "crisprDesign")

pkgs_unloaded <- function(){
    search <- paste0("package:", pkgs)
    pkgs[!search %in% search()]
}


loadPackage <- function(pkg) {
    loc <- if (pkg %in% loadedNamespaces()) dirname(getNamespaceInfo(pkg, "path"))
    do.call("library", list(pkg, 
                            lib.loc=loc,
                            character.only=TRUE,
                            warn.conflicts=FALSE))
}

crisprVerse_attach <- function() {
    pkgsToLoad <- pkgs_unloaded()
    if (length(pkgsToLoad) == 0){
        return(invisible())
    }
    suppressPackageStartupMessages(
        lapply(pkgsToLoad, loadPackage)
    )
    invisible()
}
