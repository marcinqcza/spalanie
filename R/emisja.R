#' Obliczenia emisji spalin
#'
#' @param dane dataframe - dane wejsciowe
#' @param kategoria character - kategoria pojazdu - Passenger Cars,Light Commercial Vehicles,Heavy Duty Trucks,Buses,L-Category
#' @param paliwo character - Petrol, Diesel, Petrol Hybrid, LPG Bifuel ~ LPG, LPG Bifuel ~ Petrol, CNG Bifuel ~ CNG, CNG Bifuel ~ Petrol, CNG, Biodiesel
#' @param typ character - segment pojazdu - Mini, Small, Medium, Large-SUV-Executive, itp
#' @param stan character - norma dopuszczalnych emisji spalin - Euro 1, Euro 2, Euro 3, Euro 4, Euro 5, Euro 6, itp
#' @param tech character - technologia ograniczenia spalin - GDI, PFI, GDI+GPF, DPF, DPF+SCR, LNT+DPF, SCR, EGR
#' @param sub character - rodzaj emitowanego zanieczyszczenia - CO, NOx, VOC, PM Exhaust, EC, CH4, NH3, N2O
#' @return
#' @import dplyr tidyverse ggplot2 magrittr
#' @export


emisja<- function(dane = input,
                  kategoria = "Passenger Cars",
                  paliwo = (c("Petrol","Petrol Hybrid","Diesel")),
                  typ = (c("Small","Mini")),
                  stan = "Euro 4",
                  tech = (c("PFI","DPF")),
                  sub = "CH4")
  {

  # wyfiltrowanie

  out <- wskazniki %>%
    filter(Category %in% kategoria)%>%
    filter(Fuel %in% paliwo)%>%
    filter(Segment %in% typ)%>%
    filter(Euro.Standard %in% stan)%>%
    filter(Technology %in% tech)%>%
    filter(Pollutant %in% sub)

  # dodanie kolumny natezenie

  out$Nat <- rnorm(nrow(out), mean = 100, sd = 50)

  # obliczanie emisji

  out <- out %>%
    mutate(Emisja = Nat* ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Segment, Euro.Standard, Technology, Pollutant, Mode,Nat, Emisja)

  # zapiasnie wyników

  out <<- out

  return(out)

}
