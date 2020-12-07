#' Obliczenia emisji spalin
#'
#' @param dane dataframe
#' @param kategoria character
#' @param paliwo character
#' @param typ character
#' @param stan character
#' @param tech character
#' @param sub character
#'
#' @return
#' @import dplyr tidyverse ggplot2 magrittr
#' @export
#'
#' @examples

emisja<- function(dane = input,
                  kategoria = "Passenger Cars",
                  paliwo = "Petrol Hybrid",
                  typ = "Small",
                  stan = "Euro 4",
                  tech = "PFI",
                  sub = "CH4"
){


    out <- wskazniki %>%
      filter(Category %in% kategoria)%>%
      filter(Fuel %in% paliwo)%>%
      filter(Segment %in% typ)%>%
      filter(Segment %in% typ)%>%
      filter(Euro.Standard %in% stan)%>%
      filter(Technology %in% tech)%>%
      filter(Pollutant %in% sub)


  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  return(out)

}
