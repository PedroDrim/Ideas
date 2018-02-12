// TEMPORARIO
var tileSet = [];
tileSet["#"] = {color: "#000000", properties: "block"};
tileSet["*"] = {color: "#FFFFFF", properties: "passable"};
tileSet["p"] = {color: "#FF0000", properties: "player"};
//-----------

var Tile = function(coordX, coordY, flag){
	this.coordX = coordX;
	this.coordY = coordY;
	this.properties = tileSet[flag].properties;
	this.color = tileSet[flag].color;

	var canvas = document.getElementById("tile");
	var context = canvas.getContext('2d');

	this.context = context;
}

Tile.prototype.getCoordX = function(){
	return(this.coordX);
}

Tile.prototype.getCoordY = function(){
	return(this.coordY);
}

Tile.prototype.upX = function(){
	this.coordX = this.coordX + 1;
}

Tile.prototype.upY = function(){
	this.coordY = this.coordY - 1;
}

Tile.prototype.downX = function(){
	this.coordX = this.coordX - 1;
}

Tile.prototype.downY = function(){
	this.coordY = this.coordY + 1;
}

Tile.prototype.getTileProperties = function(){
	return(this.properties);
}

Tile.prototype.drawTile = function(){   

    var startX = (0 + 32*this.coordX); 
    var startY = (0 + 32*this.coordY);

    // criamos o retangulo no plano passando os 4 vertices que o mesmo possui
    this.context.fillStyle = this.color;
	this.context.fillRect(startX, startY, 32, 32);
}

Tile.prototype.clearTile = function(){   

    var startX = (0 + 32*this.coordX); 
    var startY = (0 + 32*this.coordY);

    // criamos o retangulo no plano passando os 4 vertices que o mesmo possui
    this.context.clearRect(startX, startY, 32, 32);
}