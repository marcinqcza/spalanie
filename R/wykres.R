wykres <- function(out,x,y,z) {

  x <- enquo(x)
  y <- enquo(y)
  z <- enquo(z)

  ggplot(out,aes(!!x, !!y, colour = !!z)) +
    geom_boxplot(aes(color = !!y)) +
    geom_point(aes(color = !!z)) +
    scale_color_gradient(low = "green", high = "red")+
    theme(legend.position = "top") +
    theme_bw() -> wyk

  return(wyk)
}
