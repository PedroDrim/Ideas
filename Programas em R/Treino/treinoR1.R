require(plyr)
require(data.table)
source("functionsTreino1.R")

arquivo = "DadoFalso.csv"

create.table(arquivo, 10000, multiplicador =  2)
dadoFalso = fread(arquivo)

#=======================================#
# Agrupando com base na temperatura
dadoFalso$group = setCluster(dadoFalso$temperatura, 5)
#=======================================#

distribuicao = as.data.frame(table(dadoFalso$group))
names(distribuicao) = c("group","quantidade")

proporcao = distribuicao$quantidade/ sum(distribuicao$quantidade)
distribuicao$proporcao = round(proporcao*100, 2)

cores = heat.colors(dim(distribuicao)[1])

nome = "Grafico_Geral.tiff"
tiff(nome)
pie(distribuicao$quantidade, col = cores, labels = ,
    main = sprintf("Distribuicao dos grupos"))
dev.off()

write.table(distribuicao, "Summary.csv", sep = ";", row.names = F)

resposta = c()
for(groupId in distribuicao$group){
  
  dadoFalso.short = dadoFalso[dadoFalso$group == groupId,]
  dadoFalso.short$temperaturaCluster = setCluster(dadoFalso.short$temperatura, 10)
  
  resumo = ddply(dadoFalso.short, .(group,temperaturaCluster), summarize,
                 media = round(mean(temperatura),2), desvioPadrao = round(sd(temperatura),2))
  
  if(groupId == distribuicao$group[1]){
    resposta = resumo
  }else{
    resposta = rbind(resposta,resumo)
  }
}

nome = "Grafico_TemperaturaMedia.tiff"
graficoDispersaoMedia(nome, resposta)

nome = "Grafico_DesvioPadrao.tiff"
graficoDispersaoDesvioPadrao(nome, resposta)