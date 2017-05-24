var working = false;
$('.login').on('submit', function (e) {
    
    e.preventDefault();
    var $this = $(this),
    $state = $this.find('button > .state')
    $this.addClass('loading')
    $state.html('ระบบกำลังตรวจสอบตัวตน')
    
    var postData = $(this).serializeArray();
    var formURL = $(this).attr("action")
    $.ajax({
        url : formURL,
        dataType : "JSON",
        data : postData,
        type: "POST",

        success:function(data, textStatus, jqXHR){
            
            if(data == "admin"){
                
                setTimeout(function () {
                    $this.addClass('ok');
                    $state.html('ยินดีต้อนรับเข้าสู่ระบบ');
                    setTimeout(function () {
                        $state.html('Log in');
                        $this.removeClass('ok loading');
                        working = false;
                        window.location = "admin/dashboard.jsp"
                    }, 2000);
                }, 3000);
                
            }else if(data == "true"){
                
                setTimeout(function () {
                    $this.addClass('ok');
                    $state.html('ยินดีต้อนรับเข้าสู่ระบบ');
                    setTimeout(function () {
                        $state.html('Log in');
                        $this.removeClass('ok loading');
                        working = false;
                        window.location = "index.jsp"
                    }, 2000);
                }, 3000);
                
            }else if(data == "false"){
                $this.removeClass('ok loading');
                $state.html('เข้าสู่ระบบ');
                toastr.warning('กรุณตรวจสอบชื่อผู้ใช้หรือรหัสผ่าน','เข้าระบบไม่สำเร็จ !')
            }
        },
        error: function(jqXHR, textStatus, errorThrown, data){
            toastr.warning('กรุณแจ้งผู้ดูแลระบบ','เข้าระบบล้มเหลว')
        }
    });            
            
});