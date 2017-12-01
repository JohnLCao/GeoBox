(function(){

'use strict';

angular.module('GeoBox')
.controller('SidebarController', SidebarController);

SidebarController.$inject = ['$rootScope', 'DocumentService', '$scope', 'UserService'];
function SidebarController($rootScope, DocumentService, $scope, UserService){
	var $ctrl = this;
	$ctrl.docs = [];
	$ctrl.books = [];
	$ctrl.user = {};
	$ctrl.base_url = null;

	$ctrl.fuzzySearchString_file = '';
    $ctrl.fuzzySearchString_book = '';

	$ctrl.fuzzySearchList_file = [];
    $ctrl.fuzzySearchList_book = [];

	$ctrl.fuzzySearchOptions_file = {
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

    $ctrl.fuzzySearchOptions_book = {
        shouldSort: true,
        threshold: 0.6,
        location: 0,
        distance: 30,
        maxPatternLength: 32,
        minMatchCharLength: 1,
        keys: [
            "name",
            "description",
            "username"
        ]
    };

	$ctrl.fuzzySearchResult_file = [];
    $ctrl.fuzzySearchResult_book = [];

	$ctrl.$onInit = function(){
		$rootScope.$broadcast('login:login', {}); // we can consider adding data to this event
		var sidebar = $('#sidebar').sidebar();
		UserService.getUserInfo();
	};

	$ctrl.getDocs = function(e,d){
		$ctrl.docs = processDocuments(DocumentService.docs);
        $ctrl.books = processBooks(DocumentService.books);
	};

	$ctrl.getUser = function(e,d){
		$ctrl.user = processUser(UserService.user);
		$ctrl.base_url = UserService.base_url;
	};

	$ctrl.file_search = function(){
		if ($ctrl.fuzzySearchString_file){
			$ctrl.fuzzySearchResult_file = $ctrl.fuzzySearchList_file.search($ctrl.fuzzySearchString_file);
		} else {
			$ctrl.fuzzySearchResult_file = $ctrl.docs; // all documents.
		}
	};

	$ctrl.book_search = function(){
		if ($ctrl.fuzzySearchString_book){
			$ctrl.fuzzySearchResult_book = $ctrl.fuzzySearchList_book.search($ctrl.fuzzySearchString_book);
		} else {
			$ctrl.fuzzySearchResult_book = $ctrl.books; // all documents.
		}
	};

	function processDocuments(documents){
		documents.forEach(function(d){
			d.created_at = moment(new Date(d.created_at_ms * 1000)).fromNow();
		});
		$ctrl.fuzzySearchList_file = new Fuse(documents, $ctrl.fuzzySearchOptions_file);
		$ctrl.fuzzySearchResult_file = documents;
		return documents;
	}

	function processBooks(books){

		books.forEach(function(b){
			b.created_at = moment(new Date(b.created_at_ms * 1000)).fromNow();
		});
		$ctrl.fuzzySearchList_book = new Fuse(books, $ctrl.fuzzySearchOptions_book);
		$ctrl.fuzzySearchResult_book = books;
		return books;
	}

	function processUser(user){
		if (!user.guest){
			user.created_at = moment(new Date(user.created_at_ms * 1000)).fromNow();
			user.updated_at = moment(new Date(user.updated_at_ms * 1000)).fromNow();
		}
		return user;
	}

    $ctrl.openBook = function(id){
	    DocumentService.fetchFilesInBook(id);
    };

	$scope.$on('documents:ready', $ctrl.getDocs);
	$scope.$on('user:ready', $ctrl.getUser);

}

})();
