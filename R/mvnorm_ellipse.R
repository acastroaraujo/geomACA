

#' Custom Gaussian Ellipse
#'
#' @param mapping Set of aesthetic mappings created by aes(). If specified
#' and inherit.aes = TRUE (the default), it is combined with the default
#' mapping at the top level of the plot. You must supply mapping if there
#' is no plot mapping.
#' @param data The data to be displayed in this layer.
#' @param color color
#' @param segments I don't remember what this does
#' @param linewidth linewidth
#' @param alpha alpha
#' @param show.legend self-explanatory
#' @param ... Other arguments passed on to layer()
#'
#' @export
#'
geom_mvnorm_ellipse <- function(mapping = NULL, data = NULL, linewidth = 1/3, color = NA, segments = 1e3, alpha = 1/5, ..., show.legend = NA) {

  layer_fun <- function(level, linewidth, color, segments, alpha, ...) {
    ggplot2::layer(
      stat = StatEllipse, geom = "polygon",
      inherit.aes = TRUE, position = "identity", show.legend = show.legend,
      params = list(level = level, type = "norm", linewidth = linewidth, color = color, segments = segments, alpha = alpha, ...),
      data = data, mapping = mapping
    )
  }

  levels <- c(.99, seq(from = 9/10, to = 1/10, by = -1/10))
  purrr::map(levels, \(x) layer_fun(x, linewidth = linewidth, color = color, segments = segments, alpha = alpha, ...))

}



