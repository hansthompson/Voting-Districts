textFiles <- list.files(paste0(getwd(),"/Results"), full.names = T)

a <- read.table(textFiles[1], header = FALSE)
head(a)
a <- a[,c(2,3,6,7,8,9)]
colnames(a) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
a <- data.frame(a, Year = 2002, Type = "General")


b <- read.table(textFiles[2], header = FALSE)
head(b)
b <- b[,c(2,3,6,7,8,9)]
colnames(b) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
b <- data.frame(b, Year = 2002, Type = "Primary")


c <- read.table(textFiles[3], header = FALSE)
head(c)
c <- c[,c(2,3,6,7,8,9)]
colnames(c) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
c <- data.frame(c, Year = 2004, Type = "General")

d <- read.table(textFiles[4], header = FALSE)
head(d)
d <- d[,c(2,3,6,7,8,9)]
colnames(d) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
d <- data.frame(d, Year = 2006, Type = "General")

e <- read.table(textFiles[5], header = FALSE)
head(e)
e <- e[,c(2,3,6,7,8,9)]
colnames(e) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
e <- data.frame(e, Year = 2006, Type = "Primary")

f <- read.table(textFiles[6], header = FALSE)
head(f)
f <- f[,c(2,3,6,7,8,9)]
colnames(f) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
f <- data.frame(f, Year = 2008, Type = "General")


g <- read.table(textFiles[7], header = FALSE)
head(g)
g <- g[,c(2,3,6,7,8,9)]
colnames(g) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
g <- data.frame(g, Year = 2008, Type = "Primary")

h <- read.table(textFiles[8], header = FALSE)
head(h)
h <- h[,c(1,3,8,9,10,11)]
colnames(h) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
h <- data.frame(h, Year = 2010, Type = "General")

i <- read.table(textFiles[9], header = FALSE)
head(i)
i <- i[,c(1,3,6,7,8,9)]
colnames(i) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
i <- data.frame(i, Year = 2010, Type = "Primary")

j <- read.table(textFiles[10], header = FALSE)
head(j)
j <- j[,c(1,3,5,6,7,8)]
colnames(j) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
j <- data.frame(j, Year = 2012, Type = "General")

k <- read.table(textFiles[11], header = FALSE)
head(k)
k <- k[,c(1,3,5,6,7,8)]
colnames(k) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
k <- data.frame(k, Year = 2012, Type = "Primary")

l <- read.table(textFiles[12], header = FALSE)
head(l)
l <- l[,c(1,3,5,6,7,8)]
colnames(l) <- c("Precint", "Election", "Candidate", "Party", "Total", "N")
l <- data.frame(l, Year = 2014, Type = "Primary")

dat <- rbind(a,b,c,d,e,f,g,h,i,j,k,l)

code <- sapply(as.numeric(substring(dat$Precint, 1,1)), is.na)
dat$Precint[!code] <- substring(dat$Precint[!code], 8)
dat$Precint <- gsub("#", "No. ",dat$Precint)



dat2 <- unique(cbind(as.character(dat$Precint), dat$Year, as.character(dat$Type)))
write.csv(dat2, "dat.csv", row.names = F)
