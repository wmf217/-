function uploadInit(id, int, name) {
    var pre = arguments.length <= 3 || arguments[3] === undefined ? '' : arguments[3];

    var preview = undefined;
    var imageurl = $("#" + id).attr("value");
    if (!!imageurl) {
        preview = ["<img class='file-preview-image' width='500px' src='" + imageurl + "'/>"];
    } else {
        preview = [];
    }
    $("#" + id).fileinput({
        showUpload: false,
        showRemove: false,
        uploadAsync: false,
        browseLabel: '上传图片',
        previewFileType: 'image',
        uploadUrl: '/common/uploadimg',
        allowedFileExtensions: ['jpg', 'png'],
        msgInvalidFileExtension: '不正确的文件扩展名 "{name}". 只支持 "{extensions}" 的文件扩展名.',
        showCaption: true,
        // browseClass: 'btn-custom btn-upload',
        dropZoneEnabled: true,
        dropZoneTitle: int + ' &hellip;',
        msgFilesTooMany: "只能上传一张图片！",
        maxFileSize: '1000KB',
        msgSizeTooLarge: '文件 "{name}" (<b>{size} KB</b>) 超过了允许大小 <b>{maxSize} KB</b>.',
        maxFileCount: 1,
        enctype: 'multipart/form-data',
        validateInitialCount: true,
        initialPreview: preview
    }).on('filecleared', function (event) {
        $("input[name='" + name + "']").val("");
    }).on('filesuccessremove', function (event, id) {
        $("#" + id).fileinput('clear');
        $("input[name='" + name + "']").val("");
    }).on('change', function (event) {
        $("#" + id).fileinput('refresh');
        $("#" + id).fileinput('upload');
    }).on('filebatchuploadsuccess', function (event, data, previewId, index) {
        $("input[name='" + name + "']").val(data.response.path);
    });
}
