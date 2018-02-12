var Mechanic = function(tileMap){
	this.tileMap = tileMap;
}

Mechanic.prototype.setTileMap = function(tileMap) {
	this.tileMap = tileMap;
};

Mechanic.prototype.moveUp = function(tileSelected) {
	var coordX = tileSelected.getCoordX();
	var coordY = tileSelected.getCoordY();
	var tileUp = this.tileMap.getTileByPosition(coordX, coordY - 1);

	if( (tileUp.getTileProperties() == "passable") && (tileSelected.getTileProperties() == "player") ){
		tileSelected.clearTile();
		tileUp.clearTile();

		tileSelected.upY();
		tileUp.downY();

		this.tileMap.setTileByPosition(coordX, coordY, tileUp);
		this.tileMap.setTileByPosition(coordX, coordY - 1, tileSelected);

		tileUp.drawTile();
		tileSelected.drawTile();
	}
}

Mechanic.prototype.moveDown = function(tileSelected) {
	var coordX = tileSelected.getCoordX();
	var coordY = tileSelected.getCoordY();
	var tileUp = this.tileMap.getTileByPosition(coordX, coordY + 1);

	if( (tileUp.getTileProperties() == "passable") && (tileSelected.getTileProperties() == "player") ){
		tileSelected.clearTile();
		tileUp.clearTile();

		tileSelected.downY();
		tileUp.upY();

		this.tileMap.setTileByPosition(coordX, coordY, tileUp);
		this.tileMap.setTileByPosition(coordX, coordY + 1, tileSelected);

		tileUp.drawTile();
		tileSelected.drawTile();
	}
}

Mechanic.prototype.moveLeft = function(tileSelected) {
	var coordX = tileSelected.getCoordX();
	var coordY = tileSelected.getCoordY();
	var tileUp = this.tileMap.getTileByPosition(coordX - 1, coordY);

	if( (tileUp.getTileProperties() == "passable") && (tileSelected.getTileProperties() == "player") ){
		tileSelected.clearTile();
		tileUp.clearTile();

		tileSelected.downX();
		tileUp.upX();

		this.tileMap.setTileByPosition(coordX, coordY, tileUp);
		this.tileMap.setTileByPosition(coordX - 1, coordY, tileSelected);

		tileUp.drawTile();
		tileSelected.drawTile();
	}
}

Mechanic.prototype.moveRight = function(tileSelected) {
	var coordX = tileSelected.getCoordX();
	var coordY = tileSelected.getCoordY();
	var tileUp = this.tileMap.getTileByPosition(coordX + 1, coordY);

	if( (tileUp.getTileProperties() == "passable") && (tileSelected.getTileProperties() == "player") ){
		tileSelected.clearTile();
		tileUp.clearTile();

		tileSelected.upX();
		tileUp.downX();

		this.tileMap.setTileByPosition(coordX, coordY, tileUp);
		this.tileMap.setTileByPosition(coordX + 1, coordY, tileSelected);

		tileUp.drawTile();
		tileSelected.drawTile();
	}
}