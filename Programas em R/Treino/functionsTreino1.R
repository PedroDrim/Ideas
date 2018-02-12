create.table = function(nome, dataSize = 1000, multiplicador = 1, seed = 666){
  
  set.seed(seed)
  
  if((multiplicador <= 0) || (dataSize <= 0)){
    multiplicador = 1
    dataSize = 1000
  }
  
  for(i in 1:multiplicador){
    
    first = (i == 1)
    
    amostra = sprintf("Amostra %s", ((1:dataSize) + (dataSize * (i - 1 ) )) )
    largura = round(abs(rnorm(dataSize)*100),digits = 2)
    altura = round(abs(rnorm(dataSize)*100),digits = 2)
    temperatura = round(rnorm(dataSize)*10,digits = 2)
    
    dadoFalso = data.frame(amostra, largura, altura, temperatura)
    
    write.table(dadoFalso, nome, append = !first, col.names = first, sep = ";", row.names = F)                      
  }
  
  cat(sprintf("Tabela gerada com sucesso."))
}

graficoDispersaoMedia = function(nome, tabela){
  
  media.max = max(tabela$media) + 2
  media.min = min(tabela$media) - 2
  
  tiff(nome)
  group = unique(resposta$group)
  
  cores = rainbow(length(group))
  
  for(i in group){
    index = which(tabela$group == i)
    tabela.short = tabela[index,]
    
    if(i == group[1]){
      plot(tabela.short$temperaturaCluster, tabela.short$media,
           col = cores[i], xlab = "Cluster de Temperatura",
           ylab = "Valor da media", type = "l", ylim = c(media.max, media.min))
    }else{
      lines(tabela.short$temperaturaCluster, tabela.short$media,
            col = cores[i])
    }
  }
  
  dev.off()
}

graficoDispersaoDesvioPadrao = function(nome, tabela){
  
  sd.max = max(tabela$desvioPadrao) + 2
  sd.min = min(tabela$desvioPadrao) - 2
  
  tiff(nome)
  group = unique(resposta$group)
  
  cores = rainbow(length(group))
  
  for(i in group){
    index = which(tabela$group == i)
    tabela.short = tabela[index,]
    
    if(i == group[1]){
      plot(tabela.short$temperaturaCluster, tabela.short$desvioPadrao,
           col = cores[i], xlab = "Cluster de Temperatura",
           ylab = "Valor do desvio padrao", type = "l", ylim = c(sd.max, sd.min))
    }else{
      lines(tabela.short$temperaturaCluster, tabela.short$desvioPadrao,
            col = cores[i])
    }
  }
  
  dev.off()
}

setCluster = function(vetor, quantidade){
  
  tamanho = length(vetor)
  group = c()
  base = tamanho%%quantidade
  
  interacoes = ceiling(tamanho/1000)
  
  for(i in 1:interacoes){
    
    inicio = 1 + (1000 * (i -1) )
    
    if(i == interacoes){
      fim = tamanho
    }else{
      fim = (1000 * i)  
    }
    
    resp = NA
    if(inicio != fim){
      vetor.short = vetor[inicio : fim]
      distancia = dist(vetor.short)
      hc = hclust(distancia)
      resp = cutree(hc, quantidade)
    }
    
    group = c(group ,resp)
  }
  
  return(group)
}