#' Wizualizacja danych - wykres
#'
#' @return plot
#' @param x double - dowolny wybrany wskaznik przez uzytkownika
#' @param y double - obliczona emisja spalin
#' @param z double - natezenie ruchu
#' @param out double - zestawienie wyników otrzymanych z funkcji 'emisja'
#' @import dplyr tidyverse ggplot2 magrittr
#' @export

wykres <- function(x,
                   dane = out,
                   y = .data$Emisja,
                   z = .data$Nat) {

  #przypisanie paramertrów

  x <- enquo(x)
  y <- enquo(y)
  z <- enquo(z)


  #zapisanie danych do zmiennej dane1

  dane1 <- rlang::eval_tidy(enexpr(x), dane)

  #warunek - argument x musi byc typu character

  if(is.character(dane1)){

  ggplot(dane,aes(!!x, !!y, colour = !!z)) +
    geom_boxplot(aes(color = !!y)) +
    geom_point(aes(color = !!z)) +
    scale_color_gradient(low = "green", high = "red")+
    theme(legend.position = "top") +
    ggtitle("Porównanie wybranego wskaźnika do emisji spalin")+
    theme_bw() -> wyk

    return(wyk)
}

  #informacja zwrotna jesli argument x jest typu numeric

    else
      print(" Nieprawidlowe dane dla argumentu x")

}
