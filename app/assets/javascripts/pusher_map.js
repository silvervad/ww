function toggleMap() {
	var rama = document.getElementById("rama-canvas"), 
		button = document.getElementById("map-toggle-button");

	if (rama.style.visibility == "hidden") {
		rama.style.visibility = "visible";
		button.innerHTML="Map";
	}
	else {
		rama.style.visibility = "hidden";
		button.innerHTML="Photos";
	}
	/*if ( classie.has ( container, "menu-closed")) {
		classie.remove (container, "menu-closed");
	}
	else{
		classie.add (container, "menu-closed");
	}*/
}