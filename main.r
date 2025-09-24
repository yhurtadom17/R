1. Introduction to Probability

R doesn’t have “basic probability” functions directly, but you can:

Combinatorics

# n choose k
choose(n, k)


Conditional probability (manual)

P_A <- 0.4
P_B <- 0.5
P_A_and_B <- 0.2
P_A_given_B <- P_A_and_B / P_B


Complement rule

P_Ac <- 1 - P_A

2. Discrete Probability Distributions
Binomial

Probability mass function (PMF):

dbinom(k, size=n, prob=p)


Cumulative probability (CDF):

pbinom(k, size=n, prob=p)   # P(X ≤ k)
1 - pbinom(k, size=n, prob=p)   # P(X > k)


Random sample (simulation):

rbinom(10, size=n, prob=p)


Example: 
𝑃(𝑋=2)
P(X=2) when n=5, p=0.4

dbinom(2, size=5, prob=0.4)

Poisson

PMF:

dpois(k, lambda=λ)


CDF:

ppois(k, lambda=λ)   # P(X ≤ k)
1 - ppois(k, lambda=λ)   # P(X > k)


Random sample:

rpois(10, lambda=λ)


Example: 
𝑃(𝑋=3)
P(X=3) when λ=4

dpois(3, lambda=4)

3. Uniform Distribution (Continuous)
Uniform Distribution Functions

PDF (density):

dunif(x, min=a, max=b)


CDF:

punif(x, min=a, max=b)   # P(X ≤ x)
1 - punif(x, min=a, max=b)   # P(X > x)


Probability between values:

punif(d, min=a, max=b) - punif(c, min=a, max=b)   # P(c ≤ X ≤ d)


Random sample:

runif(10, min=a, max=b)


Example: Uniform(6,10)

# Mean and variance (manual)
mean <- (6+10)/2
variance <- (10-6)^2 / 12
sd <- sqrt(variance)

# P(X > 7)
1 - punif(7, min=6, max=10)

# P(7 ≤ X ≤ 9)
punif(9, min=6, max=10) - punif(7, min=6, max=10)
