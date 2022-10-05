test_that("vector is not null", {
  #run test on from_var
  #can use emaillist.Rda for this test
  from_test <- from_var(emaillist)
  expect_true(length(from_test) > 0)
})
