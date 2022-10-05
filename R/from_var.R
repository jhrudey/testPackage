
#' Generate vector from text in "From" field of ingested emails
#'
#' Emails saved as one pdf file are ingested using pdfselect(). This helper function selects out the text
#' of each email in the "From" field (the email address of the sender) and generates a vector from this so that the content of each
#' email is represented.
#'
#' @param pdfdata email data as a list already ingested with pdfselec()
#'
#' @return character vector representing "From" field of email data
#' @export
#'
from_var <- function(pdfdata) {
  # pdfdata is read in with pdfselect function within emailPDFdf.R
  #pdfdata <- pdfselect(pdfinput)
  #create "from" variable from pdf data
  from <- vector()
  for (i in 1:length(pdfdata)) {
    pdfdata_tmp <- pdfdata[[i]]
    # all functions used below are from base R except str_trim which is from stringr
    from_tmp <- as.vector(stringr::str_trim(unlist(strsplit(pdfdata_tmp[min(grep("From: ", pdfdata_tmp))
                                                                      : min((grep("To: ", pdfdata_tmp)) - 1)], ": "))))[2]
    from <- c(from, from_tmp)
  }
  return(from)
}
