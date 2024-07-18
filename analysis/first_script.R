library(tidyverse)
library(janitor)
library(ggbeeswarm)
library(here)

# Reading and cleaning data
penguins_df <- read_csv(here("data/penguins_raw.csv"), show_col_types = FALSE) |> 
  clean_names() |> 
  mutate(
    species = word(species, 1),
    year = year(date_egg),
    sex = str_to_lower(sex),
    year = as.integer(year),
    body_mass_g = as.integer(body_mass_g),
    across(where(is.character), as.factor)
  ) |> 
  select(
    species,
    island,
    year,
    sex,
    body_mass_g,
    bill_length_mm = culmen_length_mm,
    bill_depth_mm = culmen_depth_mm,
    flipper_length_mm
  ) |> 
  drop_na()

## Violin plot of body mass per island and sex
penguins_df |> 
  ggplot(aes(x = island, colour = sex, fill = sex, y = body_mass_g)) +
  geom_violin(alpha = 0.3, scale = "width") +
  geom_quasirandom(dodge.width = 0.9) +
  scale_colour_brewer(palette = "Set1") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()

## Violin plot of flipper length per island and sex
penguins_df |> 
  ggplot(aes(x = island, colour = sex, fill = sex, y = flipper_length_mm)) +
  geom_violin(alpha = 0.3, scale = "width") +
  geom_quasirandom(dodge.width = 0.9) +
  scale_colour_brewer(palette = "Set1") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()

## Scatter plot of bill length vs depth, coloured by island and 
penguins_df |> 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, colour = island, shape = sex)) +
  geom_point() +
  scale_colour_brewer(palette = "Set2") +
  theme_minimal()
