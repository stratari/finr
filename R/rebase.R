#' @title Rebase a vector, matrix, dataframe or xts object
#'
#' @description Rebase a vector, matrix, dataframe or xts object (by default to 100 for the first data point)
#' @param x a vector, matrix, dataframe or xts object
#' @param rebase_to the starting value of the time series. By default it starts from 100
#' @param initial_point the point in the x object that will take the rebase_to value (i.e. this can be something different than 1)
#' @export
#' @keywords
#' @seealso \code{\link{head}}
#' @return
#' @example \dontrun{
#'
#' }
rebase <- function(x, rebase_to = 100, initial_point = 1)
{
  if(length(dim(x)) == 2)
  {
    return(apply(X = x, MARGIN = 2, FUN = function(x) rebase_to * x / x[initial_point]))
  }else if(is.vector(x))
  {
    return(rebase_to * x / x[initial_point])
  }else
  {
    stop("Cannot rebase this type of object!")
  }
}
