% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fergm.R
\name{fergm}
\alias{fergm}
\title{Estimation of Frailty Exponential Random Graph Model (FERGM) via MPLE using Stan}
\usage{
fergm(net = NULL, form = NULL, seed = 12345, chains = 4, warmup = 100,
  iter = 600, cores = 1)
}
\arguments{
\item{net}{A network object that is to be explained using the right_hand_vars argument.}

\item{form}{A character string specified as "ergm.term1 + ergm.term2", must be terms supported for ERGMs.}

\item{seed}{An integer that sets the seed for the random number generator to assist in replication.  Defaults to 12345.  Set to null to prevent internal seed setting.}

\item{chains}{An integer that sets the number of Markov chains that should be used by Stan.}

\item{warmup}{The number of warm up or burn-in iterations that should be used before posterior draws are taken.  Defaults to 100.}

\item{iter}{The number of total number of samples that should be taken including warm ups  Defaults to 600 total iterations, leading to a posterior sample size of 500.}

\item{cores}{The number of cores to used should parallel processing be desired.  Defaults to 1.}
}
\value{
This function returns a list that includes the Stan output (stan.fit), the data object passed to Stan (stan.dta), and the original formula (form).
}
\description{
This function estimates a FERGM
}
\examples{
\dontrun{
set.seed(1)

data("faux.mesa.high")

mesa <- faux.mesa.high

mesa.fit <- ergm::ergm(mesa ~ edges +
                  nodematch('Sex') +
                  nodematch('Grade', diff = FALSE) +
                  nodematch('Race', diff = FALSE) +
                  gwesp(decay = 0.2, fixed = TRUE) +
                  altkstar(lambda = 0.6, fixed = TRUE))

library(fergm)
form <- c("edges + nodematch('Sex') + nodematch('Grade', diff = FALSE) +
          nodematch('Race', diff = FALSE) +
          gwesp(decay = 0.2, fixed = TRUE) + altkstar(lambda = 0.6, fixed = TRUE)")

fergm.fit <- fergm(net = mesa, form = form, chains = 2)
}
}
\references{
Box-Steffensmeier, Janet M., Dino P. Christenson, and Jason W. Morgan. 2018. ``Modeling Unobserved Heterogeneity in Social Networks with the Frailty Exponential Random Graph Model." \emph{Political Analysis}. (26)1:3-19.

Stan Development Team (2016). RStan: the R interface to Stan. R package version 2.14.1. \url{http://mc-stan.org/}.
}
\keyword{FERGM}
