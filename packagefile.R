#Using the given Multiserver.R file for the question
usethis::use_r("Multiserver")


#Running necessary functions to create package
devtools::load_all()
devtools::check()
devtools::document()

#reading the dataset and assigning it a name
bank <- read.csv("bank.csv")

#adding the dataset to the package
usethis::use_data(bank)

#adding tibble to the package
usethis::use_package("tibble")

#added a readme file
usethis::use_readme_rmd()

#test 1 - expects the 3rd entry in the first column (Arrival times, ie the 3rd customer) arrives at about 326 seconds
testthat::expect_identical(as.numeric(round(Multiserver(Arrivals = bank$arrival_time, ServiceTimes = bank$service_time, NumServers = 3)[3,1],0)), 326)

#test 2 - expects the table output to have 4 slots per row, each representing Arrivals, ServiceBegins, ChosenServer and ServiceEnds respectively
testthat::expect_vector(as.double(Multiserver(Arrivals = bank$arrival_time, ServiceTimes = bank$service_time, NumServers = 3)[3,]), 4)



