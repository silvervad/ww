function toggleMenu(){
	var container = document.getElementById("spot-menu");
	if ( classie.has ( container, "menu-closed")) {
		classie.remove (container, "menu-closed");
	}
	else{
		classie.add (container, "menu-closed");
	}
}