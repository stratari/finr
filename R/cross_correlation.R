#' @title Examines to what extent one time series leads another one and shows in which lead/lag the correlation is maximized
#'
#' @description Calculates the correlation of one time series vs. another for various leads/lags
#' @param x A vector of the time series for which we want to check if it leads another series
#' @param y A vector of the time series against which we check if x leads it
#' @param max_lag The maximum number of leads/lags to apply to x to check its correlation with y.
#' @param include_plot If TRUE it will also generate a plot with the correlations for the different leads/lags. If the correlation is maximized on positive lead/lags, this means that x leads y (i.e. there is indication of predictive ability of x over y)
#' @export
#' @keywords
#' @seealso \code{\link{https://uk.mathworks.com/help/matlab/ref/xcorr.html}}
#' @return
#' @example \dontrun{
#'
#' }
#'
cross_correlation <- function(x, y, max_lag = 6, include_plot = FALSE)
{
  lag_range <- -abs(max_lag):abs(max_lag)
  correlations <- data.frame(lag = lag_range, correlation = rep(NA, times = length(lag_range))) # dataframe to hold the correlations

  for(i in 1:length(lag_range))
  {
    lagged_cor <- cor(lag.xts(x, lag_range[i], na.pad = TRUE), y, use = "complete.obs")
    correlations[i,2] <- lagged_cor
  }

  if(include_plot == TRUE)
  {
    par(mar = c(3.5,3.5,2,1), cex.main = 1, cex.axis = 0.8, las = 1, cex.lab = 0.8)
    plot(correlation~lag, data = correlations, type = "o", pch = 16, xaxt = "n", yaxt = "n", xlab = NA, ylab = NA)
    axis(side = 1, at = lag_range)
    axis(side = 2)
    max_position <- which(correlations$correlation == max(correlations$correlation))
    abline(v = correlations$lag[max_position], lty = 2, col = "blue")
    abline(h = correlations$correlation[max_position], lty = 2, col = "blue")
    abline(h = 0, col = "gray")
    title(paste("Cross correlations"), adj = 0)
    title(xlab = "Lags", line = 2)
    title(ylab = "Correlation", line = 2.5)
  }

  return(correlations)
}

