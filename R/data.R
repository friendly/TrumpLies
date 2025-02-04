#' @title Trump Lies Database
#' @description This is the complete database of false claims ("lies") by Donald Trump compiled by Daniel Dale of
#'        \emph{The Toronto Star} from 2017-01-20 to 2018-12-05. MORE DESCRIPTION HERE if needed.
#'
#' @format A `tbl_df`, `tbl` and `data.frame` with 3924 rows and 15 variables:
#' \describe{
#'   \item{\code{number}}{integer; Sequential lie number}
#'   \item{\code{date}}{Date; date of the lie}
#'   \item{\code{place}}{character; Place the false claim was delivered or reported}
#'   \item{\code{claim}}{character; Text of the false claim}
#'   \item{\code{infact}}{character; Text of the actual fact}
#'   \item{\code{slug}}{character; Brief description of the false claim, used as a shorthand abbreviation for \code{claim}}
#'   \item{\code{repeat}}{Factor w/ 2 levels: "no","yes"; Was this false claim repeated?}
#'   \item{\code{source}}{character Web URL pointing to a publication giving the claim}
#'   \item{\code{category1}}{Factor w/ 95 levels; Content category of the false claim}
#'   \item{\code{category2}}{Factor w/ 101 levels; Content category of the false claim}
#'   \item{\code{category3}}{Factor w/ 87 levels; Content category of the false claim}
#'   \item{\code{category4}}{Factor w/ 48 levels; Content category of the false claim}
#'   \item{\code{placecategory}}{character Category of the `place`}
#'   \item{\code{month}}{numeric; Month of the lie, from `date` for convenience}
#'   \item{\code{year}}{numeric; Year of the lie, from `date` for convenience}
#'}
#' @details DETAILS: A description of the details of codings for `slug`, `category*` and other details needed here.
#'          Should perhaps also give the code (somewhere) used to read in the CSV file.
#' @source Daniel Dale and Edward Tubb, \emph{The Toronto Star}, \url{link to Github site}
#' @author Michael Friendly
#' @examples
#' data(TrumpLies)
#' names(TrumpLies)
#' # do something mildly interesting here: plot a histogram of lies by month

#' library(ggplot2)
#' library(scales)
#' ggplot(TrumpLies, aes(x=date))  +
#'   geom_histogram(binwidth=30, colour="black", fill="lightblue") +
#'   geom_density(aes(y=30* ..count..), alpha=.2, fill="#FF6666") +
#'   scale_x_date(labels = scales::date_format("%Y-%m"),
#'                breaks = seq(min(TrumpLies$date)-5, max(TrumpLies$date)+5, 30)) +
#'   ylab("Number of False Claims") +
#'   xlab("Year and Month") +
#'   theme_bw() +
#'   theme(axis.text.x = element_text(angle=45, vjust = 1, hjust=1))
#'
"TrumpLies"
