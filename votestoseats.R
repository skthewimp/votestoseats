calcvotes <- function(lasttime,predictions) 
  # predictions is a data frame with party names in first column, predicted vote shares in second
{
  preds <- predictions
  names(preds) <- c("Party","Preds")
  vs <- aggregate(Votes~Party,lasttime,sum)
  vs$Share <- vs[,2]/sum(vs[,2])
  vs <- merge(vs,preds,all.x=T)
  vs$Swing <- vs$Preds - vs$Share
  vs$Swing <- ifelse(is.na(vs$Swing),0,vs$Swing)
  lasttime <- merge(lasttime,vs[,c("Party","Swing")],all.x=T)
  lasttime[is.na(lasttime$Swing),"Swing"] <- 0 
  lasttime$Share2 <- lasttime$Share + lasttime$Swing
  winners <- aggregate(Share2~Constituency+Number,lasttime,max)
  winners <- merge(winners,lasttime)
  seats <- as.data.frame(table(winners$Party))
  seats <- seats[seats[,2]>0,]
  names(seats)[1] <- "Party"
  seats <- seats[with(seats,order(-Freq)),]
  return(seats)  
}

