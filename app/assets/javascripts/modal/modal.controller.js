(function() {
'use strict';

angular.module('GeoBox')
.controller('ModalController', ModalController);

ModalController.$inject = ['$rootScope', 'DocumentService', '$scope', 'UserService'];

function ModalController($rootScope, DocumentService, $scope, UserService){
    var $ctrl = this;
    $ctrl.docs = [];

    $scope.$on('files_in_book:ready', function(){
        $("#exampleModal").modal("show");
        $ctrl.getDocs();
    });

    $ctrl.getDocs = function(book_id){
        console.log(book_id);
        $ctrl.docs = DocumentService.files_in_book;
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