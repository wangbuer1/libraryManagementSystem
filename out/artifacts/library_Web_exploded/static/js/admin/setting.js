var table;
$(function () {
    table = $('#data_list').DataTable({
        "ajax": {
            "url": $("#basePath").val() + "admin/setting/list",
            "type": "POST"
        },
        "columns": [
            {"data": "name"},
            {"data": "value"},
            {"data": null}
        ],
        columnDefs: [
            {
                targets: 2,
                render: function (a, b, c, d) {
                    return "<button type='button' class='btn btn-xs btn-warning' id='btn_edit' onclick='showUpdate(\"" + c.id + "\")'>修改</button>";
                }
            }
        ],
    });
});


function showUpdate(id) {
    jQuery.ajax({
        type: 'POST',
        url: $("#basePath").val() + 'admin/setting/findById',
        cache: false,
        data: {id: id},
        success: function (data) {
            $("#update_id").val(data.id);
            $("#update_name").val(data.name);
            $("#update_value").val(data.value);
            $('#modal_update').modal('show');
        },
        error: function (jqXHR, textStatus, errorThrown) {
            showInfo("操作失败，请重试");
        }
    });
}

function update() {
    if (!validUpdate()) {
        return;
    }

    var param = {
        id: $.trim($("#update_id").val()),
        value: $.trim($("#update_value").val())
    }

    jQuery.ajax({
        type: 'POST',
        url: $("#basePath").val() + 'admin/setting/update',
        cache: false,
        data: param,
        success: function (data) {
            if (data) {
                $('#modal_update').modal('hide');
                showInfo("操作成功");
                table.ajax.reload();
            } else {
                showInfo("操作失败，请重试");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            showInfo("操作失败，请重试");
        }
    });
}

function validUpdate() {
    var flag = true;

    var update_value = $.trim($("#update_value").val());
    if (update_value == "") {
        $("#update_value").parent().parent().addClass("has-error");
        $("#update_value").next().text("请输入分类名称");
        flag = false;
    } else if (update_value.length > 3) {
        $("#update_value").parent().parent().addClass("has-error");
        $("#update_value").next().text("分类名称长度不能大于2");
        flag = false;
    } else if (!update_value.match(/^(0|[1-9][0-9]*)$/)) {
        $("#update_value").parent().parent().addClass("has-error");
        $("#update_value").next().text("请输入数字");
        flag = false;
    } else {
        $("#update_value").parent().parent().removeClass("has-error");
        $("#update_value").next().text("");
    }

    return flag;
}

function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}