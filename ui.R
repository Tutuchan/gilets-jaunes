sidebar <- argonDashSidebar(
  vertical = TRUE,
  skin = "light",
  background = "white",
  size = "md",
  side = "left",
  id = "my_sidebar",
  brand_url = "https://www.github.com/tutuchan/giletsjaunes",
  brand_logo = "giletjaune.png",
  argonSidebarHeader(title = "Gilets jaunes"),
  argonSidebarMenu(
    argonSidebarItem("Données", tabName = "tabData", icon = "table"),
    argonSidebarItem("Carte", tabName = "tabMap", icon = "map")
  )
)

header <- argonDashHeader(title = "Gilets Jaunes")

body <- argonDashBody(
  argonTabItems(
    argonTabItem(
      "tabData",
      argonRow(
        argonCard(
          width = 12,
          h2("Tous les rassemblements"),
          DTOutput("dt")
        )
      ),
      argonRow(
        argonCard(
          width = 12,
          h2("Origine des données"),
          p("Les données utilisées dans cette application proviennent de", tags$a(href = "https://www.google.com/maps/d/u/0/viewer?mid=1KpiLiS657xM-oR5eBHFSvP9lQM2Eyruh&ll=18.49050915137178%2C24.822041549999994&z=3", "cette carte."))
        )
      )
    ),
    argonTabItem(
      "tabMap",
      argonRow(
        argonCard(
          width = 12,
          leafletOutput("map", height = "600px")
        )
      )
    )
  )
)

ui <- argonDashPage(
  title   = "Gilets jaunes",
  sidebar = sidebar,
  header  = header,
  body    = body
    
)