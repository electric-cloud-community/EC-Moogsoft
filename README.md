# EC-Moogsoft

This plugin implements the Moosgsoft GET Graze APIs that can be used in 
surfacing Alerts and Situations stored in a Moogsoft AIOPS system. 


# Procedures

## Get System Status

Performs a GET request that returns current system status information for all processes.

## Get System Summary

A GET request that returns a summary of current Alerts and Situations in Moogsoft AIOps.

## Get Alert Ids

A GET request that returns the total number of Alerts, and a list of their Alert IDs for a specified Alert filter and a limit.

## Get Situation Ids

A GET request that that returns the total number of Situations, and a list of their Situation IDs for a specified situation filter and a limit.

## Get Active Situation Ids

A GET request that returns the total number of active Situations, and a list of their Situation IDs. Active Situations are those that are not Closed, Resolved or Dormant.

## Get Alert Details

A GET request that returns details (such as Description, Severity, etc.) of a specified Alert.

## Get Situation Alert Ids

A GET request that returns the total number of Alerts, and a list of their Alert IDs for a specified Situation. This can be either all Alerts or just those Alerts unique to the Situation.

## Get Situation Description

A GET request that returns the description for a specified Situation.

## Get Situation Details

A GET request that returns the details of a specified Situation.

## Get Situation Hosts

A GET request that returns a list of host names for a specified Situation, either for all the Alerts in the Situation or just for the unique Alerts.Hosts are the names (defined in the alerts.source field in the database) for the sources of Events.



# Building the plugin
1. Download or clone the EC-Moogsoft repository.

    ```
    git clone https://github.com/electric-cloud/EC-Moogsoft.git
    ```

5. Zip up the files to create the plugin zip file.

    ```
     cd EC-Moogsoft
     zip -r EC-Moogsoft.zip ./*
    ```

6. Import the plugin zip file into your ElectricFlow server and promote it.

