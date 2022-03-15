#' List Resource Groups
#' @param x Azure subscription.
#' @param ... Addition parameters for
#'   \code{\link[AzureRMR]{az_subscription}$list_resource_groups} S6 method.
#' @return List of resource groups.
#' @export
list_resource_groups <- function(x, ...) {
  UseMethod("list_resource_groups")
}

#' @inheritParams list_resource_groups
#' @export
list_resource_groups.az_subscription <- function(x, ...) {
  x$list_resource_groups(...)
}

#' List of All Resource Groups in All Subscriptions
#'
#' Asks for all subscriptions, since none supplied. Lists resource groups for
#' each one then concatenates the lists. The result becomes a combined list of
#' resource groups. The subscription identifier remains accessible from each.
#'
#' The filters, if any, apply to resource groups and _not_ to subscriptions.
#' Hence the filters collect resource groups from all subscriptions unfiltered.
#'
#' @inheritParams list_resource_groups
#' @return Named list of resource groups, R6 environments. The name of the group
#'   concatenates the subscription identifier with the resource group name with
#'   full-stop delimiter.
#' @export
#' @examples
#' \dontrun{
#' purrr::keep(list_resource_groups(), ~ .x$name == "rg")
#' }
list_resource_groups.NULL <- function(x, ...) {
  do.call(c, lapply(list_subscriptions(), list_resource_groups, ...))
}

#' Get Resource Group by Name
#' @param x Azure subscription.
#' @param name Name of resource group.
#' @export
get_resource_group <- function(x, name) {
  UseMethod("get_resource_group")
}

#' @export
get_resource_group.az_subscription <- function(x, name) {
  x$get_resource_group(name)
}
