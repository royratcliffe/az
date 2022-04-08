#' @inheritParams list_subscriptions
#' @export
list_subscriptions.az_rm <- function(x, ...) {
  x$list_subscriptions(...)
}
