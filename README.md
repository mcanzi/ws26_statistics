# Statistics

Slides for *Statistics* (Dr Massimiliano Canzi, Department of Linguistics, University of Konstanz), an introduction to data analysis in R for MA students in linguistics: from the tidyverse and descriptive statistics to linear models, interactions, significance testing, mixed models (`lme4`) and mixed-effects logistic regression (`glmer()`). The lectures follow Winter, B. (2019), *Statistics for Linguists: An Introduction Using R*, Routledge, with new examples and data sets.

| | Lecture | Winter (2019) |
|---|---|---|
| 1 | Course introduction | 1 |
| 2 | Data wrangling | 2 |
| 3 | Descriptive statistics | 3 |
| 4 | Linear models | 4 |
| 5 | Transformations | 5 |
| 6 | Multiple regression | 6 |
| 7 | Categorical predictors | 7 |
| 8 | Interactions | 8 |
| 9 | Significance testing | 9 |
| 10 | Mixed models 1 | 14 |
| 11 | Mixed models 2 | 15 |
| 12 | Mixed logistic regression | 12, 15.8 |
| 13 | Power and model building | 10, 11, 16 |

The slides are online at [mcanzi.de/ws26_statistics](https://mcanzi.de/ws26_statistics/01_course_introduction.html).

## Rendering the slides

Knit `source/render_all.Rmd` to render every lecture into `docs`, which GitHub Pages serves. Knitting a single lecture also writes its HTML into `docs`. All lectures use the forest theme of mcanzi.de (`source/theme-dark.css`): green-black, leaf green and moon yellow, with rafflesias drawn in ink in the background. `source/slides_setup.R` sets the plot colours to match it. The fonts are in `source/fonts` and are embedded in each HTML file.

Requires `tidyverse`, `revealjs`, `palmerpenguins`, `broom`, `lme4`, `lmerTest`, `effsize` and `languageR`; optional: `qrcode` (QR codes), `ragg` and `systemfonts` (Atkinson Hyperlegible in the figures).

## License

Course materials © Massimiliano Canzi, licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (see `LICENSE.md`). Code is licensed under the MIT License (see `LICENSE-CODE.md`). The fonts used in the slide theme (Atkinson Hyperlegible, Bricolage Grotesque, JetBrains Mono) are licensed under the SIL Open Font License 1.1 (see `source/fonts/OFL-*.txt`).
