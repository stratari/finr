---
title: "README"
output:
  html_document:
    keep_md: true
---

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
##           a        b        c
## 1  100.2626 102.5399 104.4915
## 2  100.4727 102.2792 102.5213
## 3  100.5981 103.0839 103.0179
## 4  101.2010 102.7528 103.0962
## 5  100.8581 102.2601 102.4456
## 6  100.9317 100.9564 103.3062
## 7  100.6920 102.0187 102.6812
## 8  100.8708 102.0428 103.8703
## 9  100.6830 102.3963 102.2724
## 10 102.0553 102.2760 103.6651
```

```r
df_rebased <- finr::rebase(df)
print(df_rebased)
```

```
##              a         b         c
##  [1,] 100.0000 100.00000 100.00000
##  [2,] 100.2095  99.74576  98.11450
##  [3,] 100.3346 100.53047  98.58973
##  [4,] 100.9359 100.20756  98.66471
##  [5,] 100.5940  99.72708  98.04209
##  [6,] 100.6673  98.45568  98.86569
##  [7,] 100.4282  99.49167  98.26752
##  [8,] 100.6066  99.51514  99.40555
##  [9,] 100.4193  99.85996  97.87632
## [10,] 101.7880  99.74256  99.20909
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
##  [2,]  2 100.2095  99.74576  98.11450
##  [3,]  3 100.3346 100.53047  98.58973
##  [4,]  4 100.9359 100.20756  98.66471
##  [5,]  5 100.5940  99.72708  98.04209
##  [6,]  6 100.6673  98.45568  98.86569
##  [7,]  7 100.4282  99.49167  98.26752
##  [8,]  8 100.6066  99.51514  99.40555
##  [9,]  9 100.4193  99.85996  97.87632
## [10,] 10 101.7880  99.74256  99.20909
```

```r
finr::plot_df(df_or_mat = df_rebased_2, x_axis_var = "x", main_title = "Title", y_label = "Value", x_label = "Time")
```

![](README_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

