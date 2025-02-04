
<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

# TrumpLies

The goal of the `TrumpLies` package is to makes available in R the
database of Donald Trump’s false claims compiled by Daniel Dale at *The
Toronto Star* for further analysis and data visualization.

## Installation

This package is presently maintained in a private repo on Github,
pending public release of the database. If you can read this, you can
install the package via:

``` r
# install.packages(c("devtools", "remotes"))
remotes::install_github("friendly/TrumpLies")
```

## License

This package is released under the [Creative Commons CC
BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/2.0/ca/)
license. This means that appropriate credit for use must be given and it
cannot be used for commercial purposes.

See `citation("TrumpLies")` for an appropriate citation for the package.
In addition, graphs or tables published from this should cite the source
of the data as *Data source: Daniel Dale, The Toronto Star*.

## Example

This is a basic example showing a simple histogram of frequencies of
Trump lies by month using `ggplot2`:

``` r
## basic example code
library(TrumpLies)
library(ggplot2)
library(scales)
data(TrumpLies)

ggplot(TrumpLies, aes(x=date))  +
  geom_histogram(binwidth=20, colour="black", fill="lightblue") +
  scale_x_date(labels = scales::date_format("%Y-%m"),
               breaks = seq(min(TrumpLies$date)-5, max(TrumpLies$date)+5, 30)) +
  ylab("Number of False Claims") + 
  xlab("Year and Month") +
  theme_bw() + 
  theme(axis.text.x = element_text(angle=45, vjust = 1, hjust=1))
```

<img src="README-ex1-1.png" width="80%" />
