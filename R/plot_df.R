#' @title Plots all the time series in a dataframe, matrix or xts object
#'
#' @description Calculates the correlation of one time series vs. another for various leads/lags
#' @param df_or_mat The dataframe, matrix or xts object that contains the data
#' @param x_axis_var The name of the variable that should be used for the x-axis
#' @param main_title The title for the chart
#' @param x_label The label for the x-axis
#' @param y_label The label for the y-axis
#' @param cols A vector that contains the columns to be used. If empty, the default will be used
#' @param legend If a legend should be included
#' @export
#' @keywords
#' @return
#' @example \dontrun{
#'
#' }
plot_df <- function(df_or_mat, x_axis_var = "", main_title = "", y_label = "", x_label = "", cols = NULL, legend = FALSE)
{
  # check if colors have been given
  if(is.null(cols))
  {
    cols <- c("blue", "red", "cadetblue4", "dodgerblue4", "darkorchid4",
              "deeppink2", "lightslateblue", "orange3", "seagreen3", "tan3")
    cols <- rep(cols, times = ceiling((ncol(df_or_mat)-1) / length(cols))) # repeat the colors vector as many times are required based on the number of columns to plot
  }

  # column on axis x
  x_axis_ts <- df_or_mat[, x_axis_var]

  # time series to plot
  ts_to_plot <- df_or_mat[, !colnames(df_or_mat) %in% x_axis_var, drop = FALSE]

  # find out the max and min for the limits of the y-axis
  max_y <- max(ts_to_plot)
  min_y <- min(ts_to_plot)

  # setting the options for the plotting
  par(mar = c(3.5, 3.5 ,2 ,1), cex.axis = 0.8, cex.main = 1, cex.lab = 0.8, las = 1)

  plot(x = x_axis_ts, y = ts_to_plot[, 1], type = "l", col = cols[1], ylab = NA, xlab = NA, ylim = c(min_y, max_y), lwd = 1)
  title(xlab = x_label, line = 2)
  title(ylab = y_label, line = 2.5)
  title(main = main_title, line = 0.5, adj = 0)

  # loop through the rest of colums to plot them
  for(i in 2:ncol(ts_to_plot))
  {
    lines(x = x_axis_ts, y = ts_to_plot[, i], type = "l", col = cols[i], lwd = 1)
  }

  # Add legend
  if(legend == TRUE)
  {
    legend("topleft", bty = "n", horiz = TRUE, legend = colnames(ts_to_plot), col = cols[1:ncol(ts_to_plot)], lty = 1, cex = 0.8)
  }
}
