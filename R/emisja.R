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

emisja<- function(dane = dane_wej,
                  kategoria = "Passenger Cars",
                  paliwo = "Petrol Hybrid",
                  typ = "Small",
                  stan = "Euro 4",
                  tech = "PFI",
                  sub = "CH4"
){

  #data <- openxlsx::read.xlsx(xlsxFile = path)

  if(!is.null(kategoria)) {
    out <- dane_wej %>%
      filter(Category %in% kategoria)
  }

  if(!is.null(paliwo)) {
    out <- dane_wej %>%
      filter(Fuel %in% paliwo)
  }

  if(!is.null(typ)) {
    out <- dane_wej %>%
      filter(Segment %in% typ)
  }

  if(!is.null(stan)) {
    out <- dane_wej %>%
      filter(Euro.Standard %in% stan)
  }

  if(!is.null(tech)) {
    out <- dane_wej %>%
      filter(Technology %in% tech)
  }

  if(!is.null(sub)) {
    out <- dane_wej %>%
      filter(Pollutant %in% sub)
  }

  out <- dane_wej %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  return(out)

}
