var MyaccountCtrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window','$upload',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window,$upload){

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

		// UPLOADER
		// =====================================================================
		// =====================================================================
		$scope.upload = function (files) {
			if (files && files.length) {
				scope.upload_pct = 1;
				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					$upload.upload({
						url: '/api/v1/users/'+scope.$parent.current_user.id+'.json',
						fields: {'username': $scope.username},
						file: file
					}).progress(function (evt) {
						
						var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
						scope.upload_pct = progressPercentage

					}).success(function (data,status,headers,config) {
						
						scope.$parent.current_user.image = data.user.image.image

						delete scope.upload_pct;

					}).error(function(){

						delete scope.upload_pct;

					});
				}
			}
		};
        // =====================================================================
        // =====================================================================

		JP('MYACCOUNT');

	}
];