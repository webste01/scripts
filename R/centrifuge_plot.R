library("gplots")
path <- "/sc/orga/scratch/webste01/centrifuge_tsv"
file.names<-dir(path, full.names = TRUE)

t1<-read.csv("/sc/orga/scratch/webste01/centrifuge_tsv/CD01240_S11_L008.tsv",header=TRUE,sep="\t")
t2<-read.csv("/sc/orga/scratch/webste01/centrifuge_tsv/CD01244_S6_L008.tsv",header=TRUE,sep="\t")
t3<-read.csv("/sc/orga/scratch/webste01/centrifuge_tsv/CD01287_S10_L008_R2_001.tsv",header=TRUE,sep="\t")
t4<-read.csv("/sc/orga/scratch/webste01/centrifuge_tsv/CD01382_S3_L008.tsv",header=TRUE,sep="\t")
t5<-read.csv("/sc/orga/scratch/webste01/centrifuge_tsv/CD01389_S5_L008_R2.tsv",header=TRUE,sep="\t")
t6<-read.csv("/sc/orga/scratch/webste01/centrifuge_tsv/CD01404_S9_L008_R2.tsv",header=TRUE,sep="\t")
t7<-read.csv("CD01331_S1_L008.tsv",header-TRUE,sep="\t")

t1_nonzero<-t1[t1$abundance>0.000001,]
t2_nonzero<-t2[t2$abundance>0.000001,]
t3_nonzero<-t3[t3$abundance>0.000001,]
t4_nonzero<-t4[t4$abundance>0.000001,]
t5_nonzero<-t5[t5$abundance>0.000001,]
t6_nonzero<-t6[t6$abundance>0.000001,]
t7_nonzero<-t7[t7$abundance>0.000001,]

t1_cd<-t1_nonzero[grep("difficile",t1_nonzero$name),]
t2_cd<-t2_nonzero[grep("difficile",t2_nonzero$name),]
t3_cd<-t3_nonzero[grep("difficile",t3_nonzero$name),]
t4_cd<-t4_nonzero[grep("difficile",t4_nonzero$name),]
t5_cd<-t5_nonzero[grep("difficile",t5_nonzero$name),]
t6_cd<-t6_nonzero[grep("difficile",t6_nonzero$name),]
t7_cd<-t7_nonzero[grep("difficile",t7_nonzero$name),]

#sort in order of abundance
t1_nonzero<-t1_nonzero[order(-t1_nonzero$abundance),]
t2_nonzero<-t2_nonzero[order(-t2_nonzero$abundance),]
t3_nonzero<-t3_nonzero[order(-t3_nonzero$abundance),]
t4_nonzero<-t4_nonzero[order(-t4_nonzero$abundance),]
t5_nonzero<-t5_nonzero[order(-t5_nonzero$abundance),]
t6_nonzero<-t6_nonzero[order(-t6_nonzero$abundance),]
t7_nonzero<-t7_nonzero[order(-t7_nonzero$abundance),]


list.of.data.frames = list(t1_cd,t2_cd,t3_cd,t4_cd,t5_cd,t6_cd,t7_cd)

tmp<-merge(t1_cd,t2_cd,by.x="name",by.y="name",all=TRUE,suffixes=c("_CD01240","_CD01244"))
tmp2<-merge(tmp,t3_cd,by.x="name",by.y="name",all=TRUE)
tmp3<-merge(tmp2,t4_cd,by.x="name",by.y="name",all=TRUE)
tmp4<-merge(tmp3,t5_cd,by.x="name",by.y="name",all=TRUE)
tmp5<-merge(tmp4,t6_cd,by.x="name",by.y="name",all=TRUE)
tmp6<-merge(tmp5,t7_cd,by.x="name",by.y="name",all=TRUE)

abun<-tmp6[,c(7,13,19,25,31,37,43)]
rownames(abun)<-tmp6[,1]
colnames(abun)<-c("CD01240","CD01244","CD01287","CD01382","CD01389","CD01404","CD01331")
df<-as.matrix(abun)

