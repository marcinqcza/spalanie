emisja<- function(data = input,
                  kategoria = "Passenger Cars",
                  paliwo = "Petrol Hybrid",
                  typ = "Small",
                  stan = "Euro 4",
                  tech = "PFI",
                  sub = "CH4"
){

  #data <- openxlsx::read.xlsx(xlsxFile = path)

  if(!is.null(kategoria)) {
    out <- wskazniki %>%
      filter(Category %in% kategoria)
  }

  if(!is.null(paliwo)) {
    out <- wskazniki %>%
      filter(Fuel %in% paliwo)
  }

  if(!is.null(typ)) {
    out <- wskazniki %>%
      filter(Segment %in% typ)
  }

  if(!is.null(stan)) {
    out <- wskazniki %>%
      filter(Euro.Standard %in% stan)
  }

  if(!is.null(tech)) {
    out <- wskazniki %>%
      filter(Technology %in% tech)
  }

  if(!is.null(sub)) {
    out <- wskazniki %>%
      filter(Pollutant %in% sub)
  }

  out <- wskazniki %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  return(data)

}
