require(ggplot2)

lat = seq(1,50, by = .25)
lon = seq(1,50, by = .25)

df = matrix(ncol = 3, nrow = length(lat) * length(lon))

index = 1
for(i in lat){
  for(j in lon){
    alt = rnorm(1) * 10
    
    df[index, ] = c(i, j, alt)
    index = index + 1
  }
}

df = data.frame(df)
names(df) = c("lat", "lon", "alt")

ggplot(df, aes(lon,lat)) +
  geom_raster(aes(fill = alt))
