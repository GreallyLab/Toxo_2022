
library(MotifDb)
library(JASPAR2020)
library(TFBSTools)
library(motifmatchr)
library(BSgenome.Hsapiens.UCSC.hg38)
library(chromVAR)
library(ComplexHeatmap)
library(viridis)
library(seqLogo)
library(ggseqlogo)
library(ggplot2)
library(ggvenn)
library(clusterProfiler)

setwd("/Users/reannadona/Dropbox (EinsteinMed)/GreallyLab/Toxoplasma/Manuscript/Supplementary/Supplementary tables/")
devOut <- read.csv("pheatmapTF_150.csv")
topVariable <- devOut[devOut$p_value_adj < 0.05,]

# set up matrix
topVariablePlot <- as.matrix(topVariable[,c("U1", "U2", "U3", "I2", "I3")])
rownames(topVariablePlot) <- topVariable$name

colors <- viridis(5)[c(1,5)]
col <- list(Condition = c(
  "Infected" = colors[2],
  "Uninfected" = colors[1]))
ha <- HeatmapAnnotation(Condition = factor(c(rep("Uninfected", 3), rep("Infected", 2)), levels = c("Uninfected", "Infected")), col = col)

Heatmap(topVariablePlot, 
        name = "Z-score", 
        row_names_gp = gpar(fontsize = 7),
        top_annotation = ha,
        border = TRUE,
        cluster_rows = TRUE,
        cluster_columns = FALSE,
        show_row_names = FALSE,
        column_names_rot = 0,
        show_parent_dend_line = FALSE,
        row_dend_width = unit(20, "mm"))


topVariable <- cbind(topVariable, 
                     data.frame(Uninfected = rowMeans(topVariable[,c("U1", "U2", "U3")]), 
                                Infected = rowMeans(topVariable[,c("I2", "I3")])))
topVariableUp <- topVariable[topVariable$Infected > topVariable$Uninfected,]
topVariableDown <- topVariable[topVariable$Infected < topVariable$Uninfected,]
top20 <- rbind(topVariableUp[1:20,], topVariableDown[1:20,])
top150 <- topVariableUp[1:150,]

# set up matrix
topVariablePlot <- as.matrix(top150[,c("U1", "U2", "U3", "I2", "I3")])
rownames(topVariablePlot) <- top150$name

pdf("heatmap_top150.pdf", width = 7,height = 14)
Heatmap(topVariablePlot, 
        name = "Z-score", #title of legend
        row_names_gp = gpar(fontsize = 7), # Text size for row names
        top_annotation = ha,
        border = TRUE,
        cluster_rows = TRUE,
        cluster_columns = FALSE,
        show_row_names = TRUE,
        column_names_rot = 0,
        show_parent_dend_line = FALSE,
        row_dend_width = unit(20, "mm"))
dev.off()
