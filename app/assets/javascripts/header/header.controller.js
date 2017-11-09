(function(){

'use strict';

angular.module('GeoBox')
.controller('HeaderController', HeaderController);

HeaderController.$inject = ['$scope']; 
function HeaderController($scope){
	var $ctrl = this;
	$ctrl.logged_in = false;
	$ctrl.is_admin = false;

	$scope.$on('login:login', function(e, args){
		$ctrl.logged_in = true;
	});

	$scope.$on('login:admin', function(e, args){
		$ctrl.is_admin = true;
	});

	$ctrl.onLogout = function(){
		$ctrl.logged_in = false;
		$ctrl.is_admin = false;
	}
}

})();