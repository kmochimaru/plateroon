(function () {
    'use strict'
    angular.module('myApp', ['ngStorage'])

            .controller('mainController', function ($scope, $http, $localStorage) {
                $http.post("../AgentController?action=activeN")
                        .then(function (response) {
                            $scope.agent = response.data
                            $scope.sizeAgent = response.data.length
                            $localStorage.notify = response.data.length     //save local storage
                            $scope.notify = $localStorage.notify
                            if ($scope.sizeAgent > 0)
                                toastr.info("ทั้งหมด " + $scope.sizeAgent + " รายการ", 'มีรายชื่อยังไม่ได้อนุมัติ')
                        })

            })

            .controller('agentController', function ($scope, $http, $localStorage, $filter) {
                $http.post("../AgentController?action=activeY")
                        .then(function (response) {
                            $scope.agent = response.data
                            $scope.sizeAgent = response.data.length
                            $scope.notify = $localStorage.notify
                            var today = $filter('date')(new Date(),'yyyy-MM-dd');
                            $scope.chkExpiredDate = function(expiredDate){
                                if(today > expiredDate || today == expiredDate){
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

            .controller('degreeController', function ($scope, $http, $localStorage) {
                $http.post("../DegreeController?action=read")
                        .then(function (response) {
                            $scope.degree = response.data
                            $scope.sizeDegree = response.data.length
                            $scope.notify = $localStorage.notify
                        })
            })

})();

