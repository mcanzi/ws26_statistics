slide_palette <- list(
  pandan = "#5cc48a", hornbill = "#f2d45c", kingfisher = "#5aa0e0", orchid = "#e08ab8",
  mist = "#e3e8e1", moss = "#6f8a7a", muted = "#8e9e96", floor_col = "#0b110e",
  vine = "#24332c", dim_col = "#1d2a24", qr_dark = "#0b110e", qr_light = "#e3e8e1"
)
list2env(slide_palette, envir = environment())

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
slides_url <- paste0("https://mcanzi.de/ws26_statistics/", lecture_file)

qr_uri <- ""
if (requireNamespace("qrcode", quietly = TRUE)) {
  qr_file <- tempfile(fileext = ".svg")
  qrcode::generate_svg(qrcode::qr_code(slides_url), filename = qr_file,
                       foreground = qr_dark, background = qr_light, show = FALSE)
  qr_uri <- xfun::base64_uri(qr_file)
}
qr_css <- if (nzchar(qr_uri)) sprintf('url("%s")', qr_uri) else "none"
