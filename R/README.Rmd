---
title: "README"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## What is finr

finr is a set of helper functions targeting mainly - but not only - people that do research in finance.

## Functions that are included in finr:

1. rebase

The function rebases any sequence of numbers at a specific point to a specific number. By default, it rebases the sequence of numbers to be 100 at the first element. If a dataframe, matrix or xts object is passed then the rebase is applied to every column.

```{r}
df <- data.frame(a = rnorm(10), b = rnorm(10), c = rnorm(10))
print(df)
df_rebased <- rebase(df)
print(df_rebased)
```


