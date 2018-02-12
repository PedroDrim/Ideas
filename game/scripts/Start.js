$( document ).ready(function() {

	var terrenoString = $("#terreno").text();
	$("#terreno").empty();

	var tileMap = new TileMap(terrenoString);
	var player = tileMap.getPlayer()[0];
	
	mechanic = new Mechanic(tileMap);

	$(document).keydown(function(e) {
		switch(e.which) {
	        case 37: // left
			 	mechanic.moveLeft(player);
	        break;

	        case 38: // up
	    		mechanic.moveUp(player);
	        break;

	        case 39: // right
				mechanic.moveRight(player);
	        break;

	        case 40: // down
				mechanic.moveDown(player);
	        break;

	        default: return; // exit this handler for other keys
	    }
	    e.preventDefault(); // prevent the default action (scroll / move caret)
	});

 	//012
 	//###0
 	//###1
 	//#*#2
});