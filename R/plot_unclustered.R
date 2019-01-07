library(ggplot2)
library(reshape2)

#Read in the files
dat<-read.csv("unclustered_heatmap.tsv",header=T,sep="\t")
tab<-read.csv("assembly_info.csv",header=T,sep=",")

#Kep only columns we want
tab1<-tab[,colnames(tab) %in% c("QC","Patient.ID","MLST")]
rm(tab)

#Melt heatmap df
dat1<-melt(dat)

#Rename columns
colnames(dat1)<-c("G1","G2","distance")

#Merge on G1
dat2<-merge(dat1,tab1,by.x="G1",by.y="QC",all=TRUE)

#Re order columns and rename
dat2<-dat2[,c(1,4,5,2,3)]
colnames(dat2)<-c("G1","G1_PID","G1_ST","G2","distance")

#Merge on G2
dat3<-merge(dat2,tab1,by.x="G2",by.y="QC",all=TRUE)

#Re order columns and rename
dat3<-dat3[,c(2,3,4,1,6,7,5)]
colnames(dat3)<-c("G1","G1_PID","G1_ST","G2","G2_PID","G2_ST","distance")

#Remove "no match" mlsts
dat4<-dat3[!(dat3$G1_ST=="No Match"),]
dat5<-dat4[!(dat4$G2_ST=="No Match"),]

#Remove duplicate rows
dat6<-dat5[!duplicated(dat5), ]

#Remove same-same
i<-which(!(dat6$G1==dat6$G2))
dat7<-dat6[i, ]

#Remove duplicate comparisons, i.e. where there is  A-B and B-A, only keep A-B
dat8<-dat7[!duplicated(t(apply(dat7[c("G1", "G2")], 1, sort))), ]

#Identify serial isolates
pid_counts<-data.frame(table(tab1$Patient.ID))
serial<-pid_counts[pid_counts$Freq > 1,]
colnames(serial)<-c("PID","N_samples")

#Only compare isolates of the same ST
dat9<-dat8
dat9["share_ST"]<- ifelse(dat9$G1_ST == dat9$G2_ST , "1", 0)
dat10<-dat9[dat9$share_ST >0,]

#Remove serial isolats from df
'%!in%' <- function(x,y)!('%in%'(x,y))
dat11<-dat10[dat10$G1_PID %!in% serial$PID,]
dat11<-dat11[dat11$G2_PID %!in% serial$PID,]
dat11['compare']<-"inter-patient" 

#Make specific serial isolate df
serial_df<-dat10[dat10$G1_PID %in% serial$PID & dat10$G2_PID %in% serial$PID,]
serial_df["compare"]<- ifelse(serial_df$G1_PID == serial_df$G2_PID, "intra-patient", 0)
serial_df_final<-serial_df[serial_df$compare == "intra-patient",]

#Cbind the two dataframes
dat12<-rbind(dat11,serial_df_final)

#Get y coordinate density values
yindex_serial<-which.max(density(serial_df_final$distance)$y)
x_coord_serial<-density(serial_df_final$distance)$x[yindex_serial]

yindex_other<-which.max(density(dat11$distance)$y)
x_coord_other<-density(dat11$distance)$x[yindex_other]

x_coord_serial<-round(x_coord_serial, digits = 2)
x_coord_other<-round(x_coord_other,digits=2)

my_title = paste("SNP distribution inter and intra patient (unclustered) \n \n inter-peak=",x_coord_other," \n intra-peak=",x_coord_serial)

#Make plots
p<-ggplot(dat12,aes(x=distance,color=compare)) +  
geom_density() + 
xlim(-10, 600) +   
labs(title=my_title,x="Parsnp distance", y = "Density") + 
geom_vline(xintercept = x_coord_serial, linetype="dotted",color = "#00BFC4", size=0.7) + 
geom_vline(xintercept = x_coord_other, linetype="dotted",color = "#F8766D", size=0.7) 

ggsave(filename="test1.pdf", width = 10, height =12, plot=p)



