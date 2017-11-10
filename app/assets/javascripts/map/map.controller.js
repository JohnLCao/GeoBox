(function(){

'use strict';

angular.module('GeoBox')
.controller('MapController', MapController);

MapController.$inject = ['DocumentService', '$scope', '$interval'];
function MapController(DocumentService, $scope, $interval){
	var $ctrl = this;
	$ctrl.doc_markers = [];
	$ctrl.user_marker = [];

	$ctrl.$onInit = function(){
      var hours = (new Date()).getHours();
      var mapStyle;

      if (hours > 6 && hours < 20) {
        mapStyle = 'assets/retroMode.js';
      } else {
        mapStyle = 'assets/nightMode.js';
      }

      $ctrl.handler = Gmaps.build('Google');

      $.get(mapStyle, function(data){
          if (data) {
              var style = JSON.parse(data);
              $ctrl.handler.buildMap({ internal: {id: 'geolocation'}, provider:{
                  zoom: 19,
                  styles: style,
                  heading: 90,
                  streetViewControl: false,
                  fullscreenControl: false
              }}, updateLocation);
          }
      });
	};

	$scope.$on('documents:ready', updateMarkers);

	$ctrl.locUpdater = $interval(function(){
		if ($ctrl.handler){	
			$ctrl.handler.removeMarkers($ctrl.doc_markers.concat($ctrl.user_marker));		
			updateLocation();
		}
	}, 10000); // currently updates every 10 seconds

	$ctrl.$onDestroy = function(){
		$interval.cancel($ctrl.locUpdater);
	};

	function updateLocation(){
		if(navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(displayMapCallback);
		}
	}

	function updateMarkers(e,data){
		$ctrl.doc_markers = [];
		DocumentService.docs.forEach(function(doc){
			var new_marker = $ctrl.handler.addMarker({
				lat: Number(doc.latitude),
				lng: Number(doc.longitude),
				picture: {
					url: 'assets/file.png',
					width: 45,
					height: 45
				},
				infowindow: doc.description
			});
			$ctrl.doc_markers.push(new_marker);
		});
	}

	function displayMapCallback(position){
        $ctrl.user_marker = $ctrl.handler.addMarker({
            lat: position.coords.latitude,
            lng: position.coords.longitude,
            picture: {
            	url: 'assets/user.png', 
            	width: 60, 
            	height: 60
            }
        });
        $ctrl.handler.map.centerOn($ctrl.user_marker);
		DocumentService.updateLocation(position.coords.latitude.toString(), position.coords.longitude.toString());
  	}
}

})();
