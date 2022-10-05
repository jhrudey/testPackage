
#' Ingest pdf file of emails to create data frame with required variables
#'
#' Emails that are saved as a single pdf file are ingested and ultimately converted to
#' a data frame of variables "subject", "date", "to", "from", "content" with each row
#' representing each email received
#'
#' @param pdfinput a pdf file of received emails
#'
#' @return a data frame containing subject, date, from, to and content of emails
#' @export

emailPDFdf <- function(pdfinput) {
  # read in pdfinput with pdfselect function
  pdfdata <- pdfselect(pdfinput)
  # use helper functions subject_var, date_var, from_var, to_var and content_var
  # to create necessary variables from ingested pdf data
  subject <- subject_var(pdfdata)

  date <- date_var(pdfdata)

  from <- from_var(pdfdata)

  to <- to_var(pdfdata)

  content <- content_var(pdfdata)

  df <- as.data.frame(cbind(subject, date, from, to, content))
  return(df)
}




