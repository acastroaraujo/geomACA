
## I think I took this from Thomas Lin Pedersen??

StatFilter <- ggplot2::ggproto(
  'StatFilter', ggplot2::StatIdentity,
  setup_data = function(data, params) {
    if (any(names(data) == 'filter')) {
      if (!is.logical(data$filter)) {
        stop('filter must be logical')
      }
      data <- data[data$filter, names(data) != 'filter']
    }
    data
  },
  default_aes = aes(filter = TRUE)
)
