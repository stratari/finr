#' @title Calculates the average of the x% of median values in a dataset
#'
#' @description Calculates the average of the x% of median values (e.g. the average of the 10% of the observations in the middle)
#' @param x A vector, matrix, dataframe or xts object. If not a vector, the function will be applied to all columns
#' @param percent The percent of the observations in the middle (after sorted) for which we want to calculate the average
#' @export
#' @keywords
#' @seealso \code{\link{https://en.wikipedia.org/wiki/Median}}
#' @return
#' @example \dontrun{
#'
#' }
#'
avg_of_medians <- function(x, percent = 0.05)
{
  # create the function that will be used for the calculation
  temp <- function(var)
  {
    var_no_na <- var[!is.na(var)]
    var_sorted <- sort(var_no_na)
    num_of_median_elements <- ceiling(percent * length(var_sorted)) # how many elements we need to keep for the calculation of the mean

    mid_point <- ceiling(length(var_no_na) / 2)
    points_on_left <- ceiling((num_of_median_elements - 1) / 2)
    points_on_right <- num_of_median_elements - points_on_left - 1
    vec_to_use_for_mean <- var_sorted[(mid_point - points_on_left):(mid_point + points_on_right)]
    return(mean(vec_to_use_for_mean))
  }

  # apply the temp function based on the datatypes
  if(length(dim(x)) == 2)
  {
    return(apply(X = x, MARGIN = 2, FUN = temp))
  }else if(is.vector(x))
  {
    return(temp(x))
  }else
  {
    stop("Cannot calculate the average of medians for this type of object!")
  }
}
