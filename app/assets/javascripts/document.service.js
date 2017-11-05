(function(){

'use strict';

angular.module('GeoBox')
.service('DocumentService', DocumentService)
.constant('DevBaseUrl', 'http://localhost:3000');

DocumentService.$inject = ['$http', 'DevBaseUrl', '$rootScope'] //$resources or $http would likely go here.
function DocumentService($http, DevBaseUrl, $rootScope){
	var doc_service = this;
	doc_service.docs = {};

	doc_service.getDocs = function(){
		$http({
			method: 'GET',
			url: DevBaseUrl + '/get_docs',
		})
		.then(function(response){
			doc_service.docs = response.data;
			$rootScope.$broadcast('documents:ready');
		})
		.catch(function(error){
			console.log(error);
		})
	}



	doc_service.sendLoc = function(browser_lat, browser_lng){
		return $http({
			method: 'POST',
			url: DevBaseUrl + '/set_location',
			params: {
				lat: browser_lat,
				lng: browser_lng
			}
		})
		.then(function(response){
			doc_service.getDocs();
		})
		.catch(function(error){
			console.log(error);
		})
	}

	doc_service.setCurrentLocation = function(lat, lng){
		doc_service.loc.lat = lat;
		doc_service.loc.lng = lng;
	}
}

})();
