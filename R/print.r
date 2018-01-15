
# --------------------------------PRINT.MIDS--------------------------------------
# setMethod("print", "mids", function(x, ...) {
#     print.mids(x, ...)
# })

#'Print a \code{mids} object
#'
#'@rdname print
#'@param x Object of class \code{mids}, \code{mira} or \code{mipo}
#'@param ... Other parameters passed down to \code{print.default()}
#'@return \code{NULL}
#'@seealso \code{\link[=mids-class]{mids}}
#'@method print mids
#'@export
print.mids <- function(x, ...) {
    if (is.mids(x)) {
        cat("Multiply imputed data set")
        cat("\nCall:\n")
        print(x$call, ...)
        cat("Number of multiple imputations: ", x$m)
        cat("\nMissing cells per column:\n")
        print(x$nmis, ...)
        cat("Imputation methods:\n")
        print(x$method, ...)
        cat("VisitSequence:\n")
        print(x$visitSequence, ...)
        cat("PredictorMatrix:\n")
        print(x$predictorMatrix, ...)
        cat("Random generator seed value: ", x$seed, "\n")
    } else print(x, ...)
    invisible()
}
# ------------------------------print.mira-------------------------------

# setMethod("print", signature(x = "mira"), function(x) {
#     print.mira(x)
# })

#'Print a \code{mira} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mira-class]{mira}}
#'@method print mira
#'@export
print.mira <- function(x, ...) {
    ## prints the mira object; A mira object is in fact a list, so it will be printed as such.  KO, 3/2/00
    
    if (is.mira(x)) 
        print.listof(x, ...)  ##PM 4/02
    else print(x, ...)
    invisible()
    
} 


# # ------------------------------print.mipo-------------------------------
# setMethod("print", signature(x = "mipo"), function(x, ...) {
#     print.mipo(x, ...)
# })

#'Print a \code{mipo} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mipo
#'@export
print.mipo <- function(x, ...) {
  print(summary(x), ...)
  invisible(x)
}

#'Print a \code{summary.mipo} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mipo.summary
#'@export
print.mipo.summary <- function(x, ...) {
  from <- c("term", "estimate", "std.error", "statistic", "p.value")
  to <- c("", "est", "se", "t", "Pr(>|t|)")
  names(x)[names(x) %in% from] <- to
  print.data.frame(x, ...)
  invisible(x)
}


#'Print a \code{mice.anova} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mice.anova
#'@export
print.mice.anova <- function(x, ...) {
  z <- summary(x, ...)
  print(z$comparisons, row.names = FALSE)
  invisible(x)
}

#'Print a \code{summary.mice.anova} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mice.anova.summary
#'@export
print.mice.anova.summary <- function(x, ...) {
  cat("\nModels:\n")
  print(x$models, row.names = FALSE)
  cat("\nComparisons:\n")
  print(x$comparisons, row.names = FALSE)
  cat("\nNumber of imputations: ", x$m, 
      "  Method", x$method)
  if (x$method == "D2") cat(" (", x$use, ")", sep = "")
  cat("\n")
  invisible(x)
}


#
# --------------------------------PRINT.MADS--------------------------------------
#
#'Print a \code{mads} object
#'
#'@param x Object of class \code{mads}
#'@param ... Other parameters passed down to \code{print.default()}
#'@return \code{NULL}
#'@seealso \code{\link[=mads-class]{mads}}
#'@method print mads
#'@export
print.mads <- function(x, ...) {
  if (is.mads(x)) {
    cat("Multivariate Amputed Data Set")
    cat("\nCall: ")
    print(x$call)
    cat("Class:", class(x))
    cat("\nProportion of Missingness: ", x$prop)
    cat("\nFrequency of Patterns: ", x$freq)
    cat("\nPattern Matrix:\n")
    print(x$patterns)
    cat("Mechanism:")
    print(x$mech)
    cat("Weight Matrix:\n")
    print(x$weights)
    cat("Type Vector:\n")
    print(x$type)
    cat("Odds Matrix:\n")
    print(x$odds)
    cat("Head of Amputed Data Set\n")
    print(head(x$amp))
  } else print(x, ...)
  invisible()
}

