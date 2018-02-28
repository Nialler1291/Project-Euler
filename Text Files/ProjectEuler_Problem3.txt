# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# fundamental law of arithmetic --> every real number > 1 has a unique prime factorization

# initialise
real.number <- 600851475143;
prime <- 2;
prime.factors <- c();

# create function that if given a number will find the next highest prime numbers
nextprime <- function (x){
  check.if.prime <- x + 1;
  check.min <- 2;
  check.max <- max(check.min, x/2);
  check.remainders <- check.if.prime %% c(check.min:check.max);
  freq.zeros <- sum(check.remainders == 0);
  if(freq.zeros == 0){
    return(check.if.prime);
  } else {nextprime(check.if.prime);}
}

while(prod(prime.factors) < real.number){
  check.prime.factor <- real.number %% prime;
  if(check.prime.factor == 0){
    prime.factors <- c(prime.factors, prime);
  }
  prime <- nextprime(prime);
}
answer <- max(prime.factors);