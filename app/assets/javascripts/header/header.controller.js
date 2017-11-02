(function(){

'use strict';

angular.module('GeoBox')
.controller('HeaderController', HeaderController);

HeaderController.$inject = ['$http', '$scope']; 
function HeaderController($http, '$scope'){
	var $ctrl = this;
	$ctrl.logged_in = false;
}

})();