my_palette <- colorRampPalette(c("lightgrey","cornflowerblue"))

png("abundance_CDI_meta.png",width=1200,height=1000)
par(cex.main=0.8)
hm<-heatmap.2(df,trace="none",col=my_palette,margins=c(12,16),Rowv=TRUE,Colv=TRUE,dendrogram='column',cexRow=1.2,main="Abundance of C. difficile in Metagenomic Samples")
dev.off()

png("abundance_CDI_meta_row_scaled.png",width=1200,height=1000)
par(cex.main=0.7)
hm<-heatmap.2(df,trace="none",col=my_palette,margins=c(12,16),scale="row",Rowv=TRUE,Colv=TRUE,dendrogram='column',cexRow=1.2,main="Abundance of C. difficile in Metagenomic Samples, row scaled")
dev.off()

png("abundance_CDI_meta_col_scaled.png",width=1200,height=1000)
par(cex.main=0.7)
hm<-heatmap.2(df,trace="none",col=my_palette,margins=c(12,16),scale="col",Rowv=TRUE,Colv=TRUE,dendrogram='column',cexRow=1.2,main="Abundance of C. difficile in Metagenomic Samples, col scaled")
dev.off()


#look at the 20 most abundant bacteria
png("CD01240_20_most_abundant_bact.png",width=1200,height=1000)
op <- par(mar = c(18,5,2,2))
par(cex.main=1)
plot(factor(t1_nonzero[1:20,"name"]),t1_nonzero$abundance[1:20],las=2,main="CD01240 Meta Sample 20 Most Abundant Strains",ylab="prop. of genome norm. by genomic length")
dev.off()


png("CD01244_20_most_abundant_bact.png",width=1200,height=1000)
op <- par(mar = c(18,5,2,2))
par(cex.main=1)
plot(factor(t2_nonzero[1:20,"name"]),t2_nonzero$abundance[1:20],las=2,main="CD01244 Meta Sample 20 Most Abundant Strains",ylab="prop. of genome norm. by genomic length")
dev.off()

png("CD01287_20_most_abundant_bact.png",width=1200,height=1000)
op <- par(mar = c(18,5,2,2))
par(cex.main=1)
plot(factor(t3_nonzero[1:20,"name"]),t3_nonzero$abundance[1:20],las=2,main="CD01287 Meta Sample 20 Most Abundant Strains",ylab="prop. of genome norm. by genomic length")
dev.off()

png("CD01382_20_most_abundant_bact.png",width=1200,height=1000)
op <- par(mar = c(18,5,2,2))
par(cex.main=1)
plot(factor(t4_nonzero[1:20,"name"]),t4_nonzero$abundance[1:20],las=2,main="CD01382 Meta Sample 20 Most Abundant Strains",ylab="prop. of genome norm. by genomic length")
dev.off()

png("CD01389_20_most_abundant_bact.png",width=1200,height=1000)
op <- par(mar = c(18,5,2,2))
par(cex.main=1)
plot(factor(t5_nonzero[1:20,"name"]),t5_nonzero$abundance[1:20],las=2,main="CD01389 Meta Sample 20 Most Abundant Strains",ylab="prop. of genome norm. by genomic length")
dev.off()

png("CD01404_20_most_abundant_bact.png",width=1200,height=1000)
op <- par(mar = c(18,5,2,2))
par(cex.main=1)
plot(factor(t6_nonzero[1:20,"name"]),t6_nonzero$abundance[1:20],las=2,main="CD01404 Meta Sample 20 Most Abundant Strains",ylab="prop. of genome norm. by genomic length")
dev.off()

