
# Argus Media Interview Project - Index Price Calculation

## Overview

This Shiny application is designed to calculate index prices for coal based on deals data provided in a CSV file. The application processes the data to compute index prices for two types of coal indices - COAL2 and COAL4 - and displays the results in a table and a bar plot.

## Features

- **CSV File Upload:** Users can upload a CSV file containing deals data.
- **Index Price Calculation:** The application calculates index prices for COAL2 and COAL4 based on the uploaded data.
- **Data Visualization:** Index prices are displayed in a table and visualized in a bar plot.
- **Sample Data Download:** Users can download a sample CSV file to understand the required format.
- **Notes Section:** Provides additional information about the indices.

## File Structure

- `app.R`: The main file for the Shiny application.
- `argus_media_interview_arun.Rproj`: The R project file.
- `server.R`: Contains the server logic for the Shiny application.
- `ui.R`: Contains the UI layout for the Shiny application.
- `utils.R`: Contains utility functions used in the application.
- `renv/`: Directory for the renv environment.
- `www/`: Directory containing additional resources like images and CSS files.
- `renv.lock`: The lock file for renv environment.
- `.Rprofile`: Configuration file for the R environment.

## Dependencies

- `shiny`
- `ggplot2`
- `reshape2`
- `dplyr`
- `data.table`
- `shinyalert`
- `lubridate`

## Installation

1. Open the project in RStudio:
   \`\`\`sh
   open argus_media_interview_arun.Rproj
   \`\`\`
2. Restore the renv environment:
   \`\`\`R
   renv::restore()
   \`\`\`
3. Run the Shiny application:
   \`\`\`R
   shiny::runApp()
   \`\`\`

## Usage

1. **Upload CSV File:** Click on "Choose CSV File" and upload your deals data.
2. **Process Data:** Click on the "Process" button to calculate the index prices.
3. **View Results:** The calculated index prices will be displayed in a table and a bar plot.
4. **Download Sample Data:** Click on "Download Sample" to download a sample CSV file.

## CSV File Format

The CSV file should have the following columns:
- `ID`
- `DEAL DATE`
- `COMMODITY`
- `COMMODITY SOURCE LOCATION`
- `DELIVERY LOCATION`
- `DELIVERY MONTH`
- `DELIVERY YEAR`
- `VOLUME`
- `PRICE`

## Notes

1. COAL2 index prices are for coal delivered into Northwest Europe (delivery locations: ARA, AMS, ROT, ANT).
2. COAL4 index prices are for coal delivered from South Africa.

## Contact

For any queries, please contact arunkodati77@gmail.com.
