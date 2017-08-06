% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mice.impute.2l.norm.r
\name{mice.impute.2l.norm}
\alias{mice.impute.2l.norm}
\title{Imputation by a two-level normal model}
\usage{
mice.impute.2l.norm(y, ry, x, type, wy = NULL, intercept = TRUE, ...)
}
\arguments{
\item{y}{Vector to be imputed}

\item{ry}{Logical vector of length \code{length(y)} indicating the 
the subset \code{y[ry]} of elements in \code{y} to which the imputation 
model is fitted. The \code{ry} generally distinguishes the observed 
(\code{TRUE}) and missing values (\code{FALSE}) in \code{y}.}

\item{x}{Numeric design matrix with \code{length(y)} rows with predictors for 
\code{y}. Matrix \code{x} may have no missing values.}

\item{type}{Vector of length \code{ncol(x)} identifying random and class
variables.  Random variables are identified by a '2'. The class variable
(only one is allowed) is coded as '-2'. Random variables also include the
fixed effect.}

\item{wy}{Logical vector of length \code{length(y)}. A \code{TRUE} value 
indicates locations in \code{y} for which imputations are created.}

\item{intercept}{Logical determining whether the intercept is automatically
added.}

\item{...}{Other named arguments.}
}
\value{
Vector with imputed data, same type as \code{y}, and of length 
\code{sum(wy)}
}
\description{
Imputes univariate missing data using a two-level normal model
}
\details{
Implements the Gibbs sampler for the linear multilevel model with
heterogeneous with-class variance (Kasim and Raudenbush, 1998). Imputations
are drawn as an extra step to the algorithm. For simulation work see Van
Buuren (2011).

The random intercept is automatically added in \code{mice.impute.2L.norm()}.
A model within a random intercept can be specified by \code{mice(...,
intercept = FALSE)}.
}
\note{
Added June 25, 2012: The currently implemented algorithm does not
handle predictors that are specified as fixed effects (type=1). When using
\code{mice.impute.2l.norm()}, the current advice is to specify all predictors
as random effects (type=2).

Warning: The assumption of heterogeneous variances requires that in every
class at least one observation has a response in \code{y}.
}
\author{
Roel de Jong, 2008
}
\references{
Kasim RM, Raudenbush SW. (1998). Application of Gibbs sampling to nested
variance components models with heterogeneous within-group variance. Journal
of Educational and Behavioral Statistics, 23(2), 93--116.

Van Buuren, S., Groothuis-Oudshoorn, K. (2011). \code{mice}: Multivariate
Imputation by Chained Equations in \code{R}. \emph{Journal of Statistical
Software}, \bold{45}(3), 1-67. \url{http://www.jstatsoft.org/v45/i03/}

Van Buuren, S. (2011) Multiple imputation of multilevel data. In Hox, J.J.
and and Roberts, J.K. (Eds.), \emph{The Handbook of Advanced Multilevel
Analysis}, Chapter 10, pp. 173--196. Milton Park, UK: Routledge.
}
\seealso{
Other univariate \code{2l} functions: \code{\link{mice.impute.2l.lmer}},
  \code{\link{mice.impute.2l.pan}}
}
\keyword{datagen}

