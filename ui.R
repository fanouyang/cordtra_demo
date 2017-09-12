library(shiny)
shinyUI(
  navbarPage("CORDTRA-R Temporal Analysis",
             tabPanel("CORDTRA Temporal Analysis",
                      
                      sidebarPanel(
                        selectInput("week", "Choose a week:", 
                                    c("Week02"= 1, "Week08"= 2, "Week14"= 3)
                                    #helpText("Note: This is a demo for temporal analysis of students' and instructor's involvements of three weeks during a course"),
                                    #width=4
                                  )
                      ),
                      
                      mainPanel(            
                        tabsetPanel("Panel 1.x",
                                    tabPanel("Students' collaborative inquiry", plotOutput("stuPlot")),
                                    tabPanel("Instructor's online presence", plotOutput("insPlot"))
                                )
                              )
                   ),
             
             tabPanel("More Information",   
                      "Shiny App developer: Fan Ouyang" ,
                      a("ouyan064@umn.edu", href="mailto:ouyan064@umn.edu"),
                      br(),
                    
                      a("Read the original article Understanding collaborative learning processes in new learning environments",href="https://link.springer.com/article/10.1007%2Fs11251-008-9063-8", target="_blank")
             )  
       )
)





