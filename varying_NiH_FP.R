mydata <- read.csv("C:\\Users\\zhaos\\Downloads\\summary_results_compute1_for_quick.csv")
str(mydata)

# NiH for non-harmonics
NiH_NON_HARMONIC_AMC <- c()
NiH_NON_HARMONIC_AMC_S<- c()
NiH_NON_HARMONIC_AMC_SG<- c()
NiH_NON_HARMONIC_BM<- c()
NiH_NON_HARMONIC_BMS<- c()
NiH_NON_HARMONIC_BMSG<- c()
NiH_NON_HARMONIC_FPPS<- c()

FP <- c(1,0.1,0.01,0.001,0.0001,0.00001)
count=1

for (i in FP) {
    
    # and for each POLICY
    # take the mean of the values
    NiH_NON_HARMONIC_AMC[count] = (mean(mydata[mydata[,'POLICY']=='AMC+'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='AMC+'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_NON_HARMONIC_AMC_S[count] = (mean(mydata[mydata[,'POLICY']=='AMC+S'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='AMC+S'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_NON_HARMONIC_AMC_SG[count] = (mean(mydata[mydata[,'POLICY']=='AMC+SG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='AMC+SG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_NON_HARMONIC_BM[count] = (mean(mydata[mydata[,'POLICY']=='BM'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='BM'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_NON_HARMONIC_BMS[count] = (mean(mydata[mydata[,'POLICY']=='BMS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='BMS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_NON_HARMONIC_BMSG[count] = (mean(mydata[mydata[,'POLICY']=='BMSG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='BMSG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_NON_HARMONIC_FPPS[count] = (mean(mydata[mydata[,'POLICY']=='FPPS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='FPPS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NON_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    count =count+1
}

# NiH for harmonics
NiH_HARMONIC_AMC <- c()
NiH_HARMONIC_AMC_S<- c()
NiH_HARMONIC_AMC_SG<- c()
NiH_HARMONIC_BM<- c()
NiH_HARMONIC_BMS<- c()
NiH_HARMONIC_BMSG<- c()
NiH_HARMONIC_FPPS<- c()

FP <- c(1,0.1,0.01,0.001,0.0001,0.00001)
count=1

for (i in FP) {
    
    # and for each POLICY
    # take the mean of the values
    NiH_HARMONIC_AMC[count] = (mean(mydata[mydata[,'POLICY']=='AMC+'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='AMC+'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_HARMONIC_AMC_S[count] = (mean(mydata[mydata[,'POLICY']=='AMC+S'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='AMC+S'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_HARMONIC_AMC_SG[count] = (mean(mydata[mydata[,'POLICY']=='AMC+SG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='AMC+SG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_HARMONIC_BM[count] = (mean(mydata[mydata[,'POLICY']=='BM'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='BM'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_HARMONIC_BMS[count] = (mean(mydata[mydata[,'POLICY']=='BMS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='BMS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_HARMONIC_BMSG[count] = (mean(mydata[mydata[,'POLICY']=='BMSG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='BMSG'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    NiH_HARMONIC_FPPS[count] = (mean(mydata[mydata[,'POLICY']=='FPPS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','NiH'] /
    mydata[mydata[,'POLICY']=='FPPS'& mydata[,'FAILUREPROB.FP.']== i & mydata[,'PERCENTHI.CP.'] == 0.5 & mydata[,'CHITOCLO.CF.'] == 2 & mydata[,'UTIL'] == 80 & mydata[,'PERIODS'] == 'NEW_HARMONIC','TOTAL_HI_CRIT_JOBS'])) * 100.0
    count =count+1
}

#Plot the vectors of the values calculated above versus UTILs
pdf("NiH for FP and non-harmonic.pdf")
plot(FP, NiH_NON_HARMONIC_AMC, xlab="FP",ylab = 'NiH (%)', #main = "Non-harmonics, UTIL=80%, CP=0.5, CF=2.0",
# xlim=c(1,2.5),
ylim=c(0.0,max(NiH_NON_HARMONIC_AMC,NiH_NON_HARMONIC_AMC_S,NiH_NON_HARMONIC_AMC_SG,NiH_NON_HARMONIC_BM,NiH_NON_HARMONIC_BMS,NiH_NON_HARMONIC_BMSG,NiH_NON_HARMONIC_FPPS,NiH_HARMONIC_AMC,NiH_HARMONIC_AMC_S,NiH_HARMONIC_AMC_SG,NiH_HARMONIC_BM,NiH_HARMONIC_BMS,NiH_HARMONIC_BMSG,NiH_HARMONIC_FPPS)),
log="xy", type= "l", col=1,pch=1)
points(FP, NiH_NON_HARMONIC_AMC,col=1)

lines(FP, NiH_NON_HARMONIC_AMC_S,col=2)
points(FP, NiH_NON_HARMONIC_AMC_S,col=2,pch=2)

lines(FP, NiH_NON_HARMONIC_AMC_SG,col=3)
points(FP, NiH_NON_HARMONIC_AMC_SG,col=3,pch=3)

lines(FP, NiH_NON_HARMONIC_BM,col=4)
points(FP, NiH_NON_HARMONIC_BM,col=4,pch=4)

lines(FP, NiH_NON_HARMONIC_BMS,col=5)
points(FP, NiH_NON_HARMONIC_BMS,col=5,pch=5)

lines(FP, NiH_NON_HARMONIC_BMSG,col=6)
points(FP, NiH_NON_HARMONIC_BMSG,col=6,pch=6)
# lines(FP, JNE_HARMONIC_FPPS,col=7)
# points(FP, JNE_HARMONIC_FPPS,col=7,pch=7)
# legend("topleft",c("AMC+","AMC+S","AMC+SG","BM","BMS","BMSG","FPPS"),col = c(1:7), pch=c(1:7))

legend("topleft",c("AMC+","AMC+S","AMC+SG","BM","BMS","BMSG"),col = c(1:6), pch=c(1:6))
dev.off()

#Plot the vectors of the values calculated above versus UTILs
pdf("NiH for FP and harmonic.pdf")
plot(FP, NiH_HARMONIC_AMC, xlab="FP",ylab = 'NiH (%)', #main = "Harmonics, UTIL=80%, CP=0.5, CF=2.0",
# xlim=c(1,2.5),
ylim=c(0.0,max(NiH_NON_HARMONIC_AMC,NiH_NON_HARMONIC_AMC_S,NiH_NON_HARMONIC_AMC_SG,NiH_NON_HARMONIC_BM,NiH_NON_HARMONIC_BMS,NiH_NON_HARMONIC_BMSG,NiH_NON_HARMONIC_FPPS,NiH_HARMONIC_AMC,NiH_HARMONIC_AMC_S,NiH_HARMONIC_AMC_SG,NiH_HARMONIC_BM,NiH_HARMONIC_BMS,NiH_HARMONIC_BMSG,NiH_HARMONIC_FPPS)),
log="xy", type= "l", col=1,pch=1)
points(FP, NiH_HARMONIC_AMC,col=1)

lines(FP, NiH_HARMONIC_AMC_S,col=2)
points(FP, NiH_HARMONIC_AMC_S,col=2,pch=2)

lines(FP, NiH_HARMONIC_AMC_SG,col=3)
points(FP, NiH_HARMONIC_AMC_SG,col=3,pch=3)

lines(FP, NiH_HARMONIC_BM,col=4)
points(FP, NiH_HARMONIC_BM,col=4,pch=4)

lines(FP, NiH_HARMONIC_BMS,col=5)
points(FP, NiH_HARMONIC_BMS,col=5,pch=5)

lines(FP, NiH_HARMONIC_BMSG,col=6)
points(FP, NiH_HARMONIC_BMSG,col=6,pch=6)

# lines(FP, JNE_HARMONIC_FPPS,col=7)
# points(FP, JNE_HARMONIC_FPPS,col=7,pch=7)
# legend("topleft",c("AMC+","AMC+S","AMC+SG","BM","BMS","BMSG","FPPS"),col = c(1:7), pch=c(1:7))

legend("topleft",c("AMC+","AMC+S","AMC+SG","BM","BMS","BMSG"),col = c(1:6), pch=c(1:6))
dev.off()

