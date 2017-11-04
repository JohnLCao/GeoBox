(function(){

'use strict';

angular.module('GeoBox')
.service('DocumentService', DocumentService)
.constant('DevBaseUrl', 'http://localhost:3000');

DocumentService.$inject = ['$http', 'DevBaseUrl'] //$resources or $http would likely go here.
function DocumentService($http, DevBaseUrl){
	var doc_service = this;
	doc_service.docs = {};

	doc_service.getDocs = function(){

	}

	doc_service.sendLoc = function(browser_lat, browser_lng){
		$http({
			method: 'POST',
			url: DevBaseUrl + '/set_location',
			data: {
				user: {
					lat: browser_lat,
					lng: browser_lng
				}
			}
		})
		.then(function(response){
			doc_service.docs = response.data;
			console.log(doc_service.docs);
		})
		.catch(function(error){
			console.warn(error);
		})
	}

	doc_service.setCurrentLocation = function(lat, lng){
		doc_service.loc.lat = lat;
		doc_service.loc.lng = lng;
	}
}

})();
