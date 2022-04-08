#' @inheritParams list_resource_groups
#' @export
list_resource_groups.az_subscription <- function(x, ...) {
  x$list_resource_groups(...)
}

#' @export
get_resource_group.az_subscription <- function(x, ...) {
  x$get_resource_group(...)
}
