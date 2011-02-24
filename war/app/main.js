$(function() {
	$.get('/api/logout-url', function(data) {
		$('#logout').attr('href', data.data);
	});
});