
### What is finr

finr is a set of helper functions targeting mainly - but not only - people that do research in finance.

### Functions that are included in finr:

**1. rebase**

This function "rebases" any sequence of numbers at a specific point to a specific number. By default, it rebases any sequence of numbers to  100 at the first element. If a dataframe, matrix or xts object is passed then the rebase is applied to every column.

This is helpful when we want our time series to start from the same value for the starting point. The starting point can be different than 1, e.g. all the time series can be rebased to 100 in the 10th element.

```{r}
df <- data.frame(a = rnorm(10), b = rnorm(10), c = rnorm(10))
print(df)
df_rebased <- rebase(df)
print(df_rebased)
```

**2. plot_df**

plot_df will plot all the variables (i.e. columns) of a dataframe, matrix or xts object in 1 chart. The plotting functionality is basic at the moment but saves time to the user.


