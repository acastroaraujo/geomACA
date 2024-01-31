

#' Title
#'
#' @param data The data to be displayed in this layer.
#' @param fill fill
#' @param color color
#' @param size size
#' @param segments I don't remember what this does
#'
#' @return
#' @export
#'
geom_norm_ellipse <- function(
    data = NULL, fill = "#333333",
    color = NA, size = 1/3, segments = 1e3
) {

  levels <- c(seq(from = 1/10, to = 9/10, by = 1/10), .99)

  geom_ellipse <- function(x, type = "norm", fill, size, segments, color) {

    ggplot2::stat_ellipse(
      data = data,
      type = type,
      level = x,
      geom = "polygon", alpha = 1/8,
      fill = fill,
      linewidth = size,
      segments = segments,
      color = color
    )
  }

  purrr::map(levels, geom_ellipse, fill = fill, color = color, segments = segments, size = size)

}
