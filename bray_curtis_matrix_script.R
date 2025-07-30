## Bray-Curtis dissimilarity matrix.
# Pairwise dissimilarities were manually extracted for groupwise comparisons. 
# "data" is a data frame containing species-level relative abundances.
library(vegan)
matrix <- as.matrix(data)
dist <- vegdist(matrix, method = 'bray')