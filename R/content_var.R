
#' Generate vector from text in "Content" field of ingested emails
#'
#' Emails saved as one pdf file are ingested using pdfselect(). This helper function selects out the text
#' of each email in the "Content" field (the main text of the email) and generates a vector from this so that the content of each
#' email is represented.
#'
#' @param pdfdata email data as a list already ingested with pdfselec()
#'
#' @return character vector representing "Content" field of email data
#' @export
#'
content_var <- function(pdfdata) {
  # pdfdata is read in with pdfselect function within emailPDFdf.R
  #pdfdata <- pdfselect(pdfinput)
  #create "content" variable from pdf data
  content <- vector()
  for (i in 1:length(pdfdata)) {
    pdfdata_tmp <- pdfdata[[i]]
    content_tmp <- as.vector(pdfdata_tmp[min(grep("To: ", pdfdata_tmp)) + 2
                                         : max(grep("   Page ", pdfdata_tmp))])
    content_tmp <- content_tmp[!is.na(content_tmp)]
    content_tmp <- paste(content_tmp, collapse = " ")
    # make all text lower case to make text analysis later more simple
    content_tmp <- tolower(content_tmp)
    content <- c(content, content_tmp)
  }
  return(content)
}

