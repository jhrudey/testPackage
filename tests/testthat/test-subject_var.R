test_that("vector is not null", {
  #run test on subject_var
  #can use emaillist.Rda for this test
  subject_test <- subject_var(emaillist)
  expect_true(length(subject_test) > 0)
})
