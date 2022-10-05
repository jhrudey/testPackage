
#' Generate vector from text in "Subject" field of ingested emails
#'
#' Emails saved as one pdf file are ingested using pdfselect(). This helper function selects out the text
#' of each email in the "Subject" field (the subject line of the email) and generates a vector from this so that the content of each
#' email is represented.
#'
#' @param pdfdata email data as a list already ingested with pdfselec()
#'
#' @return character vector representing "Subject" field of email data
#' @export
#'
subject_var <- function(pdfdata) {
  # pdfdata is read in with pdfselect function within emailPDFdf.R
  #pdfdata <- pdfselect(pdfinput)
  #create subject variable from pdf data
  subject <- vector()
  for (i in 1:length(pdfdata)) {
    pdfdata_tmp <- pdfdata[[i]]
    # split string at "t:" for this variable to ensure that the split happens at "Subject:" and not
    # at first sign of ":" such as with "re" or "fwd"
    # all functions used below are from base R except str_trim which is from stringr
    subject_tmp <- as.vector(stringr::str_trim(unlist(strsplit(pdfdata_tmp[min(grep("Subject: ", pdfdata_tmp))
                                                                           : min((grep("Date: ", pdfdata_tmp)) - 1)], "t: "))))[2]

    subject <- c(subject, subject_tmp)
  }
  return(subject)
}
