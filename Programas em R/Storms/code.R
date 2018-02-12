require(data.table)
require(ggplot2)
require(reshape2)

files = list.files(pattern = "csv")
original = lapply(files, fread)
original = do.call(rbind, original)

prepare.data = function(data){

  yearmonth = data$YEARMONTH
  tb = table(yearmonth)
  tb = data.frame(tb)
  
  tb$yearmonth = as.character(tb$yearmonth)
  tb$yearmonth = as.numeric(tb$yearmonth) / 100
  
  tb$YEAR = round(tb$yearmonth, 0)
  tb$MONTH = (tb$yearmonth - tb$YEAR) * 100
  
  tb$YEAR = as.factor(ceiling(tb$YEAR))
  tb$MONTH = as.factor(ceiling(tb$MONTH))
  
  tb$yearmonth = NULL
  return(tb)
}

data = prepare.data(original)

ggplot(data, aes(x = YEAR, y = MONTH)) + 
  geom_tile(aes(fill = Freq)) 

