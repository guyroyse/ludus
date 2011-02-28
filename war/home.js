$(function() { 

	var view = (function() {
		
		var providers = $('#openid-providers');
	
		return {
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
			setUsername : function(name) {
				$('#username').text(name);
			},
			addLoginProvider : function(url, image, name) {
				var li = $('<li/>');
				var a = $('<a/>)').attr('href', url).attr('id', name);
				var img = $('<img/>').attr('src', image).attr('alt', name);
				a.append(img);
				li.append(a);
				providers.append(li);
			}
		};
	
	})();
	
	var proxy = {
		fetchCurrentUser : function(callback) {
			$.get('/public/api/current-user', callback);
		},
		fetchLogoutUrl : function(callback) {
			$.get('/api/logout-url', callback);
		},
		fetchLoginUrls : function(callback) {
			$.get('/public/api/login-urls', callback);
		}
	};
	
	var controller = (function() {
		
		var hidePanels = function() {
			view.hideSignIn();
			view.hideWelcomeBack();
		};
		
		var setupPanels = function() {
			setupWelcomeBackPanel();
			setupSignInPanel();			
		};

		var setupSignInPanel = function() {
			proxy.fetchLoginUrls(function(loginProviders) {
				loginProviders.forEach(function(provider) {
					view.addLoginProvider(provider.url, '/logos/' + provider.image, provider.name);
				});
			});
		};
		
		var setupWelcomeBackPanel = function() {
			proxy.fetchLogoutUrl(function(logoutData) {
				view.setLogoutUrl(logoutData.url);
			});
		};
		
		var showCorrectPanel = function() {
			proxy.fetchCurrentUser(function(currentUser) {
				if (currentUser.loggedIn) {
					view.setUsername(currentUser.name);
					view.showWelcomeBack();
				} else {
					view.showSignIn();
				};
			});
		}; 
		
		return {
			onLoad : function() {
				hidePanels();
				setupPanels();
				showCorrectPanel();
			}
		};
		
	})();

	controller.onLoad(); 

});