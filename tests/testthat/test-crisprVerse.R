context("test-crisprVerse.R")

core <- c("crisprBase",
          "crisprBowtie",
          "crisprScore",
          "crisprDesign",
          "crisprViz")

test_that("crisprVerse packages returns character vector of package names", {
    out <- crisprVerse_packages(include_self=FALSE)
    out <- out[grep("^crispr[A-Z][a-z]+", out)]
    expect_type(out, "character")
    expect_setequal(out, core)  

    out <- crisprVerse_packages(include_self=TRUE)
    out <- out[grep("^crispr[A-Z][a-z]+", out)]
    expect_type(out, "character")
    expect_setequal(out, c(core, "crisprVerse"))  
})



test_that("crisprVerse_update works as intended", {
    str <- capture.output(crisprVerse_update())
    expect_true(length(str) == 1)
    expect_true(grepl("All.*up-to-date", str))
})
