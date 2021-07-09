// written by Emma J. Hudgins, 2019
// theoretical simulation STAN beta model for estimating missing binned bounds
// see preprint https://www.biorxiv.org/content/10.1101/2021.04.24.441210v4
 
data {
    
    real y[100];

  }
parameters {
  real<lower=0> shape; 
  real<lower=0> scale;

 
}
model { 
target += -log(sqrt(shape))-log(sqrt(scale))+beta_lpdf(y| shape,scale);
}
generated quantities {
  real log_lik;
  log_lik = beta_lpdf(y| shape,scale);
}
