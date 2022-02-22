#' List Azure Subscriptions
#' @param x Azure resource manager, an \code{az_rm} instance.
#' @param ... Additional parameters for
#'   \code{\link[AzureRMR]{az_rm}$list_subscriptions}.
#' @return List of subscriptions (specifically \code{az_subscription} R6
#'   instances) named for their subscription identifier.
#' @export
list_subscriptions <- function(x, ...) {
  UseMethod("list_subscriptions")
}

#' @inheritParams list_subscriptions
#' @export
list_subscriptions.az_rm <- function(x, ...) {
  x$list_subscriptions(...)
}

#' @inheritParams list_subscriptions
#' @export
list_subscriptions.default <- function(x, ...) {
  list_subscriptions(AzureRMR::get_azure_login())
}
