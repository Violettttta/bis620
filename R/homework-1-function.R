#' @title Calculate the number of missing values
#'
#' @description Return the sum of all the missing values present in its arguments.
#' @param x an R object to be tested: atomic vectors, lists, pairlists, and NULL.
#' @return The sum of the number of the missing values.
#' @export
num_na <- function(x) {
  sum(is.na(x))
}

#' @title Get the larger value of the two values
#'
#' @description Return the larger one of the two values.
#' @param x a numeric value.
#' @param y a numeric value.
#' @return The larger value of the two values.
#' @export
status <- function(x) {
  if ((x == "Progressive disease") || (x == "Stable disease")) {
    print("Disease")
  }
  else if ((x == "Partial response") || (x == "Complete response")) {
    print("Response")
  } else {
    print("ERROR")
    }
}



