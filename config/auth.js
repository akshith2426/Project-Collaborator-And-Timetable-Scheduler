module.exports = {
	isLoggedIn: function(req, res, next) {
		// if user is authenticated in the session, carry on
		if (req.isAuthenticated()) return next();

		// if they aren't redirect them to the home page
		res.redirect('/welcome');
	}
	// forwardAuthenticated1: function(req, res, next) {
	// 	if (!req.isAuthenticated()) {
	// 		return next();
	// 	}
	// 	res.redirect('/Client_Dashboard');
	// }
};
