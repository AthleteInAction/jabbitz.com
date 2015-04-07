// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// APPLICATION !!!!!!! APPLICATION !!!!!!! APPLICATION !!!!!!! APPLICATION !!!!!!! APPLICATION !!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var Ctrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window){

		var scope = $scope;

		scope.current_user = API.users.new(current_user);
		// setTimeout(function(){
		// 	scope.current_user.save();
		// },1000);

		scope.location = $location.path().split('/');

		JP('APPLICATION');

	}
];