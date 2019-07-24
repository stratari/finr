#' @title Create an index from returns
#'
#' @description Use a vector, dataframe, matrix or xts object to create indices from financial returns (this is period agnostic)
#' @description i.e. it assumes the same periodicity as the data
#' @param x the vector, dataframe, matrix or xts object that holds the returns
#' @param treat_na_as_zero by default NA's are not treated as 0's to avoid wrong results and flag the issue
#' @export
#' @keywords
#' @seealso \code{\link{https://en.wikipedia.org/wiki/Stock_market_index}}
#' @return
#' @example \dontrun{
#'
#' }
#'
create_index_from_returns <- function(x, treat_na_as_zero = FALSE)
{
  create_index <- function(var)
  {
    # check if treat_na_as_zero equals TRUE
    if(treat_na_as_zero == TRUE)
    {
      var[is.na(var)] <- 0
    }
    temp <- 1 + var
    temp[1] <- 1
    temp <- cumprod(temp)
    return(100 * temp)
  }

  # check for the dimensions of x to apply the create_index function appropriately
  if(length(dim(x)) == 2)
  {
    return(apply(X = x, MARGIN = 2, FUN = create_index))
  }else if(is.vector(x))
  {
    return(create_index(x))
  }else
  {
    stop("Cannot create index from this type of object!")
  }
}


