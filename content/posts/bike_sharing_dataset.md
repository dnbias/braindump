+++
title = "Bike Sharing Dataset"
author = ["Daniel Biasiotto"]
date = 2023-05-07T22:47:00+02:00
tags = ["project"]
draft = false
+++

-   Link: <https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset>#

-   Related: [Knowledge Discovery &amp; Data Mining]({{< relref "knowledge_discovery_data_mining.md" >}})


## Files {#files}

-   Readme.txt
-   hour.csv : bike sharing counts aggregated on hourly basis. Records: 17379 hours
-   day.csv - bike sharing counts aggregated on daily basis. Records: 731 days


## Attributes {#attributes}

In `day.csv` there is no `hr` field

-   instant: record index
-   dteday : date
-   season : season (1:spring, 2:summer, 3:fall, 4:winter)
-   yr : year (0: 2011, 1:2012)
-   mnth : month ( 1 to 12)
-   hr : hour (0 to 23)
-   holiday : wether day is holiday or not (extracted from <http://dchr.dc.gov/page/holiday-schedule>)
-   weekday : day of the week
-   workingday : if day is neither weekend nor holiday is 1, otherwise is 0.
-   weathersit :
    1.  Clear, Few clouds, Partly cloudy, Partly cloudy
    2.  Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
    3.  Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
    4.  Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
-   temp : Normalized temperature in Celsius. The values are divided to 41 (max)
-   atemp: Normalized feeling temperature in Celsius. The values are divided to 50 (max)
-   hum: Normalized humidity. The values are divided to 100 (max)
-   windspeed: Normalized wind speed. The values are divided to 67 (max)
-   casual: count of casual users
-   registered: count of registered users
-   cnt: count of total rental bikes including both casual and registered


## Learning Tasks {#learning-tasks}

-   author suggest _regression_ predicting of bike rentals hourly or daily based on the environmental settings.
-   maybe consider % of registered to total and casual to total and how it varies


## Project Tasks {#project-tasks}

1.  What data to work on
2.  How the data is managed in your system
3.  Prepare the data:
    -   describe and discuss each attribute by visualization
    -   repair the data if needed, add attributes etc.
4.  Analyze with an application of choice
5.  Interpret the results
6.  Propose a resulting activity
