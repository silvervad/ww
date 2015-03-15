function toggleMap() {
	var rama = $("#rama-canvas"), 
		button = $("#map-toggle-button");
		
	// can be slideToggle or fadeToggle

	if (rama.is(":hidden")) {
		button.html("Map");
	}
	else {
		button.html("Photos");
	}
	
	rama.toggle('slow');
	
	
	/*if ( classie.has ( container, "menu-closed")) {
		classie.remove (container, "menu-closed");
	}
	else{
		classie.add (container, "menu-closed");
	}*/
}