
# Test fixtures -----------------------------------------------------------

testfixture_copy_renv_lock()

# Extract package names ---------------------------------------------------

test_that("Extract package names from renv.lock", {
  result <- extract_packages(test_path("renv.lock"))

  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("Extract packages for renv::install", {
  result <- extract_packages_for_renv_install(test_path("renv.lock"))

  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("Extract package names", {
  result <- extract_cran_packages(test_path("renv.lock"))

  expect_type(result, "character")
  expect_true(length(result) > 0)
})
