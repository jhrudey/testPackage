test_that("vector is not null", {
  #run test on to_var
  #can use emaillist.Rda for this test
  to_test <- to_var(emaillist)
  expect_true(length(to_test) > 0)
})
