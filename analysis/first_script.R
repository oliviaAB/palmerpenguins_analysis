library(here)

source(here("R/helper_functions.R"))

penguins_df <- read_data(here("data/penguins_raw.csv"))

body_mass_plot <- violin_plot(penguins_df, body_mass_g)

flipper_length_plot <- violin_plot(penguins_df, flipper_length_mm)

bill_scatterplot <- plot_bill_length_depth(penguins_df)