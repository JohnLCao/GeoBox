(function(){

'use strict';

angular.module('GeoBox')
.controller('SidebarController', SidebarController);

<<<<<<< HEAD
SidebarController.$inject = ['$http', '$rootScope'];
function SidebarController($http, $rootScope){
=======
SidebarController.$inject = ['$rootScope', 'DocumentService']; 
function SidebarController($rootScope, DocumentService){
>>>>>>> aa41f094b67ada0bbc134f9e8d96abc8f606dca9
	var $ctrl = this;
 
	$ctrl.$onInit = function(){
		$rootScope.$broadcast('login:login', {}); // we can consider adding data to this event
		var sidebar = $('#sidebar').sidebar();
	}
}

var app = angular.module('myApp', []);

app.controller('myCtrl', [function($scope) {
    $scope.firstName= "John";
    $scope.lastName= "Doe";
}]);

})();
