var module = angular.module('app');

module.service('$projects', function($http, $q) {
    var self = this;
    
    self.projects;
    self.currentProject;
    
    self.getProjects = function() {
        if(self.projects){
            return $q.when(self.projects);
        }
        var promise = $http({
          url: '/projects', 
          method: 'GET'
        }).then(function(response) {
            self.projects = response;
            return self.projects;
        });
        return promise;
    };
    
});