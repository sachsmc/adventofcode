x <- read.table("input", sep = " ", header = FALSE)

winmat <- matrix(0, nrow = 3, ncol = 3,
                 dimnames = list(LETTERS[1:3], 
                                 LETTERS[24:26]))
diag(winmat) <- 3
winmat[cbind(c(1, 2, 3), c(2, 3, 1))] <- 6
playv <- c("X" = 1, "Y" = 2, "Z" = 3)

x$score <- winmat[cbind(x$V1, x$V2)] + playv[x$V2]

sum(x$score)

playmat <- cbind(X = c("A" = "C", "B" = "A", "C" = "B"), 
                 Y = c("A" = "A", "B" = "B", "C" = "C"), 
                 Z = c("A" = "B", "B" = "C", "C" = "A"))


x$play <- playmat[cbind(x$V1, x$V2)]

colnames(winmat) <- names(playv) <- c("A", "B", "C")

x$score2 <- winmat[cbind(x$V1, x$play)] + playv[x$play]

sum(x$score2)