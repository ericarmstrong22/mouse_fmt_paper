## PCoA with Bray-Curtis dissimilarities.
# "data" is a data frame containing host species metadata (human vs mouse) in the first column and species-level relative abundances in subsequent columns.
library(ecodist)
library(vegan)
library(ggplot2)
matrix <- as.matrix(data[,2:ncol(data)])
bray_curtis_dist <- vegdist(matrix, method = "bray")
bray_curtis_pcoa <- pco(bray_curtis_dist)

# Return the coordinates and metadata (in this case, host species) of each data point for the first two PCoA axes for presentation in Prism.
cat(data$host_species)
cat(bray_curtis_pcoa$vectors[,1])
cat(bray_curtis_pcoa$vectors[,2])

# Percentage of variance explained by each axis.
axis1_prop_var <- bray_curtis_pcoa$values[1]/sum(bray_curtis_pcoa$values)
axis2_prop_var <- bray_curtis_pcoa$values[2]/sum(bray_curtis_pcoa$values)

# PERMANOVA to accompany PCoA.
dist <- vegdist(matrix, method = 'bray')
res <- adonis2(dist ~ as.factor(host_species), data = data, permutations=9999)
res