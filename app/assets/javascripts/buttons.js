var
	rama = $('#rama-canvas'),
	thumb_height = 79,
	google_terms_height = 13;
	canvas = document.getElementById( 'canvas' ),
	nav_bar = document.getElementById('nav-bar'),
	button_toggle_map = document.getElementById('button-toggle-map'),
	button_toggle_info = document.getElementById('button-toggle-info'),
	button_toggle_nav = document.getElementById('button-toggle-nav')
	nav_text = document.getElementById('nav-text'),
	info_bar = document.getElementById('info-bar'),
	transitionEnd = transitionEndEventName();

function isMapClosed() {
	if (rama.is(":visible")) {
		console.log('map closed');
		return true;
	}
	else {
		console.log('map opened');
		return false;
	}
}

function closeMap() {
		classie.remove (button_toggle_map, "icon-image");
		classie.add (button_toggle_map, "icon-compass2");
		classie.add (canvas, "photos");
		button_toggle_map.title = "Map";
}

function openMap() {
		classie.remove (button_toggle_map, "icon-compass2")
		classie.add (button_toggle_map, "icon-image");
		classie.remove (canvas, "photos");
		button_toggle_map.title = "Photos";
}

function toggleMap() {
	if (isMapClosed()) {
		openMap();
		console.log('openMap');
	}
	else {
		closeMap();
		console.log('closeMap');
	}
	
	rama.toggle('slow');
	scaleInfo();
}

// info-bar
/////////////////

function isInfoClosed () {
	if (classie.has(nav_bar, 'info-closed')) {
		console.log('info-closed');
		return true;
	}
	else {
		console.log('info-opened');
		return false;
	}
}

function closeInfo() {
		classie.remove(nav_bar, 'info-opened');
		classie.add(nav_bar, 'info-closed');
		button_toggle_info.title = "Close Info";
	  classie.remove (button_toggle_info, "icon-circle-up");
		classie.add (button_toggle_info, "icon-circle-down");
		console.log('closeInfo');
}

function openInfo() {
		classie.remove(nav_bar, 'info-closed');
		classie.add(nav_bar, 'info-opened');
	  button_toggle_info.title = "Open Info";
	  classie.remove (button_toggle_info, "icon-circle-down");
		classie.add (button_toggle_info, "icon-circle-up");
		console.log('openInfo');
}

function toggleInfo() {
	if (isInfoClosed()) {
		openInfo();
	} 
	else {
		closeInfo();
	}
	
	scaleInfo();
}

function scaleInfo() {
	var 
		info_bar = $('#info-bar'),
		bodyWidth = document.body.clientWidth,
  	bodyHeight = document.body.clientHeight,
  	nav_bar_height = nav_bar.clientHeight;

	// set the top of menu (deprecated)
	//info_bar.css('top', nav_bar_height+10);
	
	// if menu is closed
	if (isInfoClosed()) {
		// set zero menu height
		info_bar.height(0);
	}
	// if menu is opened and photos are opened
	else if (classie.has( canvas, 'photos' )) {
		// set menu height for photos canvas
  	info_bar.height(bodyHeight - thumb_height - nav_bar_height);
	}
	// if menu is opened and map is opened
	else {
		// set menu height for map canvas
		info_bar.height(bodyHeight - google_terms_height - nav_bar_height);
	}
	// when the animation is over - refresh the scrollbar (dependent on height of menu)
	setTimeout(function() {info_bar.nanoScroller()}, 600);
	
	console.log('scale_menu');
}	  
	 
// nav-bar
//////////////////////

function isNavClosed() {
	if (classie.has(nav_bar, 'nav-closed')) {
		console.log('nav_closed');
		return true;
	}
	else {
		console.log('nav_opened');
		return false;
	}
}	 

function closeNav() {
		classie.add(nav_bar, 'nav-closed');
	  button_toggle_nav.title = "Open Navigation";
		classie.remove (button_toggle_nav, "icon-circle-right");
		classie.add (button_toggle_nav, "icon-circle-left");
	  setTimeout(function() {classie.add(nav_text, 'nav-closed')}, 100);
	  console.log('closeNav');
}

function openNav() {
		classie.remove(nav_bar, 'nav-closed');
		button_toggle_nav.title = "Close Navigation";
		classie.remove (button_toggle_nav, "icon-circle-left");
		classie.add (button_toggle_nav, "icon-circle-right");
		setTimeout(function() {classie.remove(nav_text, 'nav-closed')}, 400);
		console.log('openNav');
}

function toggleNav() {
	if (isNavClosed()) {
		openNav();
	}
	else {
		closeNav();
	}
}

// auxillary to decect end of transition event

function transitionEndEventName () {
    var i,
        undefined,
        el = document.createElement('div'),
        transitions = {
            'transition':'transitionend',
            'OTransition':'otransitionend',  // oTransitionEnd in very old Opera
            'MozTransition':'transitionend',
            'WebkitTransition':'webkitTransitionEnd'
        };

    for (i in transitions) {
        if (transitions.hasOwnProperty(i) && el.style[i] !== undefined) {
            return transitions[i];
        }
    }

}


// bindings 
//////////////////

$(window).bind("load", scaleInfo);
$(window).bind("resize", scaleInfo);
$(window).bind("orientationchange", scaleInfo);

button_toggle_map.onclick = toggleMap;
button_toggle_nav.onclick = toggleNav;

nav_bar.addEventListener(transitionEnd, scaleInfo, false);



	
	