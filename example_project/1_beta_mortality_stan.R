### Theoretical simulations and Empirical STAN beta model for estimating pest severity and cost ## 
## see preprint https://www.biorxiv.org/content/10.1101/2021.04.24.441210v4
## Written by Emma J. Hudgins, 2019, emma.hudgins@mail.mcgill.ca

### 1. Load data and packages, set parameters ####
rm(list=ls()) 
require(here) #version 1.0.1, in case .Rproj isn't loaded
require(rstan) #version 2.21.2
setwd(here())
rstan_options(auto_write = TRUE)

lhc<-read.csv('./data/lhc_beta_data.csv') # latin hypercube simulated severity data based on lhc-sampled parameters
pars<-read.csv('./data/lhc_draws_beta.csv') #latin hypercube sampled beta parameters
inv_dat_reduced<-read.csv("./data/each_spp_pesthost_patho.csv") #Number of pests in each severity category in Potter et al (2019) Forests.
inv_dat_reduced$severity<-as.numeric(inv_dat_reduced$severity)


nsims<-10 # number of theoretical simulations
nsamps<- 10000 #number of samples form posterior



#### 2. Run theoretical analysis ####
## Checks for bias in parameters using percentile-percentile plots (see Leung & Steele 2013)
for(i in 1:nsims)
{
  y<-as.numeric(lhc[i,])
  m_beta<-stan(file="./stan/beta_mort_lhc.stan",data = list(y=y),pars=c("shape", "scale", "log_lik"),iter=nsamps, cores=4) #fit beta mortality model
  pp_par1<-length(which(extract(m_beta)$shape[(nsamps+1):(nsamps*2)]<=pars[i,1]))/nsamps #extract percentiles in which parameters fall for pp-plots for samples beyond burn-in
  pp_par2<-length(which(extract(m_beta)$scale[(nsamps+1):(nsamps*2)]<=pars[i,2]))/nsamps
}
  write.table(cbind(i,pp_par1, pp_par2), file=paste("./output/lhc_sim.partial.csv", sep='.'), row.names=F, sep=",", col.names=F) 


#### 3. Fit empirical model ####

# Asymptotic mortality thresholds from Potter et al. 2019
oneT=0.01
threeT=0.10
fiveT=0.25
eightT=0.95

# calculate number of host genera per pest
lengths<-aggregate(inv_dat_reduced$genus~inv_dat_reduced$pest,FUN=length) 
colnames(lengths)[1]<-"pest"
lengths_each<-merge(inv_dat_reduced,lengths, by="pest")

# Divide each pest's impact by the number of genera it impacts and sum the number in each category to get the count in each severity bin 
 one_spp<-sum((1*inv_dat_reduced$severity==1)/lengths_each$`inv_dat_reduced$genus`)
 three_spp<-sum((1*inv_dat_reduced$severity==3)/lengths_each$`inv_dat_reduced$genus`)
 five_spp<-sum((1*inv_dat_reduced$severity==5)/lengths_each$`inv_dat_reduced$genus`)
 eight_spp<-sum((1*inv_dat_reduced$severity==8)/lengths_each$`inv_dat_reduced$genus`)
 nine_spp<-sum((1*inv_dat_reduced$severity==9)/lengths_each$`inv_dat_reduced$genus`)
 ten_spp<-sum((1*inv_dat_reduced$severity==10)/lengths_each$`inv_dat_reduced$genus`)
 
# add on lower severity data from Aukema et al. 2011. PLoS oNE (2 categories below category 1 from Potter)
 subone_spp<-33+sum((1*inv_dat_reduced$severity==0)/lengths_each$`inv_dat_reduced$g
                    enus`) # 33 'intermediate impact' species from Aukema missing in Potter + some fraction of pest-host interactions with pest present
 subsubone_spp<-418-60 #total number of species examined in Aukema minus total examined here.

 
 #### 4. Run STAN code ####

 m_beta<-stan(file="./stan/beta_mort.stan",data = list(oneT=oneT, threeT=threeT, fiveT=fiveT, eightT=eightT, subsubone_spp=subsubone_spp, subone_spp=subone_spp, one_spp=one_spp, three_spp=three_spp, five_spp=five_spp, eight_spp=eight_spp, nine_spp=nine_spp, ten_spp=ten_spp),pars=c("shape", "scale",  "nineT", "suboneT", "subsuboneT"),iter=10000, control=list(adapt_delta=0.999999),cores=4)

# sample the posterior
 
 beta_samps<-extract(m_beta)
 subsubone<-subone<-one<-three<-five<-eight<-nine<-ten<-rep(0,nsamps) #mortality categories
 for (i in 1:nsamps)
 {
   rand_beta<-rbeta(100000,shape1=beta_samps$shape[i], shape2=beta_samps$scale[i])
   subsubone[i]<-sample(rand_beta[which(rand_beta<beta_samps$subsuboneT[i])],1)
   subone[i]<-sample(rand_beta[which(rand_beta>=beta_samps$subsuboneT[i] & rand_beta<beta_samps$suboneT[i]+beta_samps$subsuboneT[i])],1)
   one[i]<-sample(rand_beta[which(rand_beta>=beta_samps$suboneT[i]+beta_samps$subsuboneT[i] & rand_beta<oneT)],1)
   three[i]<-sample(rand_beta[which(rand_beta>=oneT& rand_beta<threeT)],1)
   five[i]<-sample(rand_beta[which(rand_beta>=threeT& rand_beta<fiveT)],1)
  eight[i]<-sample(rand_beta[which(rand_beta>=fiveT& rand_beta<eightT)],1)
  if (length(which(rand_beta>=eightT& rand_beta<beta_samps$nineT[i])>0))
  {
  nine[i]<-sample(rand_beta[which(rand_beta>=eightT& rand_beta<beta_samps$nineT[i])],1)
  }
  if (length(which(rand_beta>=beta_samps$nineT[i])))
  {
  ten[i]<-sample(rand_beta[which(rand_beta>=beta_samps$nineT[i])],1)
  }
 }

# output sample mortality rates in each category
write.csv(cbind((subsubone),(subone),(one),(three),(five), (eight), (nine), (ten)), file="./output/potter_mort_all3.csv", row.names=F)

