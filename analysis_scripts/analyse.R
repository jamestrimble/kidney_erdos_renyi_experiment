library(dplyr)
d <- read.delim("all_results.txt", sep=" ", header=FALSE, col.names=c("p", "nA", "nvars", "objval"))
d_summary <- d %>%
  group_by(p, nA) %>%
  summarize(mean_nvars=mean(nvars), mean_objval=mean(objval))