# GEVIS - Gene Expression VIS

## Description

This project implements a dashboard for conducting a differential gene expression analysis. The dashboard provides interactive visualization and analysis tools to explore gene expression data and identify differentially expressed genes between two biological conditions.

<img src="pictures\Screenshot 2024-03-06 170957.png" alt="Dashboard Image" style="max-width: 100%; height: auto;">

## Features

- **Interquartile Range (IQR) Graph:** Visualizes the interquartile range of gene expression data with a slider for selecting the desired range.
- **Log Transformation:** Applies a logarithmic transformation to the gene expression data to stabilize variance.
- **LogFC Distribution Graph:** Displays the distribution of log fold change (LogFC) values with a slider for selecting the LogFC threshold.
- **Statistical Testing:** Conducts a t-test to identify genes that show significant differences in expression levels between conditions. P-values and adjusted p-values using false discovery rate (FDR) are calculated.
- **Scatterplot:** Generates a scatterplot with each circle representing a gene, colored based on LogFC values. Upregulated genes are colored blue, downregulated genes are colored red, and genes that do not meet the LogFC or adjusted p-value thresholds are colored grey.
- **Principal Component Analysis (PCA):** Performs PCA on the gene expression data to identify potential clusters or patterns among samples.

## Usage

1. Clone the repository to your local machine.
2. Run `npm install`.
3. Run `node ./server.js`
5. Go on localhost:3000 and use the interactive sliders and graphs to explore the gene expression data and identify differentially expressed genes.


## Contributors

- [Francesco Fortunato](https://github.com/francesco-fortunato)
- [Cristian Santaroni](https://github.com/Cristian-Santaroni)

## License

This project is licensed under the [MIT License](LICENSE).
