input <- readLines("input")

sumnums <- function(inp) {
strsplit(inp, "[a-z]+") |> 
  sapply(\(x) {
    numstr <- paste0(x, collapse = "")
    paste0(substr(numstr, 1, 1), substr(numstr, nchar(numstr), nchar(numstr))) |> 
      as.numeric()
    }) |> 
  sum()
}

sumnums(input)

## part two

torep <- c("one", "two", "three", "four", 
           "five", "six", "seven", "eight", 
           "nine")

lookup <- c(1:9, 1:9)
names(lookup) <- c(torep, as.character(1:9))

first <- rep(1e8, length(input))
last <- rep(-1, length(input))
first.length <- last.length <- rep(NA, length(input))

for(j in seq_along(lookup)) {
  
  mat <- gregexpr(names(lookup[j]), input)
  thismin <- sapply(mat, \(m){
    m[m == -1] <- 1e8
    c(min(m), attr(m, "match.length")[which.min(m)]) 
  })
  first.length <- ifelse(thismin[1, ] < first, thismin[2, ], first.length)
  first <- pmin(first, thismin[1,], na.rm = TRUE)
  
  thismax <- sapply(mat, \(m){
    c(max(m), attr(m, "match.length")[which.max(m)]) 
  })
  last.length <- ifelse(thismax[1, ] > last, thismax[2, ], last.length)
  last <- pmax(last, thismax[1,], na.rm = TRUE)
  
}


as.numeric(paste0(lookup[substr(input, first, first + first.length - 1)], 
       lookup[substr(input, last, last + last.length - 1)])) |> sum()
