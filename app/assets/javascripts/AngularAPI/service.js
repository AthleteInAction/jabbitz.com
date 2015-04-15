// GET CSRF-Token
// ======================================================================
// ======================================================================
var csrf;
App.config(['$httpProvider',function($httpProvider){
		$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
		csrf = $('meta[name=csrf-token]').attr('content');
	}
]);
// ======================================================================
// ======================================================================


// API
// ======================================================================
// ======================================================================
App.service('API',['BlankSVC','SocialSVC','UserSVC',function(BlankSVC,SocialSVC,UserSVC){

	// INSERT HERE
	this.socials = SocialSVC.socials;
	this.users = UserSVC.users;

}]);
App.service('BlankSVC',[function(){}]);
// ======================================================================
// ======================================================================