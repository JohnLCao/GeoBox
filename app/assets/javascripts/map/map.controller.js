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

      $ctrl.handler = Gmaps.build('Google', {builders: {Marker: RichMarkerBuilder}});

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
	}, 2500); // currently updates every 2.5 seconds

	$ctrl.$onDestroy = function(){
		$interval.cancel($ctrl.locUpdater);
	};

	function updateLocation(){
		if(navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(displayOnMapWithSend);
		}
	}

	function updateMarkers(e,data){
		$ctrl.doc_markers = [];
		DocumentService.docs.forEach(function(doc){
			var new_marker = $ctrl.handler.addMarker({
				lat: Number(doc.latitude),
				lng: Number(doc.longitude),
				marker: "<img src='images/file.png' width='35' height='35'>"
			});
			$ctrl.doc_markers.push(new_marker);
		});

		stripMarkerShadow();
	}

	function stripMarkerShadow(){
		if ($('.marker_container').length != DocumentService.docs.length + 1){
			setTimeout(stripMarkerShadow, 100);
		}
		else {
			$('.marker_container').parent().parent().css('box-shadow', 'none');
		}
	}

	function displayOnMapWithSend(position){
        $ctrl.user_marker = $ctrl.handler.addMarker({
            lat: position.coords.latitude,
            lng: position.coords.longitude,
            marker: "<img src='images/user.png' width='50' height= '50'>"
        });
        $ctrl.handler.map.centerOn($ctrl.user_marker);
		DocumentService.updateLocation(position.coords.latitude.toString(), position.coords.longitude.toString());
  	}

	class RichMarkerBuilder extends Gmaps.Google.Builders.Marker { //inherit from builtin builder
	  //override create_marker method
	  create_marker() {
	    const options = _.extend(this.marker_options(), this.rich_marker_options());
	    return this.serviceObject = new RichMarker(options); //assign marker to @serviceObject
	  }

	  rich_marker_options() {
	    const marker = document.createElement("div");
	    marker.setAttribute('class', 'marker_container');
	    marker.innerHTML = this.args.marker;
	    return { content: marker };
	  }
	}
}

})();
