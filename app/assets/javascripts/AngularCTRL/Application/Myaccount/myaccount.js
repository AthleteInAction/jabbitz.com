var MyaccountCtrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window){

		var scope = $scope;

		scope.params = $routeParams;

		scope.socials = API.socials;
		scope.socials.get();
		scope.new_social = API.socials.new({user_id: scope.$parent.current_user.id});

		scope.saveSocial = function(){

			scope.new_social.save(function(data,error){

				if (!error){

					scope.new_social = API.socials.new({user_id: scope.$parent.current_user.id});

				}

			});

		};

		JP('MYACCOUNT');

	}
];