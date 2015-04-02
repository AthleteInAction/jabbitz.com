// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// SPLASH !!!!!!! SPLASH !!!!!!! SPLASH !!!!!!! SPLASH !!!!!!! SPLASH !!!!!!! SPLASH !!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var Ctrl = ['$scope','$routeParams','$location','$timeout','$interval','API','$window',
	function($scope,$routeParams,$location,$timeout,$interval,API,$window){

		var scope = $scope;

		scope.months = months;
		scope.days = days;

		JP('SPLASH');

		scope.$watch('signup',function(a,b,c){

			scope.validateSignup();

		},true);

		scope.signup = {};
		scope.validators = {
			clean: true,
			name: {
				r: /^.{1,50}$/,
				m: 'Name must be bewteen 1 and 50 characters.',
				v: function(value){return this.r.test(value);},
				z: false
			},
			email: {
				r: emailValidate,
				m: 'Invalid email address.',
				v: function(value){return this.r.test(value);},
				z: false
			},
			password: {
				r: /^.{6,20}$/,
				m: 'Password must be bewteen 6 and 20 characters.',
				v: function(value){return this.r.test(value);},
				z: false
			},
			gender: {
				r: /^male$|^female$/i,
				m: 'Please select a gender.',
				v: function(value){return this.r.test(value);},
				z: false
			},
			birth_month: {
				r: /^.{1,}$/,
				m: 'Please select birthdate month.',
				v: function(value){return this.r.test(value);},
				z: false
			},
			birth_date: {
				r: /^.{1,}$/,
				m: 'Please select birthdate day.',
				v: function(value){return this.r.test(value);},
				z: false
			},
			birth_year: {
				r: /^.{1,}$/,
				m: 'Please select birthdate year.',
				v: function(value){return this.r.test(value);},
				z: false
			}
		};

		scope.validators.name.v();

		scope.validateSignup = function(){

			if (scope.validators.submitted){

			} else {
				return false;
			}

			JP('VALIDATE');

			scope.validators.clean = true;

			angular.forEach(scope.validators,function(val,key){

				var item = scope.signup[key] || '';

				if (key != 'submitted' && key != 'clean'){val.e = !val.v(item);}

				if (val.e){scope.validators.clean = false;}

			});

		};

		scope.submitSignup = function(){

			scope.validators.submitted = true;
			scope.validateSignup();

			if (!scope.validators.clean){
				return false;
			}
			JP('SUBMIT');
			$('#hidden-signup-form').submit();

		};

	}
];