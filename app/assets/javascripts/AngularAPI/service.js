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
App.service('API',['BlankSVC','ChimeSVC','SocialSVC','UserSVC',function(BlankSVC,ChimeSVC,SocialSVC,UserSVC){

	// INSERT HERE
	this.chimes = ChimeSVC.chimes;
	this.socials = SocialSVC.socials;
	this.users = UserSVC.users;

}]);
// Placemarker
App.service('BlankSVC',[function(){}]);
// ======================================================================
// ======================================================================