#' @title Create simple pivot tables
#'
#' @description Use a dataframe or a matrix to create simple pivot tables to quickly analyze data
#' @param df_or_mat the dataframe or matrix with the data (preferably with column names)
#' @param x_axis_var the variable to be split and presented in the x-axis of the table
#' @param y_axis_var the variable to be split and presented in the y-axis of the table
#' @param x_cuts the number of intervals in which x_axis variable will be split
#' @param y_cuts the number of intervals in which y_axis variable will be split
#' @param agg_var the variable that will be aggregated
#' @param agg_function the function we want to use for the aggregation of agg_var
#' @export
#' @keywords
#' @seealso \code{\link{https://en.wikipedia.org/wiki/Pivot_table}}
#' @return
#' @example \dontrun{
#'
#' }
#'
pivot_table <- function(df_or_mat, x_axis_var, y_axis_var, x_cuts = 5, y_cuts = 5, agg_var, agg_function = "mean")
{
  df <- as.data.frame(df_or_mat) #make sure that we have a dataframe if a matrix is given so that dplyr can handle it
  x_axis_factors <- cut(df[, eval(x_axis_var)], breaks = x_cuts)
  y_axis_factors <- cut(df[, eval(y_axis_var)], breaks = y_cuts)

  df_for_agg <- data.frame(x_axis_factors, y_axis_factors, "agg_var" = df[, eval(agg_var)])
  # The aggregation of the results below is the biggest bottleneck in terms of performance, the rest of the code is fast
  agg_results <- aggregate(formula = agg_var ~ y_axis_factors + x_axis_factors,
                           data = df_for_agg,
                           FUN = eval(agg_function))

  m <- matrix(data = NA, nrow = y_cuts, ncol = x_cuts) #create an empty matrix with the appropriate size
  rownames(m) <- rev(levels(y_axis_factors)) # so that the pivot table resebles the increasing order of the x-y coord. system
  colnames(m) <- levels(x_axis_factors)

  agg_results_rows <- nrow(agg_results)
  print(head(agg_results), 10)

  # loop through the results of the aggregation to assign them to the appropriate cell in our final matrix
  for(i in 1:agg_results_rows)
  {
    m[as.character(agg_results$y_axis_factors[i]), as.character(agg_results$x_axis_factors[i])] <- agg_results[i, "agg_var"]
  }
  return(m)
}

