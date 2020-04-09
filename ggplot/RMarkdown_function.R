library(tidyverse)

render_report = function(year) {
  rmarkdown::render(
    "Markdown_Report.Rmd", params = list(
       year = year
    ),
    output_file = paste0("Report-", year, ".docx")
  )
}

wildfire_table<-readr::read_csv("./Output/wildfire_clean.csv",
                                col_types=list("c","n","c","c","c","n","n","n","c","c","n","n","n","c","c","n"))

#Doing to do a subset of 10 years for an example

wildfire_table<-wildfire_table %>%filter(between(year(IGN_DATE),1995,2015))

#get list of unique years within the data
list_years<-unique(year(wildfire_table$IGN_DATE))

map(list_years,~render_report(.x))

