(function($) {
	var flash_it = function(message, classname) {
		var link_class = 'hide_'+classname;
		var error = $('.'+classname);
		var element = error[0];
		element.innerHTML='';
		element.innerHTML='<li>'+message+' <a href="#" class="'+link_class+'">hide</a></li>';
		error.fadeIn('slow');
		setTimeout("$('a."+link_class+"').click(function() {$('."+classname+"').fadeOut('slow')})",0)
		setTimeout("$('."+classname+"').click(function() {$('."+classname+"').fadeOut('slow')})",0)
	}
	$.flash_error = function(message) {
		flash_it(message, 'flash-error');
	}
	$.flash_notice = function(message) {
		flash_it(message, 'flash-notice');
	}
})(jQuery);
