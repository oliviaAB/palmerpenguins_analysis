library(targets)
library(here)

source(here("R/helper_functions.R"))

list(
  tar_target(penguins_raw_file, here("data/penguins_raw.csv"), format = "file"),
  
  tar_target(penguins_df, read_data(penguins_raw_file)),
  
  tar_target(body_mass_plot, violin_plot(penguins_df, body_mass_g)),
  
  tar_target(flipper_length_plot, violin_plot(penguins_df, flipper_length_mm)),
  
  tar_target(bill_scatterplot, plot_bill_length_depth(penguins_df))
)