$(function() {
	$('#banner').load('/banner.html');
	$('#navbar').load('/navbar.html');
	$('#home').click(function() {
		window.location.pathname = '/index.html';
	});	
});