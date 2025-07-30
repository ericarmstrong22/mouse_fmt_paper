## Maaslin for differential abundance testing.
library(devtools)
library(Maaslin2)

# Read in species-level taxonomic relative abundance data and metadata.
input_data <- read.table(file = species.tsv, sep = "\t", header = T, row.names = 1)
input_metadata <- read.table(file = metadata.tsv, sep = "\t", header = T, row.names = 1)

# Assess differentially abundant species between humans and mice.
fit_species_data <- Maaslin2(
  input_data, input_metadata, 'host_species_output',
  fixed_effects = c("host_species"),
  random_effects = c("donor","donor_timepoint"),
  max_significance = 0.05,
  standardize = FALSE)

# Assess differentially abundant functional pathways between humans and mice.
input_pathway_data <- read.table(file = pathways.tsv, sep = "\t", header = T, row.names = 1)
input_metadata <- read.table(file = metadata.tsv, sep = "\t", header = T, row.names = 1)

fit_pathways_data <- Maaslin2(
  input_pathway_data, input_metadata, 'host_pathway_output',
  fixed_effects = c("host_species"),
  random_effects = c("donor","timepoint"),
  max_significance = 0.05,
  standardize = FALSE)