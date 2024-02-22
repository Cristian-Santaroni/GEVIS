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
