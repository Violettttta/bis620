library(palmerpenguins)

data(penguins)
names(penguins)
fit <- lm(bill_length_mm ~ bill_depth_mm, data = penguins)
class(fit)
class(unclass(fit)) # list
fit
print(fit)
?lm
stats::print.lm

print.character <- function(x, ...){
  cat("you are here. \n")
}

rm(print.character) # get rid of my version and restore to defualt function

print(fit)
