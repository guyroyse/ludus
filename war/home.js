var view = {
	showSignIn : function() {
		$('#sign-in').show();				
	},
	showWelcomeBack : function() {
		$('#welcome-back').show();		
	},
	hideSignIn : function() {
		$('#sign-in').hide();		
	},
	hideWelcomeBack : function() {
		$('#welcome-back').hide();
	},
	setLogoutUrl : function(url) {
		$('#logout').attr('href', url);
	},
	addLoginProvider : function(url, image, name) {
		var providers = $('#openid-providers');
		var li = $('<li/>');
		var a = $('<a/>)').attr('href', url);
		var img = $('<img/>').attr('src', 'logos/' + image).attr('alt', name);
		a.append(img);
		li.append(a);
		providers.append(li);
	}
};

var controller = {
	onLoad : function() {
		view.hideSignIn();
		view.hideWelcomeBack();
		$.get('/public/api/current-user', function(currentUser) {
			if (currentUser.loggedIn) {
				$.get('/api/logout-url', function(logoutData) {
					view.setLogoutUrl(logoutData.url);
					view.showWelcomeBack();
				});
			} else {
				$.get('/public/api/login-urls', function(loginProviders) {
					loginProviders.forEach(function(provider) {
						view.addLoginProvider(provider.url, provider.image, provider.name);
					});
					view.showSignIn();
				});
			};
		});
	}
};

var proxy = {
		
};

$(function() { controller.onLoad(); });