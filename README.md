---
<!---title: "README"
output:
  html_document:
    keep_md: true
---
--->
### What is finr

finr is a set of helper functions targeting mainly - but not only - people that do research in finance.

### Functions that are included in finr:

**1. rebase**

This function "rebases" any sequence of numbers at a specific point to a specific number. By default, it rebases any sequence of numbers to  100 at the first element. If a dataframe, matrix or xts object is passed then the rebase is applied to every column.

This is helpful when we want our time series to start from the same value for the starting point. The starting point can be different than 1, e.g. all the time series can be rebased to 100 in the 10th element.


```r
df <- data.frame(a = 101* (1 + rnorm(10)/100), b = 102 * (1 + rnorm(10)/100), c = 103 * (1 + rnorm(10)/100))
print(df)
```

```
##           a         b        c
## 1  100.5643 101.89345 103.8711
## 2  102.1803 103.43909 102.2698
## 3  100.7416 101.76913 103.5367
## 4  102.1091 101.86614 103.0645
## 5  101.0282 101.44018 102.7941
## 6  100.7551 102.34229 103.2416
## 7  100.6610 102.56632 103.8833
## 8  101.1497 101.31845 103.3080
## 9  101.9644 102.64816 102.3447
## 10 101.5662  99.55696 103.0698
```

```r
df_rebased <- finr::rebase(df)
print(df_rebased)
```

```
##              a         b         c
##  [1,] 100.0000 100.00000 100.00000
##  [2,] 101.6069 101.51692  98.45836
##  [3,] 100.1763  99.87799  99.67807
##  [4,] 101.5361  99.97319  99.22351
##  [5,] 100.4613  99.55515  98.96313
##  [6,] 100.1898 100.44050  99.39397
##  [7,] 100.0962 100.66036 100.01173
##  [8,] 100.5821  99.43568  99.45789
##  [9,] 101.3922 100.74068  98.53050
## [10,] 100.9963  97.70692  99.22861
```

**2. plot_df**

plot_df will plot all the variables (i.e. columns) of a dataframe, matrix or xts object in 1 chart. The plotting functionality is basic at the moment but saves time to the user.

```r
df_rebased_2 <- cbind(x = 1:10, df_rebased)
print(df_rebased_2)
```

```
##        x        a         b         c
##  [1,]  1 100.0000 100.00000 100.00000
##  [2,]  2 101.6069 101.51692  98.45836
##  [3,]  3 100.1763  99.87799  99.67807
##  [4,]  4 101.5361  99.97319  99.22351
##  [5,]  5 100.4613  99.55515  98.96313
##  [6,]  6 100.1898 100.44050  99.39397
##  [7,]  7 100.0962 100.66036 100.01173
##  [8,]  8 100.5821  99.43568  99.45789
##  [9,]  9 101.3922 100.74068  98.53050
## [10,] 10 100.9963  97.70692  99.22861
```

```r
finr::plot_df(df_or_mat = df_rebased_2, x_axis_var = "x", main_title = "Title", y_label = "Value", x_label = "Time")
```

![](README_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

