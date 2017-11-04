(function(){

'use strict';

angular.module('GeoBox')
.service('DocumentService', DocumentService);

DocumentService.$inject = [] //$resources or $http would likely go here.
function DocumentService(){
	var service = this;
}

})();