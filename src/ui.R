
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(skin = "black",
   dashboardHeader(title = img(src="noesis2.png"),
                   dropdownMenu(type = "messages",
                                messageItem(
                                  from = "Sales Dept",
                                  message = "Sales are steady this month."
                                ),
                                messageItem(
                                  from = "New User",
                                  message = "How do I register?",
                                  icon = icon("question"),
                                  time = "13:45"
                                ),
                                messageItem(
                                  from = "Support",
                                  message = "The new server is ready.",
                                  icon = icon("life-ring"),
                                  time = "2014-12-01"
                                )
                   ),
                   dropdownMenu(type = "notifications",
                                notificationItem(
                                  text = "5 new users today",
                                  icon("users")
                                ),
                                notificationItem(
                                  text = "12 items delivered",
                                  icon("truck"),
                                  status = "success"
                                ),
                                notificationItem(
                                  text = "Server load at 86%",
                                  icon = icon("exclamation-triangle"),
                                  status = "warning"
                                )
                   ),
                   
                   dropdownMenu(type = "tasks", badgeStatus = "success",
                                taskItem(value = 90, color = "green",
                                         "Documentation"
                                ),
                                taskItem(value = 17, color = "aqua",
                                         "Project X"
                                ),
                                taskItem(value = 75, color = "yellow",
                                         "Server deployment"
                                )
                   )
                   
                   ),
   dashboardSidebar(
     
     sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                       label = "Search"),
     sidebarMenu(
       menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"),
                badgeLabel = "new", badgeColor = "green"),
       menuItem("Projects", tabName = "projects", icon = icon("suitcase"),
                badgeLabel = "new", badgeColor = "green"),
       menuItem("Datasets", tabName = "datasets", icon = icon("table"),
                badgeLabel = "new", badgeColor = "green"),
       sliderInput("slider", "Slider input:", 1, 100, 50)
     )
   ),
   dashboardBody(
     tabItems(
       tabItem("dashboard","APAGAR -> Cenas do Dashboard",
     fluidRow(
       # A static valueBox
       valueBox(10 * 2, "New Orders", icon = icon("credit-card"),width = 3),
       
       # Dynamic valueBoxes
       valueBoxOutput("progressBox",width = 3),
       
       valueBoxOutput("approvalBox",width = 3)
     ),
     fluidRow(
       tabBox(width = 6,
         id = "tabset1",
         tabPanel("Chart", 
                  plotOutput("distPlot")),
         tabPanel("Table", 
                  dataTableOutput('table')),
         tabPanel("Summary",
                  verbatimTextOutput("sum"))
         
       )
     )
       ),
     tabItem("projects","APAGAR -> Cenas do Prjects"),
     tabItem("datasets","APAGAR -> Cenas do Datasets", 
             selectInput("v_datasets", "Datasets:",
                         c(list.files('./data'))))
     )
   )
  )
)

