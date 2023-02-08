library(ggplot2)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

df <- fread('Economist_Assignment_Data.csv',drop=1)
head(df)
pl <- ggplot(df,aes(x=CPI,y=HDI)) + geom_point(aes(color = Region),shape = 1,size =4) 
pl2 <- pl + geom_smooth(aes(group=1),method = 'lm',formula = y ~ log(x),se = FALSE,color = 'red')


pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", data = subset(df, Country %in% pointsToLabel),
                       check_overlap = TRUE)

pl4 <- pl3 +theme_bw() + scale_x_continuous(name = "Corrupt Perceptions Index, 2011 (10 = Least corrupt)",breaks = 1:10, limits =c(.9,10.5) )

pl5 <- pl4 + scale_y_continuous(name = "Human Development Index, 2011 (1=Best)",
                                limits = c(0.2, 1.0))
pl6 <- pl5 + ggtitle('Corruption and Human development')
print(pl6)