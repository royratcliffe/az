#' List Resource Groups
#' @param x Azure subscription, or \code{NULL} for all available subscriptions.
#' @param ... Addition parameters for
#'   \code{\link[AzureRMR]{az_subscription}$list_resource_groups} S6 method.
#'   Azure supports `filter` by tag name and value; also `top` for limiting the
#'   number of resource groups.
#' @return List of resource groups.
#' @export
list_resource_groups <- function(x, ...) {
  UseMethod("list_resource_groups")
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
