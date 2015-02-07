# votestoseats
An algorithm for converting vote shares from election surveys to seat predictions, based on the "swing model"

This is a bit of R code to convert vote shares to seat shares in a "first past the post" election given the vote share distribution in the previous elections. 

The main function is "calcvotes". This takes in two inputs - one is a data frame that contains results of the previous elections that we use as reference. Each line of this data frame refers to one candidate from the previous election. This data frame necessarily needs to have four fields - 
1. "Party" which contains the name of the political party,
2. "Number" which is an integer which gives the number of the constituency (each constituency has a unique Number)
3. "Constituency" which is the name of the constituency
4. "Share" which has the vote share of the particular party in this constituency. This is a decimal.


The second input into the "calcvotes" function is a data frame that contains the vote share predictions for parties. The first column contains the names of the parties for which we're making the predictions. These party names need to match precisely with party names in the last elections table, else there won't be a match.  The second column contains the predicted vote shares (this is a decimal again). 

The algorithm is simple - we calculate overall vote share for each party in the previous elections, compare that to the predicted vote shares for each party in the current elections, calculate the difference and apply this "swing" in each constituency that the party competed in. Then we just calculate the "winner" in each constituency and total up the results. 
