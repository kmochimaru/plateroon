(function () {
    
    angular.module('profile', [])
            .controller('mainController', function ($scope, $http) {
                $http.post("AgentController?action=readByUsername")
                    .then(function (response) {
                        $scope.a = response.data[0]
                    })
            })
            
            .controller('agentController', function ($scope, $http, $filter) {
                $http.post("AgentController?action=member")
                        .then(function (response) {
                            $scope.agent = response.data
                            $scope.sizeAgent = response.data.length
                            var today = $filter('date')(new Date(),'yyyy-MM-dd');
                            $scope.chkExpiredDate = function(expiredDate){
                                if(today > expiredDate){
                                    return false
                                }else{ 
                                    return true
                                }
                            }
                        })

                $scope.editAgent = function editAgent() {
                    console.log('editAgent')
                    var postData = $(this).serializeArray();
                    var formURL = $(this).attr("action");
                    console.log(postData)
                    console.log(formURL)
                    $.ajax({
                        url: formURL,
                        type: "POST",
                        dataType: "JSON",
                        data: postData,

                        success: function (data, textStatus, jqXHR) {
                            toastr.success('', 'แก้ไขข้อมูลสำเร็จ !')
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            toastr.error('กรุณาติดต่อผู้ดูแลระบบ', 'แก้ไขข้อมูลล้มเหลว !')
                        }
                    });
                }
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


