// written by Emma J. Hudgins, 2019
// STAN beta model for estimating pest severity and cost
// see preprint https://www.biorxiv.org/content/10.1101/2021.04.24.441210v4
 
data {

    real oneT; 
    real threeT; 
    real fiveT; 
    real eightT; 

    real subsubone_spp;
    real subone_spp; 
    real one_spp;
    real three_spp;
    real five_spp;
    real eight_spp;
    real nine_spp;
    real ten_spp;

  }
parameters {
  real<lower=0> shape; 
  real<lower=0> scale;
  real<lower=0.95, upper=1> nineT;
  real<lower=0,upper=0.01> subsuboneT; 
  real<lower=0,upper=(0.01-subsuboneT)> suboneT; 
 
}
model { 
target += -log(shape)-log(scale);
if (subsubone_spp>0)
{
target+=(subsubone_spp)*beta_lcdf(subsuboneT|shape, scale);
}
if (subone_spp>0){
target+=(subone_spp)*log(exp(beta_lccdf(subsuboneT | shape, scale))-exp(beta_lccdf((subsuboneT+suboneT) | shape, scale)));
}
if (one_spp>0)
{
  target+=(one_spp)*log(exp(beta_lccdf((subsuboneT+suboneT) | shape, scale))-exp(beta_lccdf(oneT | shape, scale)));
}
if (three_spp>0){
target+=three_spp*log(exp(beta_lccdf(oneT | shape, scale))-exp(beta_lccdf(threeT | shape, scale)));
}
if (five_spp>0)
{
  target+=five_spp*log(exp(beta_lccdf(threeT | shape, scale))-exp(beta_lccdf(fiveT | shape, scale)));
}
if (eight_spp>0)
{
  target+=eight_spp*log(exp(beta_lccdf(fiveT | shape, scale))-exp(beta_lccdf(eightT | shape, scale)));
}
if (nine_spp>0)
{target+=nine_spp*log(exp(beta_lccdf(eightT | shape, scale))-exp(beta_lccdf(nineT | shape, scale)));
}
if (ten_spp>0)
{
  target+=ten_spp*beta_lccdf(nineT | shape, scale);
}
}
//generated quantities {
 // real log_lik;
 // log_lik = (subsubone_spp)*beta_lcdf(subsuboneT|shape, scale)+(subone_spp)*log(exp(beta_lccdf(subsuboneT | shape, scale))-exp(beta_lccdf((subsuboneT+suboneT) | shape, scale)))+(one_spp)*log(exp(beta_lccdf((subsuboneT+suboneT) | shape, scale))-exp(beta_lccdf(oneT | shape, scale)))+three_spp*log(exp(beta_lccdf(oneT | shape, scale))-exp(beta_lccdf(threeT | shape, scale)))+five_spp*log(exp(beta_lccdf(threeT | shape, scale))-exp(beta_lccdf(fiveT | shape, scale)))+eight_spp*log(exp(beta_lccdf(fiveT | shape, scale))-exp(beta_lccdf(eightT | shape, scale)))+nine_spp*log(exp(beta_lccdf(eightT | shape, scale))-exp(beta_lccdf(nineT | shape, scale)))+ten_spp*beta_lccdf(nineT | shape, scale);
//}
