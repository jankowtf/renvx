# renvx 0.0.0.9003

Minor changes in unit tests

- Added test fixture for `renv.lock`
- Trying to understand the behavior of `options()` (see https://stackoverflow.com/questions/65880511/call-to-options-has-different-side-effects-dependening-on-how-it-is-called)

--------------------------------------------------------------------------------

# renvx 0.0.0.9002

Options

- Added `set_options()`
- Added unit test `test-options.R`

--------------------------------------------------------------------------------

# renvx 0.0.0.9001

Dependencies and default value

- Added package dependencies `{jsonlite}`, `{magrittr}` and `{stringr}`
- Added default value for arg `renv_lock` in
`extract_packages_for_renv_install()`

--------------------------------------------------------------------------------

# renvx 0.0.0.9000

Initial commit

- Added a `NEWS.md` file to track changes to the package.
- Added main function of initial interes: `extract_packages_for_renv_install()`
- Added unit test `test-extract.R`
