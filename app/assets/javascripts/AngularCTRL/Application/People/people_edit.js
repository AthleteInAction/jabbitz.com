var PeopleEditCtrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window','$upload',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window,$upload){

		var scope = $scope;

		scope.params = $routeParams;

		JP('PEOPLEEDIT');

		if (scope.params.id == scope.$parent.current_user.id){
			window.location = '#/myaccount';
		}

		scope.getUser = function(){

			scope.$parent.users.find(scope.params.id,function(user,error){

				if (!error){
					if (user.author_id != scope.$parent.current_user.id || !user.floating){
						window.location = '#/people';
					}
					scope.user = API.users.new(user);
					scope.socials = API.socials;
					scope.socials.get({user_id: scope.user.id});
					scope.new_social = API.socials.new({user_id: scope.user.id});
				} else {
					window.location = '#/people';
				}

			});

		};
		scope.getUser();

		scope.saveSocial = function(){

			if (scope.new_social_form.$valid){

				scope.new_social.save(function(data,error){

					if (!error){

						scope.new_social = API.socials.new({user_id: scope.user.id});

					}

				});

			} else {

				JP('INVALID');

			}

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
						url: '/api/v1/users/'+scope.user.id+'.json',
						file: file
					}).progress(function (evt) {
						
						var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
						scope.upload_pct = progressPercentage

					}).success(function (data,status,headers,config) {
						
						scope.user.image = data.user.image;

						delete scope.upload_pct;

					}).error(function(){

						delete scope.upload_pct;

					});
				}
			}
		};
        // =====================================================================
        // =====================================================================

        scope.socialType = function(type){

        	if (type == 'facebook'){
        		scope.new_social.profile = 'http://www.facebook.com/';
        		return true;
        	}
        	if (type == 'instagram'){
        		scope.new_social.profile = 'http://www.instagram.com/';
        		return true;
        	}
        	if (type == 'pinterest'){
        		scope.new_social.profile = 'http://www.pinterest.com/';
        		return true;
        	}
        	if (type == 'twitter'){
        		scope.new_social.profile = 'http://www.twitter.com/';
        		return true;
        	}

        	if (
        		type == 'match'
        		||
        		type == 'tinder'
        	){
        		scope.new_social.profile = null;
        		return false;
        	}

        	return false;

        };
        scope.focusTXT = function(){

        	$timeout(function(){
        		$('.socialTXT').focus();
        	},100);

        };

	}
];