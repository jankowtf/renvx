testfixture_copy_renv_lock <- function() {
    fs::file_copy(
        here::here("renv.lock"),
        test_path("renv.lock"),
        overwrite = TRUE
    )
}
