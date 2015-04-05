var
	map_toggle_button = document.getElementById('map-toggle-button'), 
	rama = $('#rama-canvas'),
	thumb_height = 79,
	google_terms_height = 13;
	canvas = document.getElementById( 'canvas' ),
	menu_title = document.getElementById('menu-title'),
	menu_title_height = menu_title.clientHeight,
	menu_toggle_button = document.getElementById('menu-toggle-button');


function ScaleMenu() {
	var 
		right_menu = $('#right-menu'),
		bodyWidth = document.body.clientWidth,
  	bodyHeight = document.body.clientHeight;

	// set the top of menu
	right_menu.css('top', menu_title_height);
	
	// if menu is closed
	if (classie.has(right_menu[0], 'closed')) {
		// set zero menu height
		right_menu.height(0);
	}
	// if menu is opened and photos are opened
	else if (classie.has( canvas, 'photos' )) {
		// set menu height for photos canvas
  	right_menu.height(bodyHeight - thumb_height - menu_title_height);
	}
	// if menu is opened and map is opened
	else {
		// set menu height for map canvas
		right_menu.height(bodyHeight - google_terms_height - menu_title_height);
	}
	// when the animation is over - refresh the scrollbar (dependent on height of menu)
	setTimeout(function() {right_menu.nanoScroller()}, 600);
}	  
	 
function toggleMap() {
	// can be slideToggle or fadeToggle

	if (rama.is(":hidden")) {
		map_toggle_button.innerHTML="Map";
		classie.add (canvas, "photos");
	}
	else {
		map_toggle_button.innerHTML="Photos";
		classie.remove (canvas, "photos");
	}
	
	rama.toggle('slow');
	ScaleMenu();
}

function toggleMenu() {
	var 
		right_menu = document.getElementById('right-menu');
		
	// if right_menu is closed
	if (classie.has(right_menu, 'closed')) {
	  classie.remove(right_menu, 'closed');
		classie.remove(menu_title, 'closed');
	  classie.add(menu_toggle_button, 'menu-open');
	} 
	// if right_menu is open
	else {
	  classie.add(right_menu, 'closed');
	  classie.add(menu_title, 'closed');
	  classie.remove(menu_toggle_button, 'menu-open');
	}
	
	ScaleMenu();
}


$(window).bind("load", ScaleMenu);
$(window).bind("resize", ScaleMenu);
$(window).bind("orientationchange", ScaleMenu);

map_toggle_button.onclick = toggleMap;
menu_toggle_button.onclick = toggleMenu;




	
	