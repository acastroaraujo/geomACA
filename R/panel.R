

#' Custom Panel Backgrounds
#'
#' @param mapping Set of aesthetic mappings created by aes(). If specified
#' and inherit.aes = TRUE (the default), it is combined with the default
#' mapping at the top level of the plot. You must supply mapping if there
#' is no plot mapping.
#' @param data The data to be displayed in this layer.
#' @param ... Other arguments passed on to layer()
#'
#' @export
#'
geom_rect_bkg <- function(mapping = NULL, data = NULL, ...) {
  ggplot2::layer(
    stat = StatFilter, geom = "rect",
    position = "identity", inherit.aes = FALSE,
    params = list(xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, ...),
    data = data, mapping = mapping
  )
}


