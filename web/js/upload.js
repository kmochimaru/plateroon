function readURL(input) {
    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $('.image-upload-wrap').hide();

            $('.file-upload-image').attr('src', e.target.result);
            $('.file-upload-content').show();

            $('.image-title').html(input.files[0].name);
        };

        reader.readAsDataURL(input.files[0]);

    } else {
        removeUpload();
    }
}

function removeUpload() {
    $('.file-upload-input').replaceWith($('.file-upload-input').clone());
    $('.file-upload-content').hide();
    $('.image-upload-wrap').show();
    $("#uploader").attr("disabled", "disabled")
}
$('.image-upload-wrap').bind('dragover', function () {
    chkEmty()
    $('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function () {
    chkEmty()
    $('.image-upload-wrap').removeClass('image-dropping');
});

$('#file').bind('input click change', function () {
    chkEmty()
})

$('.image-upload-wrap').bind('click', function () {
    chkEmty()
});



function chkEmty() {
    if ($('#file').val() != "") {
        $("#uploader").removeAttr('disabled')
    } else {
        $("#uploader").attr("disabled", "disabled")
    }
}

//video
function readURLVideo(input) {
    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $('.image-upload-wrap').hide();

            $('.file-upload-video').attr('src', e.target.result);
            $('.file-upload-content').show();

            $('.image-title').html(input.files[0].name);
        };

        reader.readAsDataURL(input.files[0]);

    } else {
        removeUpload();
    }
}

function removeUploadVideo() {
    $('.file-upload-input').replaceWith($('.file-upload-input').clone());
    $('.file-upload-content').hide();
    $('.image-upload-wrap').show();
    $("#uploader").attr("disabled", "disabled")
}