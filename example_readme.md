# Example README for this repo

# An excerpt of the full README for github.com/emmajhudgins/UStreedamage
---

_Authors: Emma J. Hudgins, Frank H. Koch, Mark J. Ambrose, and Brian Leung_

---

Written in R version 4.0.2 and rSTAN version 2.19.3

Read .RDS files into R using *readRDS()*.  

Reproduce results by loading R project (example_github_osf.Rproj*) and running scripts in numerical order.  


## R Script

1. '010_beta_mortality_stan.R' - R script calling STAN model (./stan/beta_mort.stan) and saving output using latin hypercube sampling to show theoretical validity, and then fitting to pest severity data  

## STAN models

1. beta_mort_lhc.stan - Theoretical model for pest mortality severity (model saves as .rds file)
2. beta_mort.stan - empirical model for pest mortality (model saves as .rds file)

## Derived data  

1. each_spp_pesthost_patho.csv - Potter et al. 2019 pest severity data on each of their top 5 hosts
2. lhc_beta_data.csv - Latin Hypercube model draws for pest mortality severity (as a proportion of trees killed over a long time horizon)
3. lhc_draws_beta.csv - Latin Hypercube model draws for the parameters of the beta distribution that produced the mortality data in 2.

## Outputs
1. potter_mort_all3.csv - estimated mortality severity (entire posterior)
2. lhc_sim.partial.csv - percentile results for P-P plots of theoretical simulation. Col 1 is the iteration indec, Col 2 is the a parameter percentile, Col 3 is the b parameter percentile 


For any questions or suspected bugs, feel free to open an issue or email me at emma.hudgins@mail.mcgill.ca





