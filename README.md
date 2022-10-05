
# testPackage

<!-- badges: start -->
<!-- badges: end -->

testPackage is a package created for the Reproducible Research in R workshop. 
The package is used to read in e-mail addresses that have been saved in bulk as PDF and convert the e-mails into a single data frame containing the variables:
* Subject (the subject of the e-mail)
* Date (the date the e-mail was sent)
* From (the e-mail address of the sender)
* To (the e-mail address of the recipient)
* Content (the content of the e-mail)

The package's main function is emailPDFdf() which carries out all of the required processes to read in the PDF of e-mails and convert this to a data frame.

The user can also use pdfselect() to view the pdf data as a list.

The remaining functions are helper functions that create each of the necessary variables.


## Installation

You can install the development version of testPackage like so:

``` r
devtools::install_github("jhrudey/testPackage")

library(testPackage)
```

## Examples

You can use testdata.pdf to run the entire process of the emailPDFdf() function. 

You can also use the emaillist.Rda in data/ which is a list that has been produced after running testdata.pdf through pdfselect(). You can then
use this emaillist.Rda to see how each of the following functions works to product an individual variable:
* subject_var()
* date_var()
* from_var()
* to_var()
* content_var()


