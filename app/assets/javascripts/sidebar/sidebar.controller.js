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

	function processDocuments(documents){
		documents.forEach(function(d){
			d.created_at = moment(new Date(d.created_at_ms * 1000)).fromNow();
		});
		return documents;
	};

	function processUser(user){
		if (!user.guest){
			user.created_at = moment(new Date(user.created_at_ms * 1000)).fromNow();
			user.updated_at = moment(new Date(user.updated_at_ms * 1000)).fromNow();
		}
		return user;
	};

	$scope.$on('documents:ready', $ctrl.getDocs);
	$scope.$on('user:ready', $ctrl.getUser);
}

})();
