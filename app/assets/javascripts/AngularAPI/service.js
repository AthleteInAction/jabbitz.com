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
App.service('API',['BlankSVC','SocialSVC','ChimeSVC','UserSVC',function(BlankSVC,SocialSVC,ChimeSVC,UserSVC){

	// INSERT HERE
	this.socials = SocialSVC.socials;
	this.chimes = ChimeSVC.chimes;
	this.users = UserSVC.users;

}]);
// Placemarker
App.service('BlankSVC',[function(){}]);
// ======================================================================
// ======================================================================