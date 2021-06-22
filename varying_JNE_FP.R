mydata <- read.csv("C:\\Users\\zhaos\\Downloads\\summary_results_compute1_for_quick.csv")
str(mydata)

# JNE for non-harmonics
JNE_NON_HARMONIC_AMC <- c()
JNE_NON_HARMONIC_AMC_S <- c()
JNE_NON_HARMONIC_AMC_SG <- c()
JNE_NON_HARMONIC_BM <- c()
JNE_NON_HARMONIC_BMS <- c()
JNE_NON_HARMONIC_BMSG <- c()
JNE_NON_HARMONIC_FPPS <- c()

FP <- c(1, 0.1, 0.01, 0.001, 0.0001, 0.00001)
count <- 1

for (i in FP) {
    # and for each POLICY
    # take the mean of the values
    JNE_NON_HARMONIC_AMC[count] <- (mean(mydata[mydata[, "POLICY"] == "AMC+" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "JNE"] /
                                         mydata[mydata[, "POLICY"] == "AMC+" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_NON_HARMONIC_AMC_S[count] <- (mean(mydata[mydata[, "POLICY"] == "AMC+S" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "AMC+S" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_NON_HARMONIC_AMC_SG[count] <- (mean(mydata[mydata[, "POLICY"] == "AMC+SG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "AMC+SG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_NON_HARMONIC_BM[count] <- (mean(mydata[mydata[, "POLICY"] == "BM" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "BM" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_NON_HARMONIC_BMS[count] <- (mean(mydata[mydata[, "POLICY"] == "BMS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "BMS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_NON_HARMONIC_BMSG[count] <- (mean(mydata[mydata[, "POLICY"] == "BMSG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "BMSG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_NON_HARMONIC_FPPS[count] <- (mean(mydata[mydata[, "POLICY"] == "FPPS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "FPPS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NON_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    count <- count + 1
}

# JNE for harmonics
JNE_HARMONIC_AMC <- c()
JNE_HARMONIC_AMC_S <- c()
JNE_HARMONIC_AMC_SG <- c()
JNE_HARMONIC_BM <- c()
JNE_HARMONIC_BMS <- c()
JNE_HARMONIC_BMSG <- c()
JNE_HARMONIC_FPPS <- c()

FP <- c(1, 0.1, 0.01, 0.001, 0.0001, 0.00001)
count <- 1

for (i in FP) {
    # and for each POLICY
    # take the mean of the values
    JNE_HARMONIC_AMC[count] <- (mean(mydata[mydata[, "POLICY"] == "AMC+" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "AMC+" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_HARMONIC_AMC_S[count] <- (mean(mydata[mydata[, "POLICY"] == "AMC+S" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "AMC+S" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_HARMONIC_AMC_SG[count] <- (mean(mydata[mydata[, "POLICY"] == "AMC+SG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "AMC+SG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_HARMONIC_BM[count] <- (mean(mydata[mydata[, "POLICY"] == "BM" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "BM" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_HARMONIC_BMS[count] <- (mean(mydata[mydata[, "POLICY"] == "BMS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "BMS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_HARMONIC_BMSG[count] <- (mean(mydata[mydata[, "POLICY"] == "BMSG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "BMSG" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    JNE_HARMONIC_FPPS[count] <- (mean(mydata[mydata[, "POLICY"] == "FPPS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "JNE"] /
        mydata[mydata[, "POLICY"] == "FPPS" & mydata[, "FAILUREPROB.FP."] == i & mydata[, "PERCENTHI.CP."] == 0.5 & mydata[, "CHITOCLO.CF."] == 2 & mydata[, "UTIL"] == 80 & mydata[, "PERIODS"] == "NEW_HARMONIC", "TOTAL_LO_CRIT_JOBS"])) * 100.0
    count <- count + 1
}

# Plot the vectors of the values calculated above versus UTILs
pdf("JNE for FP and non-harmonic.pdf")
plot(FP, JNE_NON_HARMONIC_AMC,
    xlab = "FP", ylab = "JNE (%)", # main = "Non-harmonics, UTIL=80%, CP=0.5, CF=2.0",
    # xlim=c(1,2.5),
    ylim = c(
        0.001, 10
        # max(JNE_NON_HARMONIC_AMC,JNE_NON_HARMONIC_AMC_S,JNE_NON_HARMONIC_AMC_SG,JNE_NON_HARMONIC_BM,JNE_NON_HARMONIC_BMS,JNE_NON_HARMONIC_BMSG,JNE_NON_HARMONIC_FPPS,JNE_HARMONIC_AMC,JNE_HARMONIC_AMC_S,JNE_HARMONIC_AMC_SG,JNE_HARMONIC_BM,JNE_HARMONIC_BMS,JNE_HARMONIC_BMSG,JNE_HARMONIC_FPPS)
    ),
    log = "xy", type = "l", col = 1, pch = 1
)
points(FP, JNE_NON_HARMONIC_AMC, col = 1)

lines(FP, JNE_NON_HARMONIC_AMC_S, col = 2)
points(FP, JNE_NON_HARMONIC_AMC_S, col = 2, pch = 2)

lines(FP, JNE_NON_HARMONIC_AMC_SG, col = 3)
points(FP, JNE_NON_HARMONIC_AMC_SG, col = 3, pch = 3)

lines(FP, JNE_NON_HARMONIC_BM, col = 4)
points(FP, JNE_NON_HARMONIC_BM, col = 4, pch = 4)

lines(FP, JNE_NON_HARMONIC_BMS, col = 5)
points(FP, JNE_NON_HARMONIC_BMS, col = 5, pch = 5)

lines(FP, JNE_NON_HARMONIC_BMSG, col = 6)
points(FP, JNE_NON_HARMONIC_BMSG, col = 6, pch = 6)

# lines(FP, JNE_HARMONIC_FPPS,col=7)
# points(FP, JNE_HARMONIC_FPPS,col=7,pch=7)
# legend("topleft",c("AMC+","AMC+S","AMC+SG","BM","BMS","BMSG","FPPS"),col = c(1:7), pch=c(1:7))

legend("topleft", c("AMC+", "AMC+S", "AMC+SG", "BM", "BMS", "BMSG"), col = c(1:6), pch = c(1:6))
dev.off()

# Plot the vectors of the values calculated above versus UTILs
pdf("JNE for FP and harmonic.pdf")
plot(FP, JNE_HARMONIC_AMC,
    xlab = "FP", ylab = "JNE (%)", # main = "Harmonics, UTIL=80%, CP=0.5, CF=2.0",
    # xlim=c(1,2.5),
    ylim = c(
        0.0001, 10
        # max(JNE_NON_HARMONIC_AMC,JNE_NON_HARMONIC_AMC_S,JNE_NON_HARMONIC_AMC_SG,JNE_NON_HARMONIC_BM,JNE_NON_HARMONIC_BMS,JNE_NON_HARMONIC_BMSG,JNE_NON_HARMONIC_FPPS,JNE_HARMONIC_AMC,JNE_HARMONIC_AMC_S,JNE_HARMONIC_AMC_SG,JNE_HARMONIC_BM,JNE_HARMONIC_BMS,JNE_HARMONIC_BMSG,JNE_HARMONIC_FPPS)
    ),
    log = "xy", type = "l", col = 1, pch = 1
)
points(FP, JNE_HARMONIC_AMC, col = 1)

lines(FP, JNE_HARMONIC_AMC_S, col = 2)
points(FP, JNE_HARMONIC_AMC_S, col = 2, pch = 2)

lines(FP, JNE_HARMONIC_AMC_SG, col = 3)
points(FP, JNE_HARMONIC_AMC_SG, col = 3, pch = 3)

lines(FP, JNE_HARMONIC_BM, col = 4)
points(FP, JNE_HARMONIC_BM, col = 4, pch = 4)

lines(FP, JNE_HARMONIC_BMS, col = 5)
points(FP, JNE_HARMONIC_BMS, col = 5, pch = 5)

lines(FP, JNE_HARMONIC_BMSG, col = 6)
points(FP, JNE_HARMONIC_BMSG, col = 6, pch = 6)

# lines(FP, JNE_HARMONIC_FPPS,col=7)
# points(FP, JNE_HARMONIC_FPPS,col=7,pch=7)
# legend("topleft",c("AMC+","AMC+S","AMC+SG","BM","BMS","BMSG","FPPS"),col = c(1:7), pch=c(1:7))

legend("topleft", c("AMC+", "AMC+S", "AMC+SG", "BM", "BMS", "BMSG"), col = c(1:6), pch = c(1:6))
dev.off()