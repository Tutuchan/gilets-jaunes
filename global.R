library(shiny)
library(DT)
library(argonR)
library(argonDash)
library(magrittr)
library(leaflet)

rassemblements <- sf::st_read("data/RASSEMBLEMENTS.kml", layer = "RASSEMBLEMENTS")

parse_description <- function(x) {
  matches <- gregexpr("https://www.facebook.com/events/([[:digit:]]*)", x)
  if (length(matches) > 0) {
    url <- lapply(matches, function(match) {
      url <- substr(x, match, match + attr(match, "match.length"))
      if (grepl("277506326438568", url)) return(NULL)
      url
    }) %>% 
      unlist()
  }
}

rassemblements$URL <- vapply(rassemblements$description, parse_description, character(1))
urls <- paste0("<a href='", rassemblements$URL, "' target=_blank>Facebook group</a>")
urls[rassemblements$URL == ""] <- ""
rassemblements$popup <- paste(rassemblements$Name, urls, sep = "<br>")

dt <- data.frame(
  nom = rassemblements$Name,
  site = rassemblements$URL,
  stringsAsFactors = FALSE
)

icon_gilet <- icons("www/giletjaune.png", iconWidth = 64, iconHeight = 64)
