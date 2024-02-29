library(factoextra)
library(FactoMineR)
library(dplyr)
hello <- function(data) {
  # Save the column of genes before removing the last column
  genes <- data[, ncol(data)]

  # Assuming data, dataN, and dataC are your matrices
  data <- data[, -ncol(data)]


  N <- 49
  M <- 58
  # Now, the last column has been removed from each matrix

  # x is the first gene of the data matrix
  pval <- apply(data, 1, function(x) {
    t.test(x[1:N], x[(N+1):(M+N)], paired=FALSE)$p.value
  })

  # Adjustment p-value
  pval_adj <- p.adjust(pval, method="fdr")

  # Add the column of genes back to the result
  result <- data.frame(Gene = genes, pval_adj = pval_adj)

  return(result)
}

pca <- function(data, dataC, dataN) {
  library(FactoMineR)
  library(factoextra)
  library(dplyr)

  data1 <- as.data.frame.list(data)

  # Move the last column to the first position
  data1 <- data1[, c(ncol(data1), 1:(ncol(data1)-1))]

  # Set the first column as row names
  rownames(data1) <- data1[, 1]

  # Remove the first column (it's now the row names)
  data1 <- data1[, -1]

  # Print the updated data frame
  #print(data1)




  gsmC <- colnames(dataC)
  gsmN <- colnames(dataN)


  # Convert GSM headers to vectors and remove the last element
  gsmC_vector <- head(unlist(gsmC), -1)
  gsmN_vector <- head(unlist(gsmN), -1)


  # Combine data from case and normal samples
  data1 <- t(data1[, c(gsmC_vector, gsmN_vector)])
  # Create groups vector
  groups <- c(rep("case", length(gsmC_vector)), rep("normal", length(gsmN_vector)))

  # Perform PCA
  pca <- prcomp(data1, center = TRUE, scale. = TRUE, retx = TRUE)

  # Compute scores
  scores <- pca$x

  # Convert scores to a data frame
  scores_df <- as.data.frame(scores)
  scores_df$Group <- groups

  # Get PCA variable contributions
  scores_var <- get_pca_var(pca)$contrib
  colnames(scores_var) <- paste0('PC', seq(1, ncol(scores_var)))

  # Sort by PC1 contribution
  scores_var <- scores_var[order(scores_var[,"PC1"], decreasing = TRUE), ]
  scores_var= as.data.frame(scores_var)
  # Get gene names
  gene_names <- rownames(scores_var)
  print(gene_names)

  # Return a list containing scores_df and scores_var
  return(list(scores_df = scores_df, scores_var = scores_var))
}

