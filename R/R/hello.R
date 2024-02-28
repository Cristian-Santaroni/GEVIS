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

pca <- function(data,dataC,dataN){


  gsmC <- colnames(dataC)

  # Extract GSM headers from dataN
  gsmN <- colnames(dataN)


  # Convert gsmC to a vector
  gsmC_vector <- unlist(gsmC)

  # Convert gsmN to a vector
  gsmN_vector <- unlist(gsmN)

  # Remove the last element from gsmC_vector
  gsmC_vector <- head(gsmC_vector, -1)

  # Remove the last element from gsmN_vector
  gsmN_vector <- head(gsmN_vector, -1)

  data <- t(data[,c(gsmC_vector, gsmN_vector)])

  groups <- c(rep("case", length(gsmC_vector)), rep("normal", length(gsmN_vector)))
  pca <- prcomp(data, center = T, scale. = T, retx = T)
  ################################################
  # 3. Compute score and score plot
  # (scores = the coordinates of old data (observations) in the new systems, that are the PCs)

  # pca$x = t(data)*pca$rotation
  scores <- pca$x
  # Convert scores to a data frame
  scores_df <- as.data.frame(scores)

  # Add a column for groups
  scores_df$Group <- groups


  return(scores_df)


  #extracted = t(extracted)


  #groups <- c(rep("case", length(dataC)), rep("normal", length(dataN)))
  #pca <- prcomp(extracted, center = T, scale. = T, retx = T)
  #scores <- pca$x





}
