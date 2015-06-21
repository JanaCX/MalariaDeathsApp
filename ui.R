library(shiny)

pageWithSidebar(
      # Application title
      headerPanel("Malaria: Preliminary analysis of Mortality"),
      
      # Required inputs: Year to display, threshold (number of deaths)
      sidebarPanel(
            selectInput("y", "Year:",
                        list("2000" = "y2000", 
                             "2001" = "y2001", 
                             "2002" = "y2002",
                             "2003" = "y2003",
                             "2004" = "y2004",
                             "2005" = "y2005",
                             "2006" = "y2006",
                             "2007" = "y2007",
                             "2008" = "y2008",
                             "2009" = "y2009",
                             "2010" = "y2010",
                             "2011" = "y2011",
                             "2012" = "y2012"
                             )),
            sliderInput('thres', 'Threshold:', 
                        value = 1000, min = 650, max = 1500, step = 2),
            br(),
            br(),
            h4("Reported Yearly Deaths"),
            p("The data used in this app was published by the WHO and contains information on 82 countries for the years 2000-2012. Malaria is endemic to tropical countries thus an appropriate range of thresholds, based on the third quartiles of the entire database, limits the countires displayed to those where Malaria constitutes a problem. Select a year and a threshold (the summary tab includes all of the data for a given year).")
      ),
      
      
      # Show a tabset that includes a plot, summary, and table view
      # of the generated distribution
      mainPanel(
            tabsetPanel(
                  tabPanel("Plot", plotOutput("plot")), 
                  tabPanel("Countries Above Threshold", tableOutput("subdata")),
                  tabPanel("Yearly Summary", verbatimTextOutput("summary"))
            )
      )
)