#' Obliczenia emisji spalin
#'
#' @param dane dataframe
#' @param kategoria character
#' @param paliwo character
#' @param typ character
#' @param stan character
#' @param tech character
#' @param sub character
#' @return
#' @import dplyr tidyverse ggplot2 magrittr
#' @export
#' @examples

emisja<- function(dane = input,
                  kategoria = "Passenger Cars",
                  paliwo = (c("Petrol","Petrol Hybrid","Diesel")),
                  typ = (c("Small","Mini")),
                  stan = "Euro 4",
                  tech = (c("PFI","DPF")),
                  sub = "CH4")
  {

  out <- wskazniki %>%
    filter(Category %in% kategoria)%>%
    filter(Fuel %in% paliwo)%>%
    filter(Segment %in% typ)%>%
    filter(Euro.Standard %in% stan)%>%
    filter(Technology %in% tech)%>%
    filter(Pollutant %in% sub)

  out$Nat <- rnorm(nrow(out), mean = 100, sd = 50)

  out <- out %>%
    mutate(Emisja = Nat* ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Segment, Euro.Standard, Technology, Pollutant, Mode,Nat, Emisja)

  out <<- out

  return(out)

}
