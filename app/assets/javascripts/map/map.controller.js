(function(){

'use strict';

angular.module('GeoBox')
.controller('MapController', MapController);

MapController.$inject = ['DocumentService', '$scope'];
function MapController(DocumentService, $scope){
	var $ctrl = this;

	$ctrl.$onInit = function(){
	  var hours = (new Date()).getHours();
	  var mapStyle;

	  if (hours > 6 && hours < 20) {
	    mapStyle = [
	        {"featureType": "administrative", "stylers": [{"visibility": "off"}]},
	        {"featureType": "poi", "stylers": [{"visibility": "simplified"}]},
	        {"featureType": "road", "elementType": "labels", "stylers": [{"visibility": "simplified"}]},
	        {"featureType": "water", "stylers": [{"visibility": "simplified"}]},
	        {"featureType": "transit", "stylers": [{"visibility": "simplified"}]},
	        {"featureType": "landscape", "stylers": [{"visibility": "simplified"}]},
	        {"featureType": "road.highway", "stylers": [{"visibility": "off"}]},
	        {"featureType": "road.local", "stylers": [{"visibility": "on"}]},
	        {"featureType": "road.highway", "elementType": "geometry", "stylers": [{"visibility": "on"}]},
	        {"featureType": "water", "stylers": [{"color": "#84afa3"}, {"lightness": 52}]},
	        {"stylers": [{"saturation": -17}, {"gamma": 0.36}]},
	        {"featureType": "transit.line", "elementType": "geometry", "stylers": [{"color": "#3f518c"}]}
	    ];
	  } else {
	    mapStyle = [
	        {"stylers": [{"hue": "#ff1a00"}, {"invert_lightness": true}, {"saturation": -100}, {"lightness": 33}, {"gamma": 0.5}]},
	        {"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#2D333C"}]}
	    ]
	  }

	    $ctrl.handler = Gmaps.build('Google');
	    $ctrl.handler.buildMap({ internal: {id: 'geolocation'}, provider:{
	        zoom: 19,
	        styles: mapStyle,
	        heading: 90,
	        tilt: 45,
	        streetViewControl: false,
	        fullscreenControl: false
	    }}, function(){
	        // be aware chrome >= 50 requires https for geolocation to work
	        if(navigator.geolocation)
	            navigator.geolocation.getCurrentPosition(displayOnMapWithSend);
	    });
	}

	$scope.$on('documents:ready', function(e, data){
		DocumentService.docs.forEach(function(doc){
			var marker = $ctrl.handler.addMarker({
					lat: doc.latitude,
					lng: doc.longitude
			});
		})
	})

	function displayOnMapWithSend(position){
        var marker = $ctrl.handler.addMarker({
            lat: position.coords.latitude,
            lng: position.coords.longitude
        });
        $ctrl.handler.map.centerOn(marker);
				DocumentService.sendLoc(position.coords.latitude.toString(), position.coords.longitude.toString());
  }
}

})();
