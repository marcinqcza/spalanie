# Spalanie

Pakiet 'spalanie' zostal stworzy na potrzeby przedmiotu Metody inwentaryzacji i szacowania emisji. Jego glownym przeznaczeniem jest obliczania emisji spalni generowanych przez pojazdy.
Otrzymane wyniki mozna zaprezentowac na wykresie który jest dolaczony do stworzonego pakietu.

## Instalacja z winietą

```{r setup, eval=FALSE}
knitr::opts_chunk$set(eval = FALSE, include = FALSE)
# instalacja potrzebnego pakietu devtools
if (!require(devtools)) {install.packages("devtools"); require(devtools)}
# instalacja pakietu spalanie
install_github("", force = T, build_vignettes = T)
library(spalanie)
```

## Przykladowe zastosowanie 

Pakiet zawiera pliki danych 'input' i 'wskazniki' które umozliwiaja latwiejsze uzycie jego mozliowsci. Funkcja 'emisja' uzywa domyslnych danych natomiast prezentacja wyników 'wykres' nalezy wpisac jaki wskaznik chcemy porównac do natezenia i obliczonej emisji.

```{r example, eval=FALSE}
emisja()
wykres(Fuel)
```

