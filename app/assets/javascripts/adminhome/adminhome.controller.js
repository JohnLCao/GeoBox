(function(){

'use strict';

angular.module('GeoBox')
.controller('AdminHomeController', AdminHomeController);

AdminHomeController.$inject = ['$http', '$rootScope']; 
function AdminHomeController($http, $rootScope){
	var $ctrl = this;

	$ctrl.$onInit = function(){
		$rootScope.$broadcast('login:login', {}); // we can consider adding data to this event
	}
}

})();