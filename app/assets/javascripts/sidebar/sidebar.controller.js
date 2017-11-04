(function(){

'use strict';

angular.module('GeoBox')
.controller('SidebarController', SidebarController);

SidebarController.$inject = ['$rootScope', 'DocumentService', '$scope'];
function SidebarController($rootScope, DocumentService, $scope){
	var $ctrl = this;
	$ctrl.docs = {};


	$ctrl.$onInit = function(){
		$rootScope.$broadcast('login:login', {}); // we can consider adding data to this event
		var sidebar = $('#sidebar').sidebar();
	}

	$ctrl.getDocs = function(e,d){
		// console.log("from sidebar controller:   ", DocumentService.docs)
		$ctrl.docs = DocumentService.docs;
	}

	$scope.$on('documents:ready', $ctrl.getDocs);

}

// var app = angular.module('myApp', []);
// app.controller('myCtrl', function() {
// 		var $ctrl = this;
// 		$ctrl.firstName = "John";
// 		$ctrl.lastName = "Doe";
// //    $scope.firstName= "John";
// //    $scope.lastName= "Doe";
// });

})();
