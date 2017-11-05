(function(){

'use strict';

angular.module('GeoBox')
.controller('SidebarController', SidebarController);

SidebarController.$inject = ['$rootScope', 'DocumentService'];
function SidebarController($rootScope, DocumentService){
	var $ctrl = this;
	$ctrl.docs = {};


	$ctrl.$onInit = function(){
		$rootScope.$broadcast('login:login', {}); // we can consider adding data to this event
		var sidebar = $('#sidebar').sidebar();
	}

	$ctrl.getDocs = function(){
		$ctrl.docs = DocumentService.docs;	
	}
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
