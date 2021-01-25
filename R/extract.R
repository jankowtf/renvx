#' Extract vector of packages from renv lockfile
#'
#' @param renv_lock Character. Path to renv.lock.
#'
#' @return Character vector of packages.
#'
#' @keywords internal
#'
#' @export
#'
extract_packages <- function(renv_lock) {
  if (!file.exists(renv_lock)) {
    stop("Could not find renv lockfile: ", renv_lock)
  }
  if (fs::file_info(renv_lock)$size == 0) {
    stop("renv lockfile is empty: ", renv_lock)
  }

  renv_packages <- jsonlite::fromJSON(renv_lock)$Packages
  packages <- lapply(renv_packages, function(x) {
    x$Package
  })
  packages <- Reduce(c, packages) %>% sort()
  if (is.null(packages)) c() else packages
}

#' Extract vector of packages from renv lockfile for [renv::install]
#'
#' @param renv_lock [[character]] Path to renv.lock.
#'
#' @return Character vector of packages.
#'
#' @keywords internal
#'
#' @importFrom jsonlite fromJSON
#' @importFrom magrittr %>%
#' @importFrom stringr str_c
#' @export
extract_packages_for_renv_install <- function(renv_lock = "renv.lock") {
  if (!file.exists(renv_lock)) {
    stop("Could not find renv lockfile: ", renv_lock)
  }
  renv_packages <- jsonlite::fromJSON(renv_lock)$Packages

  packages_standard <- lapply(renv_packages, function(x) {
    if (x$Source %in% c("Repository")) {
      x$Package
    }
  }) %>%
    unlist() %>%
    unname()

  packages_github <- lapply(renv_packages, function(x) {
    if (!(x$Source %in% c("Repository", "Filesystem"))) {
      stringr::str_c(x$RemoteUsername, "/", x$Package)
    }
  }) %>%
    unlist() %>%
    unname()

  packages <- c(packages_standard, packages_github) %>% sort()
  if (is.null(packages)) {
    character()
  } else {
    packages
  }
}

# Specific ----------------------------------------------------------------

#' Extract vector of CRAN packages from renv lockfile
#'
#' @param renv_lock Character. Path to renv.lock.
#'
#' @return Character vector of packages.
#'
#' @keywords internal
#'
#' @export
#'
extract_cran_packages <- function(renv_lock) {
  if (!file.exists(renv_lock)) {
    stop("Could not find renv lockfile: ", renv_lock)
  }
  renv_packages <- jsonlite::fromJSON(renv_lock)$Packages
  packages <- lapply(renv_packages, function(x) {
    if (x$Source == "Repository" && x$Repository == "CRAN") x$Package else NULL
  })
  cran_packages <- Reduce(c, packages)
  if (is.null(cran_packages)) c() else cran_packages
}

#' Extract vector of CRAN packages from renv lockfile
#'
#' @param renv_lock Character. Path to renv.lock.
#'
#' @return Character vector of packages.
#'
#' @keywords internal
#'
#' @export
#'
extract_rspm_packages <- function(renv_lock) {
  if (!file.exists(renv_lock)) {
    stop("Could not find renv lockfile: ", renv_lock)
  }
  renv_packages <- jsonlite::fromJSON(renv_lock)$Packages
  packages <- lapply(renv_packages, function(x) {
    if (x$Source == "Repository" && x$Repository == "RSPM") x$Package else NULL
  })
  cran_packages <- Reduce(c, packages)
  if (is.null(cran_packages)) c() else cran_packages
}
