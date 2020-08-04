#' name_extract
#' 
#' extract names using gnfinder
#' 
#' @export
#' @param path (character) path to a file
#' @param verify (logical) verify names? default: `FALSE`
#' @param language (logical) text's language. by default it's
#' automatically detected. default: `NULL`
#' @param no_bayes (logical) do not run Bayes algorithms. default: `FALSE`
#' @param odds_details (logical) show details of odds calculation.
#' default: `FALSE`
#' @param data_sources (numeric vector) IDs of data sources to display for
#' matches. default: `NULL`. e.g., `c(1, 11, 179)`
#' @param tokens (logical) xxx. default: `NULL`
#' @return list of two data.frames:
#' 
#' - meta: metadata
#' - names: names and their parts, varies based on function parameters
#' 
#' @examples
#' x <- system.file("examples/BoegerEtal2015.pdf", package="namext")
#' x
#' name_extract(x)
#' name_extract(x, verify = TRUE)
#' name_extract(x, language = "eng")
#' name_extract(x, no_bayes = TRUE)
#' name_extract(x, odds_details = TRUE)
#' name_extract(x, data_sources = c(4, 12))
#' name_extract(x, tokens = 5)
name_extract <- function(path, verify = FALSE, language = NULL,
  no_bayes = FALSE, odds_details = FALSE, data_sources = NULL,
  tokens = NULL) {

  gnfinder_exists()

  assert(tokens, c("integer", "numeric"))
  assert(verify, "logical")
  assert(language, "character")
  assert(no_bayes, "logical")
  assert(odds_details, "logical")
  assert(data_sources, c("integer", "numeric"))

  type <- file_type(path)
  if (type == "pdf") {
    text <- pdftools::pdf_text(path)
    txt_path <- tempfile(fileext = ".txt")
    writeLines(text, txt_path)
  }
  args <- character(0)
  if (verify) args <- c(args, "-c")
  if (!is.null(language)) args <- c(args, "-l", language)
  if (no_bayes) args <- c(args, "-n")
  if (odds_details) args <- c(args, "-o")
  if (!is.null(data_sources)) args <- c(args, "-s", paste0(data_sources, collapse=","))
  if (!is.null(tokens)) args <- c(args, c("-t", tokens))

  z <- sys::exec_internal("gnfinder", c("find", args, txt_path), error = FALSE)
  err_chk(z)
  parsed <- jsonlite::fromJSON(rawToChar(z$stdout))
  parsed$metadata <- tibble::as_tibble(parsed$metadata)
  parsed$names <- tibble::as_tibble(parsed$names)
  return(parsed)
}
