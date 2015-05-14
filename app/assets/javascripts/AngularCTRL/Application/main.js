var App = angular.module('App',['APIModule','ngRoute','ngResource','ngSanitize','ui.bootstrap','angularFileUpload']);
App.value('$anchorScroll',angular.noop);
App.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){

	// html5Mode: true;

	$routeProvider
	/* MARKER */  	
	.when('/people/:id/edit',{

		templateUrl : '/angularjs/templates/people_edit.html',
		controller: PeopleEditCtrl

	})
  	
	.when('/people/:id',{

		templateUrl : '/angularjs/templates/people_show.html',
		controller: PeopleShowCtrl

	})
  	
	.when('/people',{

		templateUrl : '/angularjs/templates/people.html',
		controller: PeopleCtrl

	})
  	
	.when('/myaccount',{

		templateUrl : '/angularjs/templates/myaccount.html',
		controller: MyaccountCtrl

	})

	.otherwise({
		
		redirectTo: '/myaccount'

	});
	
}]);