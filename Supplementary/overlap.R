## ---------------------------------------------------------------------------------

## Figure for Toxo 2F
## Author: Reanna Dona
## Created  7 April 2022 
## Last updated 21 April 2022

## Notes: Used for Figure for Toxo 2F and supplement

# Make proportional Venn Diagram

## ---------------------------------------------------------------------------------

## set working directory
# correct folder with most updated markersa
setwd("~/Dropbox (EinsteinMed)/GreallyLab/Toxoplasma/Manuscript/Figures/Fig 2/Fig 2 pdf/")

## ---------------------------------------------------------------------------------

# Toxo 2F proportional venn diagram


## load required libraries
library(venneuler)
library(eulerr)

# Input in the form of a named numeric vector
fit1 <- euler(c("A" = 1172, "B" = 592, "C" = 601,
                "A&B" = 1152, "A&C" =1014, "B&C" = 531,
                "A&B&C" = 928),
              shape = "ellipse")
fit1$stress
fit1$diagError

pdf("Fig 2F prop.pdf", width=10, height=10)
plot(fit1, quantities = TRUE)
dev.off()


# tried venneuler but looked inaccurate
## ---------------------------------------------------------------------------------

# Supplement
setwd("~/Dropbox (EinsteinMed)/GreallyLab/Toxoplasma/Manuscript/Supplementary/Supplementary figures/")

# Input in the form of a named numeric vector
fit2 <- euler(c("I1" = 192, "I2" = 198, "I3" = 117,
                "I1&I2" = 281, "I1&I3" =82, "I2&I3" = 99,
                "I1&I2&I3" = 6191),
              shape = "ellipse")
pdf("S5_Prop.pdf", width=10, height=10)
plot(fit2, quantities = TRUE)
dev.off()







