(function(){

'use strict';

angular.module('GeoBox')
.constant('retroMode', '[ \
        { \
            "featureType": "all", \
            "elementType": "labels.text.fill", \
            "stylers": [ \
                { \
                    "color": "#000000" \
                }, \
                { \
                    "weight": "1.05" \
                } \
            ] \
        }, \
        { \
            "featureType": "all", \
            "elementType": "labels.text.stroke", \
            "stylers": [ \
                { \
                    "color": "#ffbe71" \
                }, \
                { \
                    "weight": "1.02" \
                } \
            ] \
        }, \
        { \
            "featureType": "administrative.province", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                } \
            ] \
        }, \
        { \
            "featureType": "landscape", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "hue": "#ff0000" \
                }, \
                { \
                    "saturation": "-100" \
                }, \
                { \
                    "lightness": "27" \
                } \
            ] \
        }, \
        { \
            "featureType": "landscape.man_made", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "saturation": "-100" \
                }, \
                { \
                    "lightness": "68" \
                } \
            ] \
        }, \
        { \
            "featureType": "landscape.man_made", \
            "elementType": "geometry.stroke", \
            "stylers": [ \
                { \
                    "weight": "0.01" \
                }, \
                { \
                    "saturation": "100" \
                }, \
                { \
                    "lightness": "-21" \
                }, \
                { \
                    "color": "#fccc9e" \
                } \
            ] \
        }, \
        { \
            "featureType": "poi", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "simplified" \
                }, \
                { \
                    "saturation": "-100" \
                }, \
                { \
                    "lightness": "57" \
                }, \
                { \
                    "gamma": "2.51" \
                } \
            ] \
        }, \
        { \
            "featureType": "poi", \
            "elementType": "labels.text", \
            "stylers": [ \
                { \
                    "saturation": "-100" \
                }, \
                { \
                    "lightness": "-32" \
                } \
            ] \
        }, \
        { \
            "featureType": "road", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "saturation": -100 \
                }, \
                { \
                    "lightness": 45 \
                } \
            ] \
        }, \
        { \
            "featureType": "road", \
            "elementType": "geometry.fill", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "color": "#ffbe71" \
                } \
            ] \
        }, \
        { \
            "featureType": "road", \
            "elementType": "geometry.stroke", \
            "stylers": [ \
                { \
                    "color": "#facaa3" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.highway", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "simplified" \
                }, \
                { \
                    "saturation": "-100" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.highway", \
            "elementType": "geometry.fill", \
            "stylers": [ \
                { \
                    "color": "#ffc59b" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.highway", \
            "elementType": "geometry.stroke", \
            "stylers": [ \
                { \
                    "color": "#ffb363" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.arterial", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "saturation": "-100" \
                }, \
                { \
                    "lightness": "33" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.arterial", \
            "elementType": "geometry.fill", \
            "stylers": [ \
                { \
                    "color": "#ffbe71" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.arterial", \
            "elementType": "geometry.stroke", \
            "stylers": [ \
                { \
                    "color": "#ffbe71" \
                }, \
                { \
                    "visibility": "simplified" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.local", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "on" \
                }, \
                { \
                    "saturation": "-100" \
                }, \
                { \
                    "lightness": "40" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.local", \
            "elementType": "geometry.fill", \
            "stylers": [ \
                { \
                    "color": "#ffbe71" \
                }, \
                { \
                    "saturation": "-8" \
                } \
            ] \
        }, \
        { \
            "featureType": "road.local", \
            "elementType": "geometry.stroke", \
            "stylers": [ \
                { \
                    "color": "#ffbe71" \
                }, \
                { \
                    "weight": "0.84" \
                } \
            ] \
        }, \
        { \
            "featureType": "transit", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "visibility": "simplified" \
                }, \
                { \
                    "saturation": "-100" \
                } \
            ] \
        }, \
        { \
            "featureType": "water", \
            "elementType": "all", \
            "stylers": [ \
                { \
                    "color": "#ed842c" \
                }, \
                { \
                    "visibility": "on" \
                } \
            ] \
        } \
    ]');
})();