png("CD01331_20_most_abundant_bact.png",width=1200,height=1000)
op <- par(mar = c(18,5,2,2))
par(cex.main=1)
plot(factor(t7_nonzero[1:20,"name"]),t7_nonzero$abundance[1:20],las=2,main="CD01331ddplot(factor(t1_nonzero[1:20,"name"]),t1_nonzero$abundance[1:20],las=2,main="CD01240"
dev.off()

#check proportion of human
t1_hs<-t1[grep("Homo sapiens",t1$name),c(7)]
t2_hs<-t2[grep("Homo sapiens",t2$name),c(7)]
t3_hs<-t3[grep("Homo sapiens",t3$name),c(7)]
t4_hs<-t4[grep("Homo sapiens",t4$name),c(7)]
t5_hs<-t5[grep("Homo sapiens",t5$name),c(7)]
t6_hs<-t6[grep("Homo sapiens",t6$name),c(7)]
t7_hs<-t7[grep("Homo sapiens",t7$name),c(7)]
tall_hs<-cbind(t1_hs,t2_hs,t3_hs,t4_hs,t5_hs,t6_hs,t7_hs)
rownames(tall_hs)<-c("human")
colnames(tall_hs)<-c("CD01240","CD01244","CD01287","CD01382","CD01389","CD01404","CD01331")
abun2<-rbind(abun,tall_hs)
abun2["species"]<-rownames(abun2)
abun3<-melt(abun2,id=c("species"))
#Make a barplot
#Just cdiffs
hu<-abun2[-4,]
hu2<-melt(hu,id=c("species"))
png("cdiff_abun_stacked_bar.png",width=1200,height=1000)
ggplot(hu2,aes(x=variable,y=value,fill=species)) + geom_bar(stat = "identity") + labs(title="Abundance of C. diff in Metagenomic Samples") + ylab("Abundance") + xlab("Sample")
dev.off()

#just human
hu3<-abun2[4,]
hu4<-melt(hu3,id=c("species"))
png("human_abun_stacked_bar.png",width=1200,height=1000)
ggplot(hu4,aes(x=variable,y=value,fill=species)) + geom_bar(stat = "identity") + labs(title="Abundance of human in Metagenomic Samples") + ylab("Abundance") + xlab("Sample")
dev.off()

t1_10<-cbind(t1_nonzero[1:10,c(1,7)],rep("CD01240",10))
colnames(t1_10)<-c("name","abundance","sample")
t2_10<-cbind(t2_nonzero[1:10,c(1,7)],rep("CD01244",10))
colnames(t2_10)<-c("name","abundance","sample")
t3_10<-cbind(t3_nonzero[1:10,c(1,7)],rep("CD01287",10))
colnames(t3_10)<-c("name","abundance","sample")
t4_10<-cbind(t4_nonzero[1:10,c(1,7)],rep("CD01382",10))
colnames(t4_10)<-c("name","abundance","sample")
t5_10<-cbind(t5_nonzero[1:10,c(1,7)],rep("CD01389",10))
colnames(t5_10)<-c("name","abundance","sample")
t6_10<-cbind(t6_nonzero[1:10,c(1,7)],rep("CD01404",10))
colnames(t6_10)<-c("name","abundance","sample")
t7_10<-cbind(t7_nonzero[1:10,c(1,7)],rep("CD01331",10))
colnames(t7_10)<-c("name","abundance","sample")

top10<-rbind(t1_10,t2_10,t3_10,t4_10,t5_10,t6_10,t7_10)
png("stacked_bar_10_most_abun.png",width=1250,height=1050)
ggplot(top10,aes(x=sample,y=abundance,fill=name)) + geom_bar(stat = "identity") + labs(title="Top 10 Abundance in Metagenomic Samples") + ylab("Abundance") + xlab("Sample") +  theme(text = element_text(size=20))
dev.off()
#Filter on abundance grater than 0.005
png("stacked_bar_10_most_abun_1p.png",width=1250,height=1050)

ggplot(top10[top10$abundance>0.01,],aes(x=sample,y=abundance,fill=name)) + geom_bar(stat = "identity") + labs(title="Top 10 Abundance in Metagenomic Samples (>1%)") + ylab("Abundance") + xlab("Sample") +  theme(text = element_text(size=20))
dev.off()




