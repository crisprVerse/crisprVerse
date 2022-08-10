context("test-utils.R")

test_that("crisprVerse packages returns character vector of package names", {
  out <- crisprVerse_packages()
  expect_type(out, "character")
  expect_true("crisprBase" %in% out)
})
