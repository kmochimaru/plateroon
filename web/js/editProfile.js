(function () {
    
    angular.module('profile', [])
            .controller('mainController', function ($scope, $http) {
                $http.post("AgentController?action=readByUsername")
                    .then(function (response) {
                        $scope.a = response.data[0]
                    })
            })
            
            /*
            .controller('searchController', function($scope, $http){
                $scope.formData = {}
                $scope.submit = function(){
                    console.log('submit')
                    console.log($scope.formData)
                    $http({
                        url: "AgentController",
                        method: "POST",
                        data : $.param($scope.fromData || ''),
                        headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  
                    })   
                    .then(function (response) {
                       console.log(response.data[0])
                       $scope.a = response.data[0]
                    })
                }
            })*/
})()


