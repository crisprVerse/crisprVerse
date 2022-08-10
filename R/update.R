#' Update crisprVerse packages
#'
#' This will check to see if all crisprVerse packages (and optionally, their
#' dependencies) are up-to-date, and will install after an interactive
#' confirmation.
#'
#' @inheritParams crisprVerse_deps
#' @export
#' @examples
#' if (interactive()){
#'     crisprVerse_update()
#' }
#' @importFrom cli cat_line cat_bullet
#' @importFrom cli pluralize
crisprVerse_update <- function(recursive=FALSE){
    deps <- crisprVerse_deps(recursive)
    behind <- deps[deps$behind,,drop=FALSE]


    if (nrow(behind) == 0){
        cli::cat_line("All crisprVerse packages up-to-date")
        return(invisible())
    }

    cli::cat_line(cli::pluralize(
        "The following {cli::qty(nrow(behind))}package{?s} {?is/are} out of date:"
    ))
    cli::cat_line()
    cli::cat_bullet(format(behind$package), " (", behind$local, " -> ", behind$bioc, ")")

    cli::cat_line()
    cli::cat_line("Start a clean R session then run:")

    pkg_str <- paste0(deparse(behind$package), collapse = "\n")
    cli::cat_line("BiocManager::install(", pkg_str, ")")

    invisible()
}



#' List all crisprVerse dependencies
#'
#' @param recursive If \code{TRUE}, will also list all dependencies of
#'   crisprVerse packages.
#' @export
#' @importFrom utils available.packages
#' @importFrom tools package_dependencies
#' @importFrom BiocManager repositories
crisprVerse_deps <- function(recursive = FALSE){
    repos <- suppressMessages(BiocManager::repositories())
    pkgs <- utils::available.packages(repos = repos)
    deps <- tools::package_dependencies("crisprVerse", pkgs, recursive = recursive)

    pkg_deps <- unique(sort(unlist(deps)))

    base_pkgs <- c("base", "compiler", "datasets", "graphics", "grDevices", "grid",
                   "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk",
                   "utils", "stringr", "readr", "BiocManager", "rlang", "cli")
    pkg_deps <- setdiff(pkg_deps, base_pkgs)

    bioc_version <- lapply(pkgs[pkg_deps, "Version"], base::package_version)
    local_version <- lapply(pkg_deps, packageVersion)

    behind <- vapply(seq_along(bioc_version), function(i){
        bioc_version[[i]] > local_version[[i]]
    }, FUN.VALUE=TRUE)
    
    bioc_version <- vapply(bioc_version, function(x){
        as.character(x)
    }, FUN.VALUE="a")
    local_version <- vapply(local_version, function(x){
        as.character(x)
    }, FUN.VALUE="a")


    out <- data.frame(package = pkg_deps,
                      bioc = bioc_version,
                      local = local_version,
                      behind = behind)
    return(out)
}

#' @importFrom utils packageVersion
#' @importFrom rlang is_installed
packageVersion <- function(pkg){
    if (rlang::is_installed(pkg)){
        out <- utils::packageVersion(pkg)
    } else {
        out <- 0
    }
    return(out)
}


