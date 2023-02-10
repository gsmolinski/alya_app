library(shiny)

chapters <- c("home", "story_1", 'story_2')
chapters_labels <- c("Home", "First Story", "Second Story")
content_directory <- c("picture", "sound")

content <- setNames(lapply(content_directory, set_content, chapters = chapters), content_directory)
story_panel <- lapply(seq_along(chapters), make_story_panel, chapters = chapters, pictures = content[["picture"]])

ui <- fluidPage(
  tags$head(tags$link(rel = "stylesheet", href = "css/stylesheet.css")),
  theme = bslib::bs_theme(5, bootswatch = "quartz"),
  br(),
  sidebarLayout(
    sidebarPanel(width = 3,
      fluidRow(
        column(12, shinyWidgets::radioGroupButtons("stories",
                                     choices = setNames(chapters, chapters_labels),
                                     status = "primary", direction = "vertical"))
      ),
      br(),
      br(),
      fluidRow(
        column(12, uiOutput("play"))
      )
    ),
    mainPanel(width = 9,
              tags$div(id = "main_story",
                       story_panel
              )
    )
  )
)

server <- function(input, output, session) {
  
  output$play <- renderUI({
    id <- paste0("shinyglide_index_", input$stories)
      if (length(as.numeric(input[[id]])) == 0) {
        idx <- 0
      } else {
        idx <- as.numeric(input[[id]])
      }
    idx <- idx + 1 # because in shinyglide it starts from 0
    
    content[["sound"]][[input$stories]][[idx]]
  })
  
}

shinyApp(ui, server)
