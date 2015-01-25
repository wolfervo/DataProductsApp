---
title       : Power of Compounding Interest
subtitle    : Shiny App Pitch
author      : Erich Wolf
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : standalone    # {standalone, draft}
knit        : slidify::knit2slides
---

## Purpose and Objective

The Purpose of this presentation is to introduce the [Power of Compounding Interest] (https://wolfervo.shinyapps.io/DataProducts/) Shiny App developed for the Coursera Data Products Class.

The Objective of this presentation is to provide users of my Shiny App with sufficient information to find and use the App to generate useful investment projections.

---

## Shiny App Overview

The [Power of Compounding Interest] (https://wolfervo.shinyapps.io/DataProducts/) Shiny App takes an initial investment value and allows users to generate a projected value based on the investment time horizon  and interest rate, for investments subject to compounding interest.

This is valuable when comparing long term investments with various interest rates different interest terms (e.g., compounding vs. non-compounding).

Users input their investment amount, then select an interest rate and time horizon. The App confirms their input values, returns a single projected investment value, and provides a graph of the investment value over time.

---

## Calculations and Default Projection

The App uses a version of the following r code to develop projections; the values used here are the default App values. The ui.R and server.R files are available in this [Github Repository](https://github.com/wolfervo/DataProductsApp)


```r
CompInt <- function(invest, rate, years) {invest*(1+rate)^years}
defaultinvest <- 10000
defaultrate <- 0.05
defaultyears <- 15
ProjValue <- CompInt(defaultinvest, defaultrate, defaultyears)
print(ProjValue)
```

```
## [1] 20789.28
```

---

## Example Plot Code

The App provides a customized version of the following plot to show investment value over time.

```r
library(ggplot2)
time <- 1:defaultyears
value <- CompInt(defaultinvest, defaultrate, time)
pd <- as.data.frame(cbind(time, value))
tvplot <- ggplot(data=pd, aes(x=time, y=value)) + 
      geom_point(aes(size = value), col = "dark blue") +
      geom_line(col = "dark blue") + 
      xlab("Years Compounded") + ylab("Investment Value") +
      ggtitle("Projected Value of Investment Over Time")
```

---

## Default Plot

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 
