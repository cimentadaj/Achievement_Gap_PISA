# Read the raw data which is very heavy to have in drake
# This is done only once, at the beginning of the project because
# with this we read the files and save them in fst format, much
# quicker to read and process
read_raw_data <- FALSE

if (read_raw_data) {
  print("PISA packages loaded")
  library(PISA2000lite)
  library(PISA2003lite)
  library(PISA2006lite)
  library(PISA2009lite)

  print("Reading all of PISA data without fst format. This should only be ran once when the project begins.") #nolintr
  big_pisa_dt <- read_pisa(raw_data_dir)
  iwalk(big_pisa_dt, ~ write_fst(.x, here("processed_data", paste0(.y, ".fst"))))
  rm(big_pisa_dt)
}

pisa_files <-
  sort(
    list.files(here("processed_data"), pattern = ".fst", full.names = TRUE)
  )
