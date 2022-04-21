## ---------------------------------------------------------------------------------

## Figure for Supplementary Figure 5
## Author: Reanna Dona
## Created  7 April 2022 
## Last updated 21 April 2022

## Notes: Used for Supplementary Figure S5 for depicting all three of those concepts--
# genes detected v undetected, genes in at least 2 replicates and gene in all three replicates

# Make stacked barplot 

## ---------------------------------------------------------------------------------

## set working directory
# correct folder with most updated markersa
setwd("~/Dropbox (EinsteinMed)/GreallyLab/Toxoplasma/Manuscript/Supplementary/Supplementary figures/")



## ---------------------------------------------------------------------------------

library(ggplot2)

# 8870 genes total in toxo genome
# 6653 genes are within two
# 6191 genes are expressed in all three
Undetected <- 8870-6653
Within2 <- 6655-6191 
Within3 <- 6191

Replicate <- c(rep("I1", 3), rep("I2",3),rep("I3",3))
Genes <- rep(c("Undetected","Detected within two", "Detected in all three"),3)
Number <- rep(c(Undetected,Within2,Within3),3)
data <- data.frame(Replicate,Genes,Number)
data$Genes <- factor(data$Genes, levels=c("Undetected","Detected within two", "Detected in all three"))

p1 <- ggplot(data, aes(fill=Genes, y=Number, x=Replicate)) + 
  geom_bar(position="stack", stat="identity")+ theme_classic()

pdf("S5_stackedbarplot.pdf", width=8, height=6)
p1 
dev.off()
