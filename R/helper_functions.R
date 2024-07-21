#' Read and clean data
#' 
#' Reads in the penguins data, renames and select relevant columns. The
#' following transformations are applied to the data: 
#' * only keep species common name
#' * extract observation year
#' * remove rows with missing values
#' 
#' @param file Character, path to the penguins data .csv file.
#' @returns A tibble.
read_data <- function(file) {
  readr::read_csv(file, show_col_types = FALSE) |> 
    janitor::clean_names() |> 
    assertr::verify(
      assertr::has_all_names(
        "species", "island", "date_egg", "sex", "body_mass_g", 
        "culmen_length_mm", "culmen_depth_mm", "flipper_length_mm"
      )
    ) |> 
    assertr::assert(rlang::is_integerish, body_mass_g) |> 
    dplyr::mutate(
      species = stringr::word(species, 1),
      year = lubridate::year(date_egg),
      sex = stringr::str_to_lower(sex),
      year = as.integer(year),
      body_mass_g = as.integer(body_mass_g),
      dplyr::across(dplyr::where(is.character), as.factor)
    ) |> 
    dplyr::select(
      species,
      island,
      year,
      sex,
      body_mass_g,
      bill_length_mm = culmen_length_mm,
      bill_depth_mm = culmen_depth_mm,
      flipper_length_mm
    ) |> 
    tidyr::drop_na() |> 
    assertr::verify(flipper_length_mm > 0)
}

#' Violin plot of variable per island and sex
#'
#' Visualise using violin plots the distribution of a categorical variable, with
#' island on the x-axis and sex as colour.
#'
#' @param df Tibble, penguins data.
#' @param yvar Unquoted expression, name of the variable in `df` to plot.
#' @returns a ggplot.
violin_plot <- function(df, yvar) {
  df |> 
    ggplot2::ggplot(
      ggplot2::aes(x = island, colour = sex, fill = sex, y = {{ yvar }})
    ) +
    ggplot2::geom_violin(alpha = 0.3, scale = "width") +
    ggbeeswarm::geom_quasirandom(dodge.width = 0.9) +
    ggplot2::scale_colour_brewer(palette = "Set1") +
    ggplot2::scale_fill_brewer(palette = "Set1") +
    ggplot2::theme_minimal()
}

#' Scatterplot of bill length vs depth
#'
#' Plots bill length (x-axis) against bill depth (y-axis), with island as colour
#' and sex as point shape.
#'
#' @param df Tibble, penguins data.
#' @returns a ggplot.
plot_bill_length_depth <- function(df) {
  df |> 
    ggplot2::ggplot(
      ggplot2::aes(
        x = bill_length_mm, 
        y = bill_depth_mm, 
        colour = island, 
        shape = sex
        )
    ) +
    ggplot2::geom_point() +
    ggplot2::scale_colour_brewer(palette = "Set1") +
    ggplot2::theme_minimal()
}
