slide_palettes <- list(
  dark = list(
    pandan = "#cb6d67", hornbill = "#e8a33d", kingfisher = "#45b4c8", orchid = "#e39ac0",
    mist = "#e4e7d8", moss = "#7f9b78", muted = "#a3abb3", floor_col = "#141619",
    vine = "#343a42", dim_col = "#2a2f35", qr_dark = "#141619", qr_light = "#e4e7d8"
  ),
  light = list(
    pandan = "#b3443d", hornbill = "#a8701c", kingfisher = "#3f7470", orchid = "#6b5b95",
    mist = "#2b2723", moss = "#8a8c74", muted = "#6e675e", floor_col = "#f3eee5",
    vine = "#e0d8cb", dim_col = "#ebe4d8", qr_dark = "#2b2723", qr_light = "#fbf9f5"
  ),
  purple = list(
    pandan = "#9d6bf0", hornbill = "#c9a23f", kingfisher = "#e2772f", orchid = "#d16fb8",
    mist = "#e7e0f2", moss = "#8a7aa6", muted = "#9b8fb0", floor_col = "#0c0911",
    vine = "#2f2541", dim_col = "#1c1527", qr_dark = "#0c0911", qr_light = "#e7e0f2"
  )
)

slide_css <- tryCatch(rmarkdown::metadata$output[[1]]$css, error = function(e) NULL)
slide_theme <- if (length(slide_css) == 0) "dark" else sub("^theme-(.*)\\.css$", "\\1", basename(slide_css[1]))
if (!slide_theme %in% names(slide_palettes)) slide_theme <- "dark"
list2env(slide_palettes[[slide_theme]], envir = environment())

knitr::opts_chunk$set(
  comment = "",
  collapse = FALSE,
  class.output = "r-output",
  class.message = "r-output r-message",
  class.warning = "r-output r-message",
  class.error = "r-output r-error",
  dev.args = list(bg = "transparent")
)

plot_font <- ""
if (requireNamespace("ragg", quietly = TRUE) && requireNamespace("systemfonts", quietly = TRUE)) {
  plot_font <- "Atkinson Hyperlegible Slides"
  if (!plot_font %in% systemfonts::registry_fonts()$family) {
    systemfonts::register_font(
      plot_font,
      plain = "fonts/AtkinsonHyperlegible-Regular.ttf",
      bold = "fonts/AtkinsonHyperlegible-Bold.ttf",
      italic = "fonts/AtkinsonHyperlegible-Italic.ttf",
      bolditalic = "fonts/AtkinsonHyperlegible-BoldItalic.ttf"
    )
  }
  knitr::opts_chunk$set(dev = "ragg_png")
}

ggplot2::theme_set(
  ggplot2::theme_minimal(base_size = 18, base_family = plot_font) +
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "transparent", colour = NA),
      panel.background = ggplot2::element_rect(fill = "transparent", colour = NA),
      panel.grid = ggplot2::element_line(colour = vine),
      panel.grid.minor = ggplot2::element_blank(),
      text = ggplot2::element_text(colour = mist),
      axis.text = ggplot2::element_text(colour = muted),
      strip.text = ggplot2::element_text(colour = mist, hjust = 0),
      legend.position = "bottom"
    )
)
if (nzchar(plot_font)) {
  ggplot2::update_geom_defaults("text", list(family = plot_font))
  ggplot2::update_geom_defaults("label", list(family = plot_font))
}
options(
  ggplot2.discrete.colour = c(kingfisher, hornbill, orchid),
  ggplot2.discrete.fill = c(kingfisher, hornbill, orchid)
)

lecture_file <- sub("(\\.knit)?\\.(Rmd|md)$", ".html", knitr::current_input())
lecture_count <- length(list.files(pattern = "^[0-9]{2}_.*\\.Rmd$"))
lecture_label <- sprintf('"lecture %s / %s"', substr(lecture_file, 1, 2), lecture_count)
slides_url <- paste0("https://mcanzi.github.io/ws26_statistics/", lecture_file)

qr_uri <- ""
if (requireNamespace("qrcode", quietly = TRUE)) {
  qr_file <- tempfile(fileext = ".svg")
  qrcode::generate_svg(qrcode::qr_code(slides_url), filename = qr_file,
                       foreground = qr_dark, background = qr_light, show = FALSE)
  qr_uri <- xfun::base64_uri(qr_file)
}
qr_css <- if (nzchar(qr_uri)) sprintf('url("%s")', qr_uri) else "none"
