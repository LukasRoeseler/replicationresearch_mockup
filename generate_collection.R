
# Create table for replication collection ---------------------------------



### open dataset
devtools::install_github("forrtproject/FReD")
library(FReD)
ds <- load_fred_data()

### create data
ds <- ds[, c("discipline", "description", "ref_original", "ref_replication")]
refs <- ds[-which(duplicated(ds$ref_replication)), ]
names(refs) <- c("Discipline", "Description of Finding", "Original Report", "Replication Report")

### print table
write.csv(refs, file = "replication_collection.csv", fileEncoding = "UTF-8")
