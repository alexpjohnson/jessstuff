var module = angular.module('app');

module.component('bookmarks', {
     templateUrl: 'bookmarks/bookmarks.template.html',
     controller: function($specs) {
        var self = this;
        
        
        self.$onInit = function(){
            $specs.addCallback(function callback() {
                self.bookmarks = $specs.bookmarks;
            });  
        };
        
    }
});