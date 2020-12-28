test_that("Set options", {
  result <- set_options()

  target <- list(
    repos = c(RSPM = "https://packagemanager.rstudio.com/all/__linux__/focal/latest"),
    pkgType = "binary"
  )

  expect_identical(result, target)

  expect_identical(getOption("repos"), target$repos)
  expect_identical(getOption("pkgType"), target$pkgType)
})
