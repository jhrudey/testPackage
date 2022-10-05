test_that("vector is date", {
  #run test on date_var
  #can use emaillist.Rda for this test
  date_test <- date_var(emaillist)
  expect_vector(date_test, ptype = character())
})

test_that("vector is not null", {
  #run test on date_var
  #can use emaillist.Rda for this test
  date_test <- date_var(emaillist)
  expect_true(length(date_test) > 0)
})
