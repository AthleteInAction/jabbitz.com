var AdminApp = angular.module('AdminApp',['APIModule','ngRoute','ngResource','ngSanitize','ui.bootstrap','angularFileUpload']);
AdminApp.value('$anchorScroll',angular.noop);
AdminApp.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){

	// html5Mode: true;

	$routeProvider
	/* MARKER */  	
	.when('/chimes',{

		templateUrl : '/angularjs/templates/admin_chimes.html',
		controller: AdminChimesCtrl

	})

	.otherwise({
		
		redirectTo: '/chimes'

	});
	
}]);