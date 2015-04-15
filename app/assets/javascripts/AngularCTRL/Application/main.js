var App = angular.module('App',['ngRoute','ngResource','ngSanitize','ui.bootstrap','angularFileUpload']);
App.value('$anchorScroll',angular.noop);
App.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){

	// html5Mode: true;

	$routeProvider
	/* MARKER */  	
	.when('/myaccount',{

		templateUrl : '/angularjs/templates/myaccount.html',
		controller: MyaccountCtrl

	})

	.otherwise({
		
		redirectTo: '/myaccount'

	});
	
}]);