# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

lim <- 1000;
n1 <- 3;
n2 <- 5;

limit <- lim - 1;

l1 <- limit %/% n1;
l2 <- limit %/% n2;

s1 <- c(1:l1);
s2 <- c(1:l2);

m1 <- n1 * s1;
m2 <- n2 * s2;

m <- data.frame(c(m1, m2));
m.unique <- m[!duplicated(m), ];
answer <- sum(m.unique);