test_that("data frame has 5 columns", {
  filepath <- system.file("extdata", "testdata.pdf", package = "testPackage")
  testdf <- emailPDFdf(filepath)
  expect_equal(ncol(testdf), 5)
})


