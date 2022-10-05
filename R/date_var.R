
#' Generate vector from text in "Date" field of ingested emails
#'
#' Emails saved as one pdf file are ingested using pdfselect(). This helper function selects out the text
#' of each email in the "Date" field (date the email was received) and generates a vector from this so that the content of each
#' email is represented.
#'
#' @param pdfdata email data as a list already ingested with pdfselec()
#'
#' @return character vector representing "Date" field of email data
#' @export
#'
date_var <- function(pdfdata) {
  # pdfdata is read in with pdfselect function within emailPDFdf.R
  #pdfdata <- pdfselect(pdfinput)
  #create date variable from pdf data
  date <- vector()
  for (i in 1:length(pdfdata)) {
    pdfdata_tmp <- pdfdata[[i]]
    # string split needs to happen at ": " i.e. colon followed by a space
    # to ensure that split happens at "Date: " and not the ":" found in the timestamp
    # all functions used below are from base R except str_trim which is from stringr
    date_tmp <- as.vector(stringr::str_trim(unlist(strsplit(pdfdata_tmp[min(grep("Date: ", pdfdata_tmp))
                                                                      : min((grep("From: ", pdfdata_tmp)) - 1)], ": "))))[2]
    # use following to select only date text and none of time stamp text
    # based on this advice https://statisticsglobe.com/extract-substring-before-or-after-pattern-in-r
    date_tmp <- sub(" at.*", "", date_tmp)
    # change format of date
    date <- c(date, date_tmp)
  }
  return(date)
}
