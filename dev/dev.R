# Conventions and best practices ------------------------------------------

usethis::use_news_md()

# Ignore ------------------------------------------------------------------

usethis::use_build_ignore(c("data", "dev", "renv"))

# Package dependencies ----------------------------------------------------

usethis::use_package("jsonlite")
usethis::use_package("magrittr")
usethis::use_package("stringr")

# Tests -------------------------------------------------------------------

usethis::use_test("extract")
usethis::use_test("options")
