
function changeLogo(){
	var container = document.getElementById("st-container");
	if ( classie.has ( container, "st-menu-open")) {
		classie.remove (container, "st-menu-open");
	}
	else{
		classie.add (container, "st-menu-open");
	}
}

function toggleMenu(){
	var container = document.getElementById("rama-wrap");
	if ( classie.has ( container, "rama-wrap")) {
		classie.remove (container, "rama-wrap");
		classie.add (container, "rama-wrap-menu")
	}
	else{
		classie.remove (container, "rama-wrap-menu");
		classie.add (container, "rama-wrap");
	}
}