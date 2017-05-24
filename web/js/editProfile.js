(function () {
    
    angular.module('profile', [])
            .controller('mainController', function ($scope, $http) {
                $http.post("AgentController?action=readByUsername")
                    .then(function (response) {
                        $scope.a = response.data[0]
                    })
            })
            
})()


