module.exports = {
	isLoggedIn: function(req, res, next) {
		// if user is authenticated in the session, carry on
		if (req.isAuthenticated()) return next();

		// if they aren't redirect them to the home page
		res.redirect('/login');
	},
	forwardAuthenticated: function(req, res, next) {
		if (!req.isAuthenticated()) {
			return next();
		}
		res.redirect('/dashboard');
	}
};
