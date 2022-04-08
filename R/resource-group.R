#' Get Resource Group by Name
#' @param x Azure subscription.
#' @param name Name of resource group.
#' @export
get_resource_group <- function(x, name) {
  UseMethod("get_resource_group")
}

#' @export
get_resource_group.NULL <- function(x, name) {
  purrr::keep(list_resource_groups(), ~ .x$name == name)
}
