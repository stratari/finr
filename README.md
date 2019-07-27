---
title: "Functionality of the finr package"
output:
  html_document: default
  pdf_document: default
---



### What is finr

finr is a set of helper functions targeting mainly - but not only - people that do research in finance.

### Functions that are included in finr:

1. rebase

This function "rebases" any sequence of numbers at a specific point to a specific number. By default, it rebases any sequence of numbers to  100 at the first element. If a dataframe, matrix or xts object is passed then the rebase is applied to every column.

This is helpful when we want to have the same starting point for some financial indices so that we can compare performance for a given time period

```{r}
df <- data.frame(a = rnorm(10), b = rnorm(10), c = rnorm(10))
print(df)
df_rebased <- rebase(df)
print(df_rebased)
```


