# GEVIS - Gene Expression VIS

## Description

This project implements a dashboard for conducting a differential gene expression analysis. The dashboard provides interactive visualization and analysis tools to explore gene expression data and identify differentially expressed genes between two biological conditions.

<img src="pictures\Screenshot 2024-03-06 170957.png" alt="Dashboard Image" style="max-width: 100%; height: auto;">

## Features

- **Interquartile Range (IQR) Graph:** Visualizes the interquartile range of gene expression data with a slider for selecting the desired range.
- **Log Transformation:** Applies a logarithmic transformation to the gene expression data to stabilize variance.
- **LogFC Distribution Graph:** Displays the distribution of log fold change (LogFC) values with a slider for selecting the LogFC threshold.
- **Statistical Testing:** Conducts a t-test to identify genes that show significant differences in expression levels between conditions. P-values and adjusted p-values using false discovery rate (FDR) are calculated.
- **Scatterplot:** Generates a scatterplot with each circle representing a gene, colored based on LogFC values. Upregulated genes are colored blue, downregulated genes are colored red, and genes that do not meet the LogFC or adjusted p-value thresholds are colored grey. Clicking on a gene triggers an animation and adds the corresponding axis in the scatterplot. Additionally, genes can be selected from a dropdown menu for further analysis.
- **Boxplot:** Displays the distribution of gene expression values across samples for selected genes. Users can interactively select genes from the scatterplot, and the corresponding boxplot will update to show the distribution of expression values for those genes. The boxplot allows users to visualize the variability in gene expression between sample groups and identify potential outliers or patterns.
- **Parallel Coordinate Plot:** Visualizes gene expression profiles across samples using parallel coordinates. Lines represent individual samples, and users can add or remove metadata axes, select encoding options, and interactively reorder axes. Clicking on a jitter in the scatterplot highlights the corresponding line in the parallel coordinate plot and viceversa.
- **Principal Component Analysis (PCA):** Performs PCA on the gene expression data to identify potential clusters or patterns among samples.
- **Heatmap:** Displays the variable contributions of genes to principal components computed through PCA analysis, facilitating a detailed examination of gene contributions to sample clustering and variability.

## Usage

1. Clone the repository to your local machine.
2. Run cd `GEVIS`.
3. Run `npm install`.
4. Run `docker run --name mybox -t -p 80:80 opencpu/rstudio`.
5. Open another terminal, `run docker exec -i -t mybox /bin/bash` then `sudo -i`, `apt-get update` and finally `apt-get install cmake`.
6. Go on localhost/rstudio/ (user: opencpu, passwd: opencpu)
7. Create a package, calling it "GEVIS", and paste inside the hello.R function the content of the file that you will find [here](R\R\hello.R), then press Ctrl+Shift+B for build the project
8. Finally, in the terminal you opened at the first point, run `node ./server.js`
9. Go on localhost:3000 and use the interactive sliders and graphs to explore the gene expression data and identify differentially expressed genes.


## Contributors

- [Francesco Fortunato](https://github.com/francesco-fortunato)
- [Cristian Santaroni](https://github.com/Cristian-Santaroni)

## License

This project is licensed under the [MIT License](LICENSE).
