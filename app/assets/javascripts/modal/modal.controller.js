(function() {
'use strict';

angular.module('GeoBox')
.controller('ModalController', ModalController);

ModalController.$inject = ['$rootScope', 'DocumentService', '$scope', 'UserService'];

function ModalController($rootScope, DocumentService, $scope, UserService){
    var $ctrl = this;
    $ctrl.docs = [];
    $ctrl.book = {};

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
            "name",
            "description",
            "username"
        ]
    };

    $ctrl.fuzzySearchResult = [];

    $ctrl.search = function(){
        if ($ctrl.fuzzySearchString){
            $ctrl.fuzzySearchResult = $ctrl.fuzzySearchList.search($ctrl.fuzzySearchString);
        } else {
            $ctrl.fuzzySearchResult = $ctrl.docs; // all documents.
        }
    };

    $scope.$on('files_in_book:ready', function(event, data){
        $("#exampleModal").modal("show");
        $ctrl.allow_access = false;
        $ctrl.secret = null;
        $ctrl.book = data.book;
        $ctrl.getDocs();
        $ctrl.baseUrl = UserService.baseUrl;
    });

    $ctrl.checkSecret = function(){
        if ($ctrl.secret === $ctrl.book.key){
            $ctrl.allow_access = true;
        }
    };

    $ctrl.getDocs = function(book_id){
        $ctrl.docs = processDocuments(DocumentService.files_in_book);
    };

    function processDocuments(documents){
        documents.forEach(function(d){
            d.created_at = moment(new Date(d.created_at_ms * 1000)).fromNow();
        });
        $ctrl.fuzzySearchList = new Fuse(documents, $ctrl.fuzzySearchOptions);
        $ctrl.fuzzySearchResult = documents;
        return documents;
    }

}

})();