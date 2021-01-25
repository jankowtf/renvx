# library(testthat)
#
# set_options <- function(
#   repos = c(RSPM = "https://packagemanager.rstudio.com/all/__linux__/focal/latest"),
#   pkgType = "binary"
# ) {
#   options(
#     repos = repos,
#     pkgType = pkgType
#   )
# }

test_that("Set options", {
  actual <- set_options()
  print(actual)

  expected <- list(
    repos = c(RSPM = "https://packagemanager.rstudio.com/all/__linux__/focal/latest"),
    pkgType = "binary"
  )

  expect_identical(actual, expected)

  expect_identical(getOption("repos"), expected$repos)
  expect_identical(getOption("pkgType"), expected$pkgType)
})
