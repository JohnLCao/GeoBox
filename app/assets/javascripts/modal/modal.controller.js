(function() {
'use strict';

angular.module('GeoBox')
.controller('ModalController', ModalController);

ModalController.$inject = ['$rootScope', 'DocumentService', '$scope', 'UserService'];

function ModalController($rootScope, DocumentService, $scope, UserService){
    var $ctrl = this;
    $ctrl.docs = [];
    $ctrl.book = {};

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
    }

    $ctrl.getDocs = function(book_id){
        console.log(book_id);
        $ctrl.docs = processDocuments(DocumentService.files_in_book);
        console.log($ctrl.docs);
    };

    function processDocuments(documents){
        documents.forEach(function(d){
            d.created_at = moment(new Date(d.created_at_ms * 1000)).fromNow();
        });
        return documents;
    }

}

})();