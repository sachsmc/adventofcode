x <- as.numeric(readLines("input"))

sums <- NULL

thissum <- 0
j <- 1
for(i in 1:length(x)){
  if(is.na(x[i])) {
    sums[j] <- thissum
    thissum <- 0
  } else {
    thissum <- thissum + x[i]
    j <- j+1
  }
  
}

sort(sums, decreasing = TRUE)[1]
sort(sums, decreasing = TRUE)[1:3] |> sum()
