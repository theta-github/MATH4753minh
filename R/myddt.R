#' @title myddt
#'
#' @param df
#' @param SPECIES
#'
#' @return
#' @export
#'
#' @examples
myddt=function(df, SPECIES)
{
  library(dplyr)
  library(ggplot2)
  ddt <- df %>% filter(SPECIES == {{SPECIES}})
  g <- ggplot(ddt, aes(x = LENGTH, y = WEIGHT))
  g = g + geom_point(aes_string(color="SPECIES")) +
    geom_smooth(formula = y~x + I(x^2), method = "lm") +
    labs(title="Minh Dinh",
         x="LENGTH",
         y="WEIGHT")

  print(g)

  string = "LvsWfor"
  string2 = ".csv"
  result = paste(string,SPECIES,sep="")
  result2 = paste(result,string2,sep="")
  write.csv(ddt, result2)

  named_list <- list(df, ddt, table(df$RIVER)/length(df$RIVER))
  names(named_list) <- c("Before subset", "After subset", "Rel. Freq. of RIVER")
  print(named_list)
}

