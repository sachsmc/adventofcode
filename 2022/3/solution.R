x <- readLines("input")
prior <- 1:52
names(prior) <- c(letters, LETTERS)

sapply(strsplit(x, ""), function(xx){
       
       nit  <- length(xx)/2
       x1 <- xx[1:nit]
       x2 <- xx[(nit+1):(nit*2)]
       
       prior[intersect(x1, x2)]
       
}) |> sum()



## part 2


y <- strsplit(x, "")
idex <- split(1:length(y), rep(c(1:(length(y)/3)), each = 3))

sapply(idex, \(i){
  
  prior[intersect(intersect(y[i][[1]], y[i][[2]]), y[i][[3]])]
  
}) |> sum()
