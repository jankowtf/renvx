#' Set options
#'
#' Currently:
#' - RSPM (RStudio Package Manager) repo for Ubuntu focal (20.04)
#' - Binary package type
#'
#' @param repos [[character]]
#' @param pkgType [[character]]
#'
#' @return
#' @export
#'
#' @examples
#' set_options()
set_options <- function(
  repos = c(RSPM = "https://packagemanager.rstudio.com/all/__linux__/focal/latest"),
  pkgType = "binary"
) {
  options(
    repos = repos,
    pkgType = pkgType
  )
}
