crisprVerse: ecosystem of R packages for CRISPR gRNA design
================

-   [Installation and getting
    started](#installation-and-getting-started)
-   [Components](#components)
-   [Reproducibility](#reproducibility)

Authors: Jean-Philippe Fortin, Luke Hoberecht

Date: July 25, 2022

# Installation and getting started

The crisprVerse is a collection of packages for CRISPR guide RNA (gRNA)
design that can easily be installed with the `crisprVerse` package. This
provides a convenient way of downloading and installing all crisprVerse
packages with a single R command.

The package can be installed from Bioconductor using the following
commands in an R session:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("crisprVerse")
```

The core crisprVerse includes the packages that are commonly used for
gRNA design, and are attached when you attach the `crisprVerse` package:

``` r
library(crisprVerse)
```

You can check that all crisprVerse packages are up-to-date with
`crisprVerse_update()`:

``` r
crisprVerse_update()
```

    ## All crisprVerse packages up-to-date

# Components

The following packages are installed and loaded with the `crisprVerse`
package:

-   [crisprBase](https://github.com/Jfortin1/crisprBase) to specify and
    manipulate CRISPR nucleases.
-   [crisprBowtie](https://github.com/Jfortin1/crisprBowtie) to perform
    gRNA spacer sequence alignment with Bowtie.
-   [crisprScore](https://github.com/Jfortin1/crisprScore) to annotate
    gRNAs with on-target and off-target scores.
-   [crisprDesign](https://github.com/Jfortin1/crisprDesign) to design
    and manipulate gRNAs with `GuideSet` objects.

# Reproducibility

``` r
sessionInfo()
```

    ## R Under development (unstable) (2022-03-21 r81954)
    ## Platform: x86_64-apple-darwin17.0 (64-bit)
    ## Running under: macOS Catalina 10.15.7
    ## 
    ## Matrix products: default
    ## BLAS:   /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRblas.0.dylib
    ## LAPACK: /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRlapack.dylib
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ##  [1] crisprDesign_0.99.115 crisprScore_1.1.13    crisprScoreData_1.1.3
    ##  [4] ExperimentHub_2.3.5   AnnotationHub_3.3.9   BiocFileCache_2.3.4  
    ##  [7] dbplyr_2.1.1          BiocGenerics_0.42.0   crisprBowtie_1.1.1   
    ## [10] crisprBase_1.1.3      crisprVerse_0.99.2   
    ## 
    ## loaded via a namespace (and not attached):
    ##   [1] bitops_1.0-7                  matrixStats_0.61.0           
    ##   [3] bit64_4.0.5                   filelock_1.0.2               
    ##   [5] progress_1.2.2                httr_1.4.2                   
    ##   [7] GenomeInfoDb_1.32.2           tools_4.2.0                  
    ##   [9] utf8_1.2.2                    R6_2.5.1                     
    ##  [11] DBI_1.1.2                     tidyselect_1.1.2             
    ##  [13] prettyunits_1.1.1             bit_4.0.4                    
    ##  [15] curl_4.3.2                    compiler_4.2.0               
    ##  [17] cli_3.3.0                     Biobase_2.55.0               
    ##  [19] basilisk.utils_1.9.1          xml2_1.3.3                   
    ##  [21] DelayedArray_0.21.2           rtracklayer_1.55.4           
    ##  [23] randomForest_4.7-1            readr_2.1.2                  
    ##  [25] rappdirs_0.3.3                stringr_1.4.0                
    ##  [27] digest_0.6.29                 Rsamtools_2.11.0             
    ##  [29] rmarkdown_2.13                basilisk_1.9.2               
    ##  [31] XVector_0.35.0                pkgconfig_2.0.3              
    ##  [33] htmltools_0.5.2               MatrixGenerics_1.7.0         
    ##  [35] fastmap_1.1.0                 BSgenome_1.64.0              
    ##  [37] rlang_1.0.4                   rstudioapi_0.13              
    ##  [39] RSQLite_2.2.12                shiny_1.7.1                  
    ##  [41] BiocIO_1.5.0                  generics_0.1.2               
    ##  [43] jsonlite_1.8.0                BiocParallel_1.29.18         
    ##  [45] dplyr_1.0.8                   VariantAnnotation_1.41.3     
    ##  [47] RCurl_1.98-1.6                magrittr_2.0.2               
    ##  [49] GenomeInfoDbData_1.2.7        Matrix_1.4-0                 
    ##  [51] Rcpp_1.0.8.3                  S4Vectors_0.33.11            
    ##  [53] fansi_1.0.2                   reticulate_1.25              
    ##  [55] Rbowtie_1.36.0                lifecycle_1.0.1              
    ##  [57] stringi_1.7.6                 yaml_2.3.5                   
    ##  [59] SummarizedExperiment_1.25.3   zlibbioc_1.41.0              
    ##  [61] grid_4.2.0                    blob_1.2.2                   
    ##  [63] promises_1.2.0.1              parallel_4.2.0               
    ##  [65] crayon_1.5.0                  dir.expiry_1.3.0             
    ##  [67] lattice_0.20-45               Biostrings_2.64.0            
    ##  [69] GenomicFeatures_1.47.13       hms_1.1.1                    
    ##  [71] KEGGREST_1.35.0               knitr_1.37                   
    ##  [73] pillar_1.7.0                  GenomicRanges_1.48.0         
    ##  [75] rjson_0.2.21                  biomaRt_2.51.3               
    ##  [77] stats4_4.2.0                  BiocVersion_3.15.0           
    ##  [79] XML_3.99-0.9                  glue_1.6.2                   
    ##  [81] evaluate_0.15                 BiocManager_1.30.16          
    ##  [83] httpuv_1.6.5                  png_0.1-7                    
    ##  [85] vctrs_0.3.8                   tzdb_0.2.0                   
    ##  [87] purrr_0.3.4                   assertthat_0.2.1             
    ##  [89] cachem_1.0.6                  xfun_0.30                    
    ##  [91] mime_0.12                     xtable_1.8-4                 
    ##  [93] restfulr_0.0.13               later_1.3.0                  
    ##  [95] tibble_3.1.6                  GenomicAlignments_1.31.2     
    ##  [97] AnnotationDbi_1.57.1          memoise_2.0.1                
    ##  [99] IRanges_2.30.0                interactiveDisplayBase_1.33.0
    ## [101] ellipsis_0.3.2
