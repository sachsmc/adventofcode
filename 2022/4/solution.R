x <- readLines("input")

data <- do.call(rbind.data.frame, lapply(strsplit(x, ","), 
                      \(xx) {
                        as.numeric(do.call(c, strsplit(xx,  "-")))
                      }  
                      ))

colnames(data) <- c("amin", "amax", "bmin", "bmax")

data$olap <- with(data, 
     pmin(amin, bmin) == amin & pmax(amax, bmax) == amax | 
       pmin(amin, bmin) == bmin & pmax(amax, bmax) == bmax )

sum(data$olap)


##

data$olapall <- with(data, 
                     amin <= bmin & amax >= bmin |
                       bmin <= amin & bmax >= amin |
                       olap
                     )

sum(data$olapall)
