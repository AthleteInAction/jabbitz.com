var AdminChimesCtrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window){

		var scope = $scope;

		scope.params = $routeParams;

		JP('ADMINCHIMES');

	}
];