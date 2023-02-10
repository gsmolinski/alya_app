set_content <- function(content_directory, chapters) {
  main_urls <- lapply(dir(glue::glue("www/{content_directory}"), full.names = TRUE),
                      function(x) dir(x, full.names = TRUE))
  if (content_directory == "picture") {
    content <- lapply(main_urls,
                      function(x) lapply(x,
                                         function(e) shinyglide::screen(tags$img(src = substr(e, 5, 1000),
                                                                                 class = content_directory))))
  } else if (content_directory == "sound") {
    content <- lapply(main_urls,
                      function(x) lapply(x,
                                         function(e) substr(e, 5, 1000))) # remove www/ for Shiny
  }
  names(content) <- chapters
  content
}
