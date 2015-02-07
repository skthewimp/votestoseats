# this file gives a sample of how to run the votes to seats converter using the example of Delhi elections 2015

preds <- as.data.frame(c("Aam Aadmi Party","Bharatiya Janata Party","Indian National Congress"))
preds$Preds <- c(0.45,0.4,0.1)
preds
names(preds)[1] <- "Party"

calcvotes(dl,preds)

aapbjp <- function(aap,bjp) # another function to predict seats given vote shares of AAP and BJP only 
{
  prd <- preds[1:2,]
  prd[1,2] <- aap
  prd[2,2] <- bjp
  return(calcvotes(dl,prd))
}


