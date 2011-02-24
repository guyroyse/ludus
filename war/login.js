$(function() {
	var providers = $('#providers'); 
	$.get('/public/api/login-urls', function(data) {
		data.data.forEach(function(item) {
			var li = $('<li/>');
			var a = $('<a/>)').text(item.name).attr('href', item.url);
			li.append(a);
			providers.append(li);
		});
	});
});