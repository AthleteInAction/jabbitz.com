var AdminChimesCtrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window){

		var scope = $scope;

		scope.params = $routeParams;

		scope.chimes = API.chimes;

		scope.search = {limit: 20,order: '-flagged,-id',flagged: '>0'}

		scope.getChimes = function(){

			scope.search.page = 1;
			scope.chimes.get(scope.search);

		};
		scope.getChimes();

		JP('ADMINCHIMES');

		scope.deleteChime = function(chime){

			if (!confirm('Are you sure you want to delete this chime?\n\nID: '+chime.id)){
				return false;
			}

			chime.delete();

		};

		scope.resetFlagged = function(chime){

			if (!confirm('Are you sure you want to set this Chime\'s ('+chime.id+') flag count to 0?')){
				return false;
			}

			chime.update('flagged',0,function(){
				JP('DONE!');
			});

		};

		scope.flag = function(chime){

			chime.update('flagged','true',function(data,error){

				if (!error){
					scope.getChimes();
				}

			});

		};

		scope.greaterThan = function(val){
			return function(item){
				if (item['flagged'] > val){
					return true;
				} else {
					return false;
				}
			}
		};

	}
];