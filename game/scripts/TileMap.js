var TileMap = function(mapString){

	var prepareMap = function(string){

		var tileArray = string.split("\n");
		var contadorExterno = 0;
		var tileMatrix = [];

		for(index in tileArray){

			line = jQuery.trim(tileArray[index]);
			if(!line) continue;
				
			try{
				tileString = line.split("");

				var tileLine = [];
				var contadorInterno = 0;
				for(indexTile in tileString){
					
					var localTile = new Tile(contadorInterno,contadorExterno,tileString[indexTile]);
					localTile.drawTile();

					tileLine.push( localTile );
					contadorInterno = contadorInterno + 1;
				}

				tileMatrix.push(tileLine);
				contadorExterno = contadorExterno + 1;
			}catch(erro){

			}
		}
		return(tileMatrix);	
	}

	this.tileMatrix = prepareMap(mapString);
}

TileMap.prototype.getTileMatrix = function(){
	return this.tileMatrix;
}

TileMap.prototype.getPlayer = function(){

	var player = [];
	var tm = this.tileMatrix;
	for(indexLine in tm){

		var tileLine = tm[indexLine];
		for(index in tileLine){

			var tile = tileLine[index];
			if(tile.getTileProperties() == "player") player.push(tile);
		}
	}

	return player;
}

TileMap.prototype.getBlock = function(){

	var block = [];
	var tm = this.tileMatrix;
	for(indexLine in tm){

		var tileLine = tm[indexLine];
		for(index in tileLine){

			var tile = tileLine[index];
			if(tile.getTileProperties() == "block") block.push(tile);
		}
	}
	return block;
}

TileMap.prototype.getTileByPosition = function(coordX, coordY) {
	return( this.tileMatrix[coordY][coordX] );
};

TileMap.prototype.setTileByPosition = function(coordX, coordY, tile) {
	this.tileMatrix[coordY][coordX] = tile;
};