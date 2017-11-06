(function(){

'use strict';

angular.module('GeoBox')
.controller('HeaderController', HeaderController);

HeaderController.$inject = ['$scope']; 
function HeaderController($scope){
	var $ctrl = this;
	$ctrl.logged_in = false;

	$scope.$on('login:login', function(e, args){
		$ctrl.logged_in = true;
	});

	$ctrl.onLogout = function(){
		$ctrl.logged_in = false;
	}
}

})();