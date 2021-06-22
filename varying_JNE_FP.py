# 1. colors. Done
# 2. other R files. Started

import statistics as stat

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

######################### Gloabl parameters #########################
# supported policies
allPolices = [
    'AMC+', 'AMC+S', 'AMC+SG', 'BM', 'BMS', 'BMSG', 'new_MCS', 'new_MCSS',
    'AMC-RA', 'AMC-RAS', 'FPPS'
]
# fixed marker mapping for each policy
markers = ['o', 'v', '^', '<', '>', 'H', '+', 'x', 'X', 'D', 'd']
# fixed color mapping for each policy
colors = [
    'darkgreen', 'orchid', 'turquoise', 'yellow', 'green', 'orange', 'blue',
    'red', 'gray', 'purple', 'olive'
]
#######################################################################


# get the data of the target columns by filtering the rows that matches the conditions
def processData(dataframe, policy, failureProb, percentHI, cHITocLO, util,
                period, targetCols):
    dataCollected = []

    # Data filtering for each row
    for colIndex in targetCols:
        dataCollected.append(
            dataframe[(dataframe["POLICY"] == policy)
                      & (dataframe["FAILUREPROB(FP)"] == failureProb) &
                      (dataframe["PERCENTHI(CP)"] == percentHI) &
                      (dataframe["CHITOCLO(CF)"] == cHITocLO) &
                      (dataframe["UTIL"] == util) &
                      (dataframe["PERIODS"] == period)][colIndex])

    # get the mean value in percentage
    return stat.mean(np.divide(dataCollected[0], dataCollected[1])) * 100


baseCols = ["CHITOCLO(CF)", "PERCENTHI(CP)", "FAILUREPROB(FP)", "UTIL"]
# CF, CP, FP, Util
defaultBaseValue = [2, 0.5, 0.0001, 80]

# Get the processed 2D data table for plotting
def collectData(dataframe, policies, targets, baseData, baseIndex, baseDefault,
                periods):
    datatable_non = []
    datatable_new = []

    # iterate through each failure probability
    for policyIndex in range(len(policies)):
        row_non = []
        row_new = []

        # iterate through each policy
        for index in range(len(baseData)):
            # get data for both non harmonic and harmonic periods
            row_non.append(
                processData(dataframe=dataframe,
                            policy=policies[policyIndex],
                            cHITocLO= baseData[index] if baseIndex == 0 else baseDefault[0],
                            percentHI= baseData[index] if baseIndex == 1 else baseDefault[1],
                            failureProb=baseData[index] if baseIndex == 2 else baseDefault[3],
                            util=baseData[index] if baseIndex == 3 else baseDefault[4],
                            period="NON_HARMONIC",
                            targetCols=targetCols))
            row_new.append(
                processData(dataframe=dataframe,
                            policy=policies[policyIndex],
                            cHITocLO= baseData[index] if baseIndex == 0 else baseDefault[0],
                            percentHI= baseData[index] if baseIndex == 1 else baseDefault[1],
                            failureProb=baseData[index] if baseIndex == 2 else baseDefault[3],
                            util=baseData[index] if baseIndex == 3 else baseDefault[4],
                            period="NEW_HARMONIC",
                            targetCols=targetCols))

        datatable_non.append(row_non)
        datatable_new.append(row_new)

    return datatable_non, datatable_new


def dataProcessPlotPerFile(filename, targets, base, baseIndex, baseDefault):

    # creating a csv reader object
    dataframe = pd.read_csv(filename)

    # e.g. ['AMC+' 'AMC+S' 'AMC+SG' 'BM' 'BMS' 'BMSG' 'new_MCS' 'new_MCSS' 'AMC-RA' 'AMC-RAS' 'FPPS']
    policies = dataframe['POLICY'].unique()
    # e.g. ['NON_HARMONIC' 'NEW_HARMONIC']
    periods = dataframe['PERIODS'].unique()
    # e.g. [1.e-05 1.e-04 1.e-03 1.e-02] for FP
    base_raw = dataframe[base].unique()
    # e.g. [1.e-02 1.e-03 1.e-04 1.e-05] for FP
    baseData = base_raw[::-1]

    # get data for "NON_HARMONIC" and "NEW_HARMONIC"
    table_non, table_new = collectData(dataframe=dataframe,
                                       policies=policies,
                                       targets=targets,
                                       baseData=baseData,
                                       baseIndex=baseIndex,
                                       baseDefault=baseDefault,
                                       periods=periods)

    # plot figures
    plotData(datatable=table_non,
             xaxis=baseData,
             labels=policies,
             name="JNE_for_FP_and_non_harmonic.pdf")
    plotData(datatable=table_new,
             xaxis=baseData,
             labels=policies,
             name="JNE_for_FP_and_harmonic.pdf")

def plotData(datatable, xaxis, labels, name):
    # All markers available

    # plot the figure
    fig = plt.figure()
    for rowIndex in range(len(datatable)):
        currentPolicy = labels[rowIndex]
        policy_index = allPolices.index(currentPolicy)

        currentMarker = markers[policy_index]
        currentColor = colors[policy_index]

        plt.plot(xaxis,
                 datatable[rowIndex],
                 color=currentColor,
                 marker=currentMarker,
                 mfc='none',
                 label=labels[rowIndex],
                 linewidth=1.0,
                 markersize=3.0)

    # set x,y scale to log
    plt.yscale('log')
    plt.xscale('log')

    # add x,y labels
    plt.xlabel('FP')
    plt.ylabel('JNE (%)')

    # add legend
    plt.legend(prop={'size': 6})

    # save figure to local PDF
    plt.savefig(name)
    plt.close

if __name__ == "__main__":
    filename = "summary_results_compute1_for_quick.csv"

    baseCols = ["CHITOCLO(CF)", "PERCENTHI(CP)", "FAILUREPROB(FP)", "UTIL"]
    # CF, CP, FP, Util
    defaultBaseValue = [2, 0.5, 0.0001, 80]

    targetCols = [["JNE", "TOTAL_LO_CRIT_JOBS"], ["NiH", "TOTAL_HI_CRIT_JOBS"],
                  ["TiH", "SIMULATION_DURATION"]]

    for target in targetCols:
        for baseIndex in range(len(baseCols)):
            dataProcessPlotPerFile(filename=filename,
                                   targets=target,
                                   base=baseCols[baseIndex],
                                   baseIndex=baseIndex,
                                   baseDefault=defaultBaseValue)
