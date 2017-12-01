(function(){

'use strict';

angular.module('GeoBox')
.constant('nightMode','[ \
        { \
            "featureType": "all", \
            "elementType": "labels.text.fill", \
            "stylers": [ \
                { \
                    "saturation": 36 \
                }, \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 40 \
                } \
            ] \
        }, \
        { \
            "featureType": "all", \
            "elementType": "labels.text.stroke", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 16 \
                } \
            ] \
        }, \
        { \
            "featureType": "all", \
            "elementType": "labels.icon", \
            "stylers": [ \
                { \
                    "visibility": "off" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative", \
            "elementType": "geometry.fill", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 20 \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative", \
            "elementType": "geometry.stroke", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 17 \
                }, \
                { \
                    "weight": 1.2 \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.province", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "color": "#ff8200" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.province", \
            "elementType": "geometry.fill", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "color": "#ff3800" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.province", \
            "elementType": "labels.text.fill", \
            "stylers": [ \
                { \
                    "color": "#ff6600" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.locality", \
            "elementType": "labels.text.fill", \
            "stylers": [ \
                { \
                    "color": "#d9d9d9" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.locality", \
            "elementType": "labels.text.stroke", \
            "stylers": [ \
                { \
                    "visibility": "off" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.neighborhood", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "color": "#ff5d00" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.neighborhood", \
            "elementType": "labels.text.stroke", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.land_parcel", \
            "elementType": "labels.text.fill", \
            "stylers": [ \
                { \
                    "color": "#ff0000" \
                } \
            ] \
        }, \
        { \
            "featureType": "landscape", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "color": "#161616" \
                }, \
                { \
                    "lightness": 20 \
                } \
            ] \
        }, \
        { \
            "featureType": "landscape.man_made", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "color": "#393939" \
                } \
            ] \
        }, \
        { \
            "featureType": "poi", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                } \
            ] \
        }, \
        { \
            "featureType": "poi", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "lightness": 21 \
                }, \
                { \
                    "color": "#303030" \
                } \
            ] \
        }, \
        { \
            "featureType": "poi", \
            "elementType": "labels.text.fill", \
            "stylers": [ \
                { \
                    "color": "#ffad77" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.highway", \
            "elementType": "geometry.fill", \
            "stylers": [ \
                { \
                    "color": "#ff5300" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.highway", \
            "elementType": "geometry.stroke", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 29 \
                }, \
                { \
                    "weight": 0.2 \
                } \
            ] \
        }, \
        { \
            "featureType": "road.arterial", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "color": "#ff5e1c" \
                }, \
                { \
                    "lightness": 18 \
                }, \
                { \
                    "visibility": "on" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.local", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 16 \
                } \
            ] \
        }, \
        { \
            "featureType": "transit", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 19 \
                } \
            ] \
        }, \
        { \
            "featureType": "water", \
            "elementType": "geometry", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "lightness": 17 \
                } \
            ] \
        } \
    ]');
  })();
