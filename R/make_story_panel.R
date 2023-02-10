make_story_panel <- function(idx, chapters, pictures) {
  tagList(
    conditionalPanel(glue::glue("input.stories == '{chapters[[idx]]}'"),
                     fluidRow(
                       column(12, glide(id = glue::glue("{chapters[[idx]]}"),
                                        tagList(pictures[[chapters[[idx]]]])))
                     )
    )
  )
}
