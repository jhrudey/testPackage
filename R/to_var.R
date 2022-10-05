
#' Generate vector from text in "To" field of ingested emails
#'
#' Emails saved as one pdf file are ingested using pdfselect(). This helper function selects out the text
#' of each email in the "To" field (the email address of the recipient) and generates a vector from this so that the content of each
#' email is represented.
#'
#' @param pdfdata email data as a list already ingested with pdfselec()
#'
#' @return character vector representing "Subject" field of email data
#' @export

to_var <- function(pdfdata) {
  # pdfdata is read in with pdfselect function within emailPDFdf.R
  #pdfdata <- pdfselect(pdfinput)
  #create "to" variable from pdf data
  to <- vector()
  for (i in 1:length(pdfdata)) {
    pdfdata_tmp <- pdfdata[[i]]
    # end point of selection of text is less simple for "To: " variable because there is no
    # consistent end point. Will use the end point of "nl>" or "com>" to represent end of the
    # selection to indicate email address en end of "To: " content
    # all functions used below are from base R except str_trim which is from stringr
    to_tmp <- as.vector(stringr::str_trim(unlist(strsplit(pdfdata_tmp[min(grep("To: ", pdfdata_tmp))
                                                                    : max((grep("nl>|com>", pdfdata_tmp)))], ": "))))[2]
    to <- c(to, to_tmp)
  }
  return(to)
}

