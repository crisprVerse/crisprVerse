.onAttach <- function(...) {
    needed <- pkgs[!is.attached(pkgs)]
    if (length(needed) == 0){
        return()
    }
    crisprVerse_attach()
}

is.attached <- function(x) {
    paste0("package:", x) %in% search()
}
