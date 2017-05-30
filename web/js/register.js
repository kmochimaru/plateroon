$(document).ready(function(){
    
    //Load address
    $.Thailand({
        database: 'jquery.Thailand.js/data3.json', 
        onComplete: function(){
            $('#loader, #address').toggle();
        }
    });

    $("form").submit(function(e){
        e.preventDefault()
        e.stopPropagation()
        var postData = $(this).serializeArray();
        var formURL = $(this).attr("action");
        
        $.ajax({
            url : formURL,
            type: "POST",
            data : postData,
            
            success:function(data, textStatus, jqXHR){
                toastr.success('รออนุมัติจากผู้ดูแลระบบ','ลงทะเบียนสำเร็จ !')
                $('button[type="reset"]').trigger('click')
            },
            error: function(jqXHR, textStatus, errorThrown){
                toastr.error('กรุณาติดต่อผู้ดูแลระบบ','ลงทะเบียนล้มเหลว !')
            }
        });
        
    });

    
    $("#idCard").bind("change paste keyup input", function(){
        
        if($("#idCard").val().length == 13){
            checkIdCard($("#idCard").val())
        }
        
    })
    
    

    function checkIdCard(idcard){
        var input = $("#idCard")
        var button  = $("#btnSubmit")
        var pid = idcard;
        pid = pid.toString().replace(/\D/g,'');
        if(pid.length == 13){
            var sum = 0;
            for(var i = 0; i < pid.length-1; i++){
            sum += Number(pid.charAt(i))*(pid.length-i);
            }
            var last_digit = (11 - sum % 11) % 10;
            if(pid.charAt(12) == last_digit){
                    //Valid OK.
                    $.ajax({
                        url : "RegisterController",
                        type: "POST",
                        data : {"action":"idcard", "data":idcard},

                        success:function(data, textStatus, jqXHR){
                            if(data == "true"){
                                toastr.success('สามารถใช้เลขบัตรประจำตัวประชาชนนี้ได้','สำเร็จ')
                                input.attr("style","")
                                button.removeAttr('disabled')
                            }
                            if(data == "false"){
                                toastr.warning('','เลขบัตรประจำตัวประชาชนซ้ำในระบบ !')
                                input.css('border','2px solid #ffcc00')
                                button.attr("disabled","disabled")
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            toastr.error('กรุณาติดต่อผู้ดูแลระบบ','ลงทะเบียนล้มเหลว !')
                        }
                    });
            }else{
                //Valid Not ok.
                toastr.error('รูปแบบเลขรหัสบัตรประจำตัวประชาชนไม่ถูกต้อง','ข้อผิดพลาด !')
                input.css('border','2px solid red')
                button.attr("disabled","disabled")
            }
        }
            
    }
    
})