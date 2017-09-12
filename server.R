library(shiny)

# student cordtra temporal analysis function
stu.plot <- function(n) {
  require(reshape2) 
  require(ggplot2)
  
  #read file
  n <- as.character(n) # n is week num
  file <- paste("df", n, ".csv", sep="")
  path <- "./stu/"
  df<-read.csv(paste(path, file, sep=""), header = TRUE, stringsAsFactors=FALSE)
  
  #create alllevels for change shape (scale_shape_manual)
  df$sortedid <- 1:nrow(df)
  df$code <- factor(df$code, levels=c("IEx", "IEl", "IQE", "IQR", "IPA","GEx", "GEl-1","GEl-2","GQE", 
                                      "GQR", "GPA","IML", "GML","ISP", "GSI-1","GSI-2"), 
                    labels=c("IEx", "IEl", "IQE", "IQR", "IPA","GEx", "GEl-1","GEl-2","GQE", 
                             "GQR", "GPA","IML", "GML","ISP", "GSI-1","GSI-2"))
  alllevels <- c(levels(df$code))
  
  #plot
  p <- ggplot(df) + 
    geom_point(aes(x=df$sortedid, y=df$code, shape=df$code, colour=df$student)) + 
    scale_shape_manual(values=1:length(alllevels))+
    xlab("Discussion Threads") + ylab("Coding Categories") 
  
  p + guides(shape=FALSE) +
    guides(col=guide_legend(ncol=2,title="Students"))
}

# instructor cordtra temporal analysis function
ins.plot <- function(n) {
  require(reshape2) 
  require(ggplot2)
  
  #read file
  n <- as.character(n) # n is week num
  file <- paste("df", n, ".csv", sep="")
  path <- "./ins/"
  df<-read.csv(paste(path, file, sep=""), header = TRUE, stringsAsFactors=FALSE)
  
  #create alllevels for change shape (scale_shape_manual)
  df$sortedid <- 1:nrow(df)
  df$code <- factor(df$code, levels=c("TP", "SP", "CP"), 
                    labels=c("TP", "SP", "CP"))
  alllevels <- c(levels(df$code))
  
  #plot
  p <- ggplot(df) + 
    geom_point(aes(x=df$sortedid, y=df$code, shape=df$code, colour=df$material)) + 
    scale_shape_manual(values=1:length(alllevels))+
    xlab("Time Series") + ylab("Instructor presences") 
  
  p + guides(shape=FALSE) +
    guides(col=guide_legend(ncol=1,title="Resources"))
}

#### shiny app
function(input, output) {
  
  output$stuPlot <- renderPlot({
    
    if (input$week==1) {
      stu.plot(2)
    }
    else if (input$week==2){
      stu.plot(8)
    }
    else {
      stu.plot(14)
    }
    
  }, height = 400, width = 600)
  
  output$insPlot <- renderPlot({
    if (input$week==1) {
      ins.plot(2)
    }
    else if (input$week==2) {
      ins.plot(8)
    }
    else {
      ins.plot(14)
    }
    
  },height = 400, width = 600)
}
