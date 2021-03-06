% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ampute.discrete.R
\name{ampute.discrete}
\alias{ampute.discrete}
\title{Multivariate amputation based on discrete probability functions}
\usage{
ampute.discrete(P, scores, prop, odds)
}
\arguments{
\item{P}{A vector containing the pattern numbers of candidates.
For each case, a value between 1 and #patterns is given. For example, a
case with value 2 is candidate for missing data pattern 2.}

\item{scores}{A list containing vectors with the candidates's weighted sum scores,
the result of an underlying function in \code{\link{ampute}}.}

\item{prop}{A scalar specifying the proportion of missingness. Should be a value
between 0 and 1. Default is a missingness proportion of 0.5.}

\item{odds}{A matrix where #patterns defines the #rows. Each row should contain
the odds of being missing for the corresponding pattern. The amount of odds values
defines in how many quantiles the sum scores will be divided. The values are
relative probabilities: a quantile with odds value 4 will have a probability of
being missing that is four times higher than a quantile with odds 1. The
#quantiles may differ between the patterns, specify NA for cells remaining empty.
Default is 4 quantiles with odds values 1, 2, 3 and 4, the result of
\code{\link{ampute.default.odds}}.}
}
\value{
A list containing vectors with \code{0} if a case should be made missing
and \code{1} if a case should remain complete. The first vector refers to the
first pattern, the second vector to the second pattern, etcetera.
}
\description{
This function creates a missing data indicator for each pattern. Odds probabilities
(Brand, 1999, pp. 110-113) will be induced on the weighted sum scores, calculated earlier
in the multivariate amputation function \code{\link{ampute}}.
}
\references{
Brand, J.P.L. (1999). \emph{Development, implementation and
evaluation of multiple imputation strategies for the statistical analysis of
incomplete data sets.} Dissertation. Rotterdam: Erasmus University.
}
\seealso{
\code{\link{ampute}}, \code{\link{ampute.default.odds}}
}
\author{
Rianne Schouten, 2016
}
\keyword{internal}
