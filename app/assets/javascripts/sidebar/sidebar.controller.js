(function(){

'use strict';

angular.module('GeoBox')
.controller('SidebarController', SidebarController);

SidebarController.$inject = ['$rootScope', 'DocumentService', '$scope', 'UserService'];
function SidebarController($rootScope, DocumentService, $scope, UserService){
	var $ctrl = this;
	$ctrl.docs = {};
	$ctrl.user = {};
	$ctrl.base_url = null;
	$ctrl.fuzzySearchString = '';
	$ctrl.fuzzySearchList = [];
	$ctrl.fuzzySearchOptions = {
		  shouldSort: true,
		  threshold: 0.6,
		  location: 0,
		  distance: 30,
		  maxPatternLength: 32,
		  minMatchCharLength: 1,
		  keys: [
		    "filename",
		    "description",
		    "username"
		  ]
	};
	$ctrl.fuzzySearchResult = [];

	$ctrl.$onInit = function(){
		$rootScope.$broadcast('login:login', {}); // we can consider adding data to this event
		var sidebar = $('#sidebar').sidebar();
		UserService.getUserInfo();
	};

	$ctrl.getDocs = function(e,d){
		$ctrl.docs = processDocuments(DocumentService.docs);
	};

	$ctrl.getUser = function(e,d){
		$ctrl.user = processUser(UserService.user);
		$ctrl.base_url = UserService.base_url;
	};

	$ctrl.search = function(){
		if ($ctrl.fuzzySearchString){
			$ctrl.fuzzySearchResult = $ctrl.fuzzySearchList.search($ctrl.fuzzySearchString);
		} else {
			$ctrl.fuzzySearchResult = $ctrl.docs; // all documents.
		}
	}

	function processDocuments(documents){
		documents.forEach(function(d){
			d.created_at = moment(new Date(d.created_at_ms * 1000)).fromNow();
		});
		$ctrl.fuzzySearchList = new Fuse(documents, $ctrl.fuzzySearchOptions);
		$ctrl.fuzzySearchResult = documents;
		return documents;
	}

	function processUser(user){
		if (!user.guest){
			user.created_at = moment(new Date(user.created_at_ms * 1000)).fromNow();
			user.updated_at = moment(new Date(user.updated_at_ms * 1000)).fromNow();
		}
		return user;
	}

	$scope.$on('documents:ready', $ctrl.getDocs);
	$scope.$on('user:ready', $ctrl.getUser);
}

})();
