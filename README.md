# Statistics for Linguists

Introductory statistics in R for linguists, from tidyverse basics to mixed-effects models. University of Konstanz.

Course materials for *Statistics for Linguists* (Dr Massimiliano Canzi, Department of Linguistics, University of Konstanz). The course introduces data analysis in R, from the tidyverse and descriptive statistics to linear regression, categorical predictors, interactions, significance testing, linear mixed models (`lme4`), mixed-effects logistic regression with `glmer()`, power and model building. Lectures follow the structure of Winter (2019), *Statistics for Linguists: An Introduction Using R*, with new examples and data sets. Slides are R Markdown (revealjs) files that render to self-contained HTML; tutorials are R Markdown exercise sheets.

## Rendering the slides

Knit `source/render_all.Rmd` to render every lecture into `docs`, which GitHub Pages serves. Knitting a single lecture also writes its HTML into `docs`. Each lecture picks its look with one line in its header (`css: theme-light.css`, `theme-dark.css` or `theme-purple.css`); `source/slides_setup.R` reads that line and matches the plot colours to it. The fonts are in `source/fonts` and are embedded in each HTML file.

## License

Course materials © Massimiliano Canzi, licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (see `LICENSE`). Code is licensed under the MIT License (see `LICENSE-CODE`). The fonts used in the slide themes (Atkinson Hyperlegible, Bricolage Grotesque, JetBrains Mono) are licensed under the SIL Open Font License 1.1.
