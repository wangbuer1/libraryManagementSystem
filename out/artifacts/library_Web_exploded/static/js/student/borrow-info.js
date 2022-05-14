var table;
$(function () {
    table = $('#data_list').DataTable({
        "ajax": {
            "url": $("#basePath").val() + "student/borrowInfo/list",
            "type": "POST",
            "data": function (d) {
                return {
                    "bno": $("#query_bno").val(),
                    "bname": $("#query_bname").val()
                };
            }
        },
        "columns": [
            {"data": "bno"},
            {"data": "bname"},
            {"data": "author"},
            {"data": "price"},
            {"data": "sno"},
            {"data": "sname"},
            {"data": null},
            {"data": null},
            {"data": null},
            {"data": null}
        ],
        columnDefs: [
            {
                targets: 6,
                render: function (a, b, c, d) {
                    return (new Date(c.bdate)).format('yyyy-MM-dd');
                }
            },
            {
                targets: 7,
                render: function (a, b, c, d) {
                    return (new Date(c.rdate)).format('yyyy-MM-dd');
                }
            },
            {
                targets: 8,
                render: function (a, b, c, d) {
                    var days = (new Date()).minus(new Date(c.rdate));
                    return days > 0 ? days : "";
                }
            },
            {
                targets: 9,
                render: function (a, b, c, d) {
                	var result = "<button type='button' class='btn btn-xs btn-success' id='btn_detail' onclick='showReturn(\"" + c.bno + "\")'>还书</button>";
                	debugger;
                	var days = (new Date(c.rdate)).minus(new Date());
                	if(days>=0&&days<=7){
                		result+="&nbsp<button type='button' class='btn btn-xs btn-info' id='btn_js' onclick='showXJ(\"" + c.bno + "\")'>续借</button>"
                	}
                    return result;
                }
            }
        ]
    });
});

function query() {
    table.ajax.reload();
}

function showReturn(id) {
	debugger;
    jQuery.ajax({
        type: 'POST',
        url: $("#basePath").val() + 'student/borrowInfo/saveReturn',
        cache: false,
        data: {bno: id},
        success: function (data) {
        	if (data == 1) {
                showInfo("操作成功")
                table.ajax.reload();
            } else if (data == 0) {
                showInfo("操作失败，请重试")
            } else if (data == -1) {
                showInfo("此学号不存在")
            } else if (data == -2) {
                showInfo("此图书编号不存在")
            } else if (data == -3) {
                showInfo("您未借阅此书")
            } else {
                showInfo("操作失败，请重试")
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            showInfo("操作失败，请重试");
        }
    });
}

function showXJ(id) {
    jQuery.ajax({
        type: 'POST',
        url: $("#basePath").val() + 'student/borrowInfo/saveXj',
        cache: false,
        data: {bno: id},
        success: function (data) {
        	if (data == 1) {
                showInfo("操作成功");
                table.ajax.reload();
            } else if (data == 0) {
                showInfo("操作失败，请重试");
            } else if (data == -1) {
                showInfo("此学号不存在");
            } else if (data == -2) {
                showInfo("此图书编号不存在");
            } else if (data == -3) {
                showInfo("此图书在馆数量不足");
            } else if (data == -4) {
                showInfo("您已经借阅此书，不能重复借阅");
            } else if (data == -5) {
                showInfo("您的借阅图书已达上限");
            } else{
                showInfo("操作失败，请重试");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            showInfo("操作失败，请重试");
        }
    });
}

function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}