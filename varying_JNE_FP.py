# To run the code we need to following:
#       pip3 install pandas numpy matplotlib

import statistics as stat

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

######################### Gloabl Plotting parameters #########################
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
##############################################################################

######################### Gloabl Data Process parameters #########################
# The input raw data file
filename = ["summary_results_compute1_for_quick.csv"]

# Base Column: columns used to filter data
baseColNames = ["CHITOCLO(CF)", "PERCENTHI(CP)", "FAILUREPROB(FP)", "UTIL"]
baseColAbbrs = ["CF", "CP", "FP", "UTIL"]
# default values in base column, in the order of CF, CP, FP, Util
defaultBaseValue = [2, 0.5, 0.0001, 80]

# Target Columns: columns that provide data
targetCols = [["JNE", "TOTAL_LO_CRIT_JOBS"], ["NiH", "TOTAL_HI_CRIT_JOBS"],
              ["TiH", "SIMULATION_DURATION"]]

##################################################################################


# plot line chart for the collected data
def plotData(datatable, xaxis, ymax, labels, xaxisName, yaxisName, name):
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

    # set the same ylim for a setting
    plt.ylim(-ymax / 10, ymax)

    # set x scale to log if it is FP
    if xaxisName == 'FP':
        plt.xscale('log')
        

    # add x,y labels
    plt.xlabel(xaxisName)
    plt.ylabel(yaxisName + ' (%)')

    # add legend
    plt.legend(loc=2, prop={'size': 5})

    # save figure to local PDF
    plt.savefig(name)
    plt.close('all')


# get data of target columns by filtering rows match the conditions
def processData(dataframe, policy, cHITocLO, percentHI, failureProb, util,
                period, targetCols):
    dataCollected = []

    # Data filtering for each row
    for colIndex in targetCols:
        dataCollected.append(
            dataframe[(dataframe["POLICY"] == policy)
                      & (dataframe["CHITOCLO(CF)"] == cHITocLO) &
                      (dataframe["PERCENTHI(CP)"] == percentHI) &
                      (dataframe["FAILUREPROB(FP)"] == failureProb) &
                      (dataframe["UTIL"] == util) &
                      (dataframe["PERIODS"] == period)][colIndex])

    # get the mean value in percentage
    return stat.mean(np.divide(dataCollected[0], dataCollected[1])) * 100


# Get the processed 2D data table for plotting
def collectData(dataframe, policies, targets, baseData, baseIndex, baseDefault,
                period):
    datatable = []

    # iterate through each failure probability
    for policyIndex in range(len(policies)):
        row = []

        # iterate through each policy
        for index in range(len(baseData)):
            # get data for both non harmonic and harmonic periods
            row.append(
                processData(
                    dataframe=dataframe,
                    policy=policies[policyIndex],
                    cHITocLO=baseData[index]
                    if baseIndex == 0 else baseDefault[0],
                    percentHI=baseData[index]
                    if baseIndex == 1 else baseDefault[1],
                    failureProb=baseData[index]
                    if baseIndex == 2 else baseDefault[2],
                    util=baseData[index] if baseIndex == 3 else baseDefault[3],
                    period=period,
                    targetCols=targets))

        datatable.append(row)

    return datatable


# Process data for each set of target columns
def dataProcessAndPlotPerSetting(filename, targets, base, baseIndex,
                                 baseDefault, baseAbbr):

    print('Processing: ' + targets[0] + '_' + baseAbbr + '_' + "Non_Harmonic")
    print('Processing: ' + targets[0] + '_' + baseAbbr + '_' + "New_Harmonic")

    # creating a csv reader object
    dataframe = pd.read_csv(filename)

    # e.g. ['AMC+' 'AMC+S' 'AMC+SG' 'BM' 'BMS' 'BMSG' 'new_MCS' 'new_MCSS' 'AMC-RA' 'AMC-RAS' 'FPPS']
    policies = dataframe['POLICY'].unique()
    # e.g. ['NON_HARMONIC' 'NEW_HARMONIC']
    periods = dataframe['PERIODS'].unique()
    # e.g. [1.e-05 1.e-04 1.e-03 1.e-02] for FP
    baseData = dataframe[base].unique()
    # sort baseData to non-descreasing
    baseData.sort()

    dataForPlot = []
    yMaxPerPlot = []
    # get data for "NON_HARMONIC" and "NEW_HARMONIC"
    for period in periods:
        data = collectData(dataframe=dataframe,
                           policies=policies,
                           targets=targets,
                           baseData=baseData,
                           baseIndex=baseIndex,
                           baseDefault=baseDefault,
                           period=period)
        dataForPlot.append(data)
        yMaxPerPlot.append(max(map(max, data)))

    ymax = max(yMaxPerPlot)

    for i in range(len(periods)):
        # plot figures
        plotName = targets[0] + "_for_" + baseAbbr + "_and_" + periods[
            i] + ".pdf"

        plotData(datatable=dataForPlot[i],
                 xaxis=baseData,
                 ymax=ymax,
                 labels=policies,
                 xaxisName=baseAbbr,
                 yaxisName=targets[0],
                 name=plotName)


if __name__ == "__main__":
    # for each file
    for file in filename:
        # for each set of target columns
        for target in targetCols:
            # for each set of base column
            for baseIndex in range(len(baseColNames)):
                dataProcessAndPlotPerSetting(filename=file,
                                             targets=target,
                                             base=baseColNames[baseIndex],
                                             baseIndex=baseIndex,
                                             baseDefault=defaultBaseValue,
                                             baseAbbr=baseColAbbrs[baseIndex])
