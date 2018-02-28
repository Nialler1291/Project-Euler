# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

digit.numbers <- 3;

#initialise
counter <- 1;
sequence <- c();

# create sequence up to x digits 
while(nchar(counter) <= digit.numbers){
  sequence <- c(sequence, counter);
  counter <- counter + 1;
}

palindrome <- function(x){
  num.chars <- nchar(x);
  str.start <- 1;
  str.end <- num.chars;
  while (str.start <= str.end){
    palin <- substr(x, str.end, str.end) == substr(x, str.start, str.start);
    str.start <- str.start + 1;
    str.end <- str.end - 1;
    if(palin == FALSE){
      break
    }
  }
  return(palin);
}

num.matrix <- sequence %o% sequence; # multiply numbers
num.df <- data.frame(c(num.matrix)); # convert to data frame
num.df.unique <- data.frame(num.df[!duplicated(num.df), ]); # remove duplicate values

check.palin <- apply(num.df.unique, 1, palindrome);
palin.matrix <- cbind(num.df.unique, check.palin);
names(palin.matrix) <- c("Digits","IsPalindrome");

# max value for palindrome and non-palindrome
result <- aggregate(palin.matrix$Digits, by = list(palin.matrix$IsPalindrome), max);
print(result);