(function(){

'use strict';

angular.module('GeoBox')
.controller('ExampleController', ExampleController);

ExampleController.$inject = []; //nothing yet. Services and other components go here
function ExampleController(){
	var $ctrl = this;
	$ctrl.onClick = function(){
		alert("I am an example in angular!!");
	}
}

})();