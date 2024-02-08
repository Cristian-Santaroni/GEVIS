

hello <- function(data, dataC, dataN, variation, thr_prc) {
  ind <- which(variation <= thr_prc)
  number <- nrow(data)
  print(paste("genes before filtering:", number))

  newdata <- data[-ind, ]
  newdataC <- dataC[-ind, ]
  newdataN <- dataN[-ind, ]
  
  # Exclude the first column (gene names) before calculating row means
  newdataC_numeric <- as.matrix(newdataC[, -1])
  newdataN_numeric <- as.matrix(newdataN[, -1])

  number <- nrow(newdata)

  # Calculate row means for numeric columns only
  logFC <- rowMeans(newdataC_numeric) - rowMeans(newdataN_numeric)


  print(paste("genes after filtering:", number))

  # Create a named vector with gene names as names and log fold change values as elements
  logFC_named <- setNames(logFC, newdataC[, 1])

  # Convert named vector to a data frame with columns "Gene" and "logFC"
  logFC_df <- data.frame(Gene = names(logFC_named), logFC = logFC_named, row.names = NULL)

  # Convert data frame to a JSON string
  logFC_json <- jsonlite::toJSON(logFC_df, auto_unbox = TRUE)

  # Print or return the JSON string
  print(logFC_json)


  return(list(newdata = newdata, newdataC = newdataC, newdataN = newdataN, logFC = logFC_json))
}

