server <- function(input, output, session) {
  output$dt <- renderDT({
    datatable(
      data = dt,
      options = list(
        searching = FALSE,
        lengthChange= FALSE
        )
      )
  })
  
  output$map <- renderLeaflet({
    leaflet(data = rassemblements) %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(2.3522, 48.8566, zoom = 6) %>%
      addMarkers(clusterOptions = markerClusterOptions(), popup = ~popup, icon = icon_gilet)
  })
}