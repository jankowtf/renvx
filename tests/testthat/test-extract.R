test_that("Extract package names", {
  result <- extract_packages("renv.lock")

  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("Extract packages for renv::install", {
  result <- extract_packages_for_renv_install("renv.lock")

  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("Extract package names", {
  result <- extract_cran_packages("renv.lock")

  expect_type(result, "character")
  expect_true(length(result) > 0)
})
