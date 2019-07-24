#' @title Feature scaling
#'
#' @description Normalize a vector, matrix, dataframe or xts object. If x is a matrix, dataframe or xts object normalization is applied to all columns
#' @param x a vector, matrix, dataframe or xts object
#' @param method can be one of "zscore", "minmax", "mean"
#' @export
#' @keywords
#' @seealso \code{\link{https://en.wikipedia.org/wiki/Feature_scaling}}
#' @return
#' @example \dontrun{
#'
#' }
#'
normalize <- function(x, method = "zscore")
{
  # create the right function
  if(method == "zscore")
  {
    temp <- function(obj)
    {
      obj_mean <- mean(obj, na.rm = TRUE)
      obj_sd <- sd(obj, na.rm = TRUE)
      return((obj - obj_mean) / obj_sd)
    }
  }else if(method == "minmax")
  {
    temp <- function(obj)
    {
      obj_min <- min(obj, na.rm = TRUE)
      obj_max <- max(obj, na.rm = TRUE)
      return((obj - obj_min)/(obj_max - obj_min))
    }
  }else if(method == "mean")
  {
    temp <- function(obj)
    {
      obj_mean <- mean(obj, na.rm = TRUE)
      obj_min <- min(obj, na.rm = TRUE)
      obj_max <- max(obj, na.rm = TRUE)
      return((obj - obj_mean) / (obj_max - obj_min))
    }
  }else
  {
    stop("The method provided is not recognized!")
  }

  # check dimensions of the object so that the function is applied in all columns
  if(length(dim(x)) == 2)
  {
    return(apply(X = x, MARGIN = 2, FUN = temp))
  }else if(is.vector(x))
  {
    return(temp(x))
  }else
  {
    stop("Cannot normalize this type of object! Check dimensions (?)")
  }

}
