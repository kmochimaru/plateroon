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
                            var today = $filter('date')(new Date(), 'yyyy-MM-dd');
                            $scope.chkExpiredDate = function (expiredDate) {
                                if (today > expiredDate) {
                                    return false
                                } else {
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

            .controller('checkAgentCode', function ($scope) {
                var working = false;
                $('form').on('submit', function (e) {
                    e.preventDefault();
                    var $this = $(this),
                            $state = $this.find('button > .state')
                    $this.addClass('loading')
                    $state.html('ระบบกำลังตรวจสอบ')

                    var getData = $(this).serializeArray();
                    var formURL = $(this).attr("action")

                    $.ajax({
                        url: formURL,
                        dataType: "JSON",
                        data: getData,
                        type: "GET",

                        success: function (data, textStatus, jqXHR) {
                            
                            if (data == true) {
                                setTimeout(function () {
                                    $this.addClass('ok');
                                    $state.html('สมบูรณ์');
                                    setTimeout(function () {
                                        $state.html('ตรวจสอบ');
                                        $this.removeClass('ok loading');
                                        working = false;
                                    }, 2000);
                                }, 2000);
                            } else if (data == false) {
                                
                                setTimeout(function () {
                                    //$(".spinner").remove()
                                    $this.addClass('not-ok');
                                    $state.html('เลขประจำตัวของตัวแทนไม่มีอยู่ในระบบ');
                                    $(".fail").append("<i class='fa fa-times fa-3x'aria-hidden='true'></i><br>")
                                    setTimeout(function () {
                                        $state.html('ตรวจสอบ');
                                        $this.removeClass('not-ok loading');
                                        $(".fail").empty()
                                        working = false;
                                    }, 3000);
                                }, 2000);
                            }else if (data == "หมดอายุ") {
                                
                                setTimeout(function () {
                                    //$(".spinner").remove()
                                    $this.addClass('not-ok');
                                    $state.html('บัตรตัวแทนหมดอายุ');
                                    $(".fail").append("<i class='fa fa-user-times fa-3x' aria-hidden='true'></i><br>")
                                    setTimeout(function () {
                                        $state.html('ตรวจสอบ');
                                        $this.removeClass('not-ok loading');
                                        $(".fail").empty()
                                        working = false;
                                    }, 3000);
                                }, 2000);
                            }
                            $('#agentCode').focus()         //debug cursor spinner
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown, data) {
                            console.log(errorThrown)
                        }
                    });

                });
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


