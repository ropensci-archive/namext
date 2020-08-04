namext
======



[![R-check](https://github.com/ropenscilabs/namext/workflows/R-check/badge.svg)](https://github.com/ropenscilabs/namext/actions/)


`namext` - Extract scientific names from text using gnfinder

## Install


```r
remotes::install_github("ropenscilabs/namext")
```


```r
library("namext")
```

## xxxx

xxx


```r
x <- system.file("examples/BoegerEtal2015.pdf", package="namext")
name_extract(x)
#> $metadata
#> # A tibble: 1 x 9
#>   date  gnfinderVersion withBayes tokensAround language detectLanguage
#>   <chr> <chr>           <lgl>            <int> <chr>    <lgl>         
#> 1 2020… v0.11.1-2-g551… TRUE                 0 eng      FALSE         
#> # … with 3 more variables: totalWords <int>, totalCandidates <int>,
#> #   totalNames <int>
#> 
#> $names
#> # A tibble: 331 x 8
#>    cardinality verbatim   name      odds start   end annotationNomen… annotation
#>          <int> <chr>      <chr>    <dbl> <int> <int> <chr>            <chr>     
#>  1           1 (Teleoste… Teleos…   145.    84    95 NO_ANNOT         ""        
#>  2           1 Sciaenida… Sciaen… 38075.    96   107 NO_ANNOT         ""        
#>  3           1 MARIANA    Mariana  2171.   188   195 NO_ANNOT         ""        
#>  4           1 (Teleoste… Teleos…   145.   398   409 NO_ANNOT         ""        
#>  5           1 Sciaenida… Sciaen… 38075.   410   421 NO_ANNOT         ""        
#>  6           1 Pachyurin… Pachyu… 10451.   673   684 NO_ANNOT         ""        
#>  7           1 (Sciaenid… Sciaen… 38075.   685   697 NO_ANNOT         ""        
#>  8           1 Sciaenida… Sciaen… 38075.  1047  1058 NO_ANNOT         ""        
#>  9           1 Haemulidae Haemul… 38075.  1059  1069 NO_ANNOT         ""        
#> 10           1 Polypteri… Polypt… 86951.  1074  1086 NO_ANNOT         ""        
#> # … with 321 more rows
```

## Meta

* A collaboration with [California Academy of Sciences](http://www.calacademy.org/)
* Please [report any issues or bugs](https://github.com/ropenscilabs/namext/issues)
* License: MIT
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.
