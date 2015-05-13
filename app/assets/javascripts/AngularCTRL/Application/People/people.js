var PeopleCtrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window){

		var scope = $scope;

		scope.params = $routeParams;

		if (scope.params.name && scope.params.name != ''){

			scope.$parent.search.name = scope.params.name;
			scope.$parent.searchUsers();

		}

		JP('PEOPLE');

	}
];