library(shiny)

ui <- fluidPage(
  titlePanel("Breeding Insight Code Repository"),
  mainPanel(
    tableOutput("static_table")
  )
)

server <- function(input, output, session) {
  output$static_table <- renderUI({
    data <- data.frame(
      Name = c("BIGapp", "TroutApp", "SlurmGenerator", "QR code generator", "FieldBook2DeltaBreed"),
      Main_functions = c(
        "a-to-z genomic analyses", 
        "Mate allocation and breeding decisions", 
        "Slurm script generator", 
        "Generates QR codes from a docx list",
        "Converts Fieldbook Output to DeltaBreed format"
      ),
      Location = c(
        "https://github.com/Breeding-Insight/BIGapp", 
        "https://github.com/ackermanar/trout-app", 
        "https://bi-slurm-generator.shinyapps.io/slurm/",
        "https://github.com/Breeding-Insight/QR_generator",
        "https://tnst4x-aj0ackerman.shinyapps.io/fieldbook2deltabreed/"
      ),
      stringsAsFactors = FALSE
    )
    
    # Generate a dynamic HTML table with links
    tableHTML <- "<table class='table'>"
    tableHTML <- paste0(
      tableHTML, 
      "<thead><tr>",
      "<th>Name</th><th>Main Functions</th><th>Location</th>",
      "</tr></thead><tbody>"
    )
    
    for (i in 1:nrow(data)) {
      tableHTML <- paste0(
        tableHTML, 
        "<tr>",
        "<td>", data$Name[i], "</td>",
        "<td>", data$Main_functions[i], "</td>",
        "<td><a href='", data$Location[i], "' target='_blank'>", data$Location[i], "</a></td>",
        "</tr>"
      )
    }
    tableHTML <- paste0(tableHTML, "</tbody></table>")
    
    HTML(tableHTML)
  })
}

shinyApp(ui = ui, server = server)