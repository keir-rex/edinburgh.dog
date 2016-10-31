$(document).ready(function () {
	var currentPath = location.pathname;
    $('ul.nav > li').each(function() {
    	$(this).children().each(function() {
    		if (isActivePage(currentPath, $(this).attr('href'))) {
    			$(this).parent().addClass('active');
    		}
    	});
    });
});

function isActivePage(path, href) {
	if (path === href) {
		return true;
	}
	else {
		return false;
	}
}