test_that("vector is not null", {
  #run test on content_var
  #can use emaillist.Rda for this test
  content_test <- content_var(emaillist)
  expect_true(length(content_test) > 0)
})
