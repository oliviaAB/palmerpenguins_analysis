# Analysis of penguins measurements

This project aims at understanding the differences between the size of three species of penguins (Adelie, Chinstrap and Gentoo) observed in the Palmer Archipelago, Antarctica. The data was collected by Dr Kristen Gorman between 2007 and 2009.

## Key contributors

- Jane Doe: project leader

- Kristen Gorman: data collection

- Olivia Angelin-Bonnet: data analysis

## Input data

The raw penguins measurements, stored in the `penguins_raw.csv` file, were downloaded from the 
[`palmerpenguins` package](https://allisonhorst.github.io/palmerpenguins/index.html).

### Data source

Adélie penguins: Palmer Station Antarctica LTER and K. Gorman. 2020. Structural size measurements and isotopic signatures of foraging among adult male and female Adélie penguins (Pygoscelis adeliae) nesting along the Palmer Archipelago near Palmer Station, 2007-2009 ver 5. Environmental Data Initiative. <doi:10.6073/pasta/98b16d7d563f265cb52372c8ca99e60f>

Gentoo penguins: Palmer Station Antarctica LTER and K. Gorman. 2020. Structural size measurements and isotopic signatures of foraging among adult male and female Gentoo penguin (Pygoscelis papua) nesting along the Palmer Archipelago near Palmer Station, 2007-2009 ver 5. Environmental Data Initiative. <doi:10.6073/pasta/7fca67fb28d56ee2ffa3d9370ebda689>

Chinstrap penguins: Palmer Station Antarctica LTER and K. Gorman. 2020. Structural size measurements and isotopic signatures of foraging among adult male and female Chinstrap penguin (Pygoscelis antarcticus) nesting along the Palmer Archipelago near Palmer Station, 2007-2009 ver 6. Environmental Data Initiative. <doi:10.6073/pasta/c14dfcfada8ea13a17536e73eb6fbe9e>

Originally published in: Gorman KB, Williams TD, Fraser WR (2014) Ecological Sexual Dimorphism and Environmental Variability within a Community of Antarctic Penguins (Genus Pygoscelis). PLoS ONE 9(3): e90081. <doi:10.1371/journal.pone.0090081>

## Analysis

- Data cleaning: a cleaned version of the dataset was saved as `penguins_cleaned.csv` on
[OneDrive](path/to/OneDrive/folder).

- *To be filled*

## Repository content

- `renv.lock`: list of packages used in the analysis (and their version)
- `analysis/`: collection of `R` scripts containing the analysis code
- `R/`: collection of `R` scripts containing helper functions used for the analysis
- `reports/`: collection of `Quarto` documents used to generate the reports

## How to reproduce the analysis

``` {r}
# Install the necessary packages
renv::restore()

# Run the analysis pipeline
targets::tar_make()
```
