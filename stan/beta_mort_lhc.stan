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
