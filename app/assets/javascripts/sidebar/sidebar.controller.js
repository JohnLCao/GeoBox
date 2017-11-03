(function(){

'use strict';

angular.module('GeoBox')
.controller('SidebarController', SidebarController);

SidebarController.$inject = ['$http', '$rootScope'];
function SidebarController($http, $rootScope){
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
