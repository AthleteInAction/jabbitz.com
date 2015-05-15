var AdminUsersCtrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window){

		var scope = $scope;

		scope.params = $routeParams;

		scope.users = API.users;

		scope.sort = {
			access: true
		};
		scope.sortVal = '-access';

		scope.search = {limit: 30,order: scope.sortVal+',id'};

		scope.sortUsers = function(s){

			var dir = scope.sort[s];

			if (dir){
				scope.sortVal = '-'+s;
			} else {
				scope.sortVal = s;
			}

			scope.getUsers();

		};

		scope.getUsers = function(){

			if (scope.search.ids && scope.search.ids != ''){
				scope.users.get({ids: scope.search.ids});
				return false;
			}

			var s = angular.copy(scope.search);

			angular.forEach(s,function(val,key){

				if (key != 'limit' && key != 'order' && key != 'ids'){

					s[key] = '*'+val+'*';

				}

			});

			scope.users.get(s);

		};
		scope.getUsers();

		scope.searchUsers = function(){

			scope.search.limit = 30;
			scope.search.order = scope.sortVal+',id';
			scope.getUsers();

		};

		JP('ADMINUSERS');

	}
];