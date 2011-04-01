$(function() {
	$.get('/api/logout-url', function(logoutData) {
		$('#logout').attr('href', logoutData.url);
	});
});

var ludus_test = 42;