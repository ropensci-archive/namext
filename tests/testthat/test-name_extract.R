test_that("name_extract", {
  x <- system.file("examples/BoegerEtal2015.pdf", package="namext")
  res <- name_extract(x)

  expect_is(res, "list")
})
