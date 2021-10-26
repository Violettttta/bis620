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

larger <- function(x, y) {
  if (x > y) {
    print(x)
  }
  else print(y)
}
