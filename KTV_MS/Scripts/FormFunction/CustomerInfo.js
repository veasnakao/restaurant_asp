$(document).ready(function () {
    var showRows = $(".show-rows").val();

    //window load
    $(window).load(function () {
        var offset = 0;
        displayDataLimit(offset, showRows);
    });

    //show row
    $('.show-rows').on('change', function () {
        showRows = $(".show-rows option:selected").val();
        var offset = 0;
        displayDataLimit(offset, showRows);
    });

    //ASC 
    $('.asc').click(function () {
        var shortField = this.value;
        var shortName = "ASC";
        var offset = 0;
        displayShortData(shortField, shortName, offset, showRows);
    });

    //DESC
    $('.desc').click(function () {
        var shortField = this.value;
        var shortName = "DESC";
        var offset = 0;
        displayShortData(shortField, shortName, offset, showRows);
    });

    //next button
    $('#next').click(function () {
        var offset = 0;
        offset += parseFloat(showRows);
        totalIncrease += parseFloat(offset);
        displayDataLimit(offset, showRows);

    });

    //previous button
    $('#previous').click(function () {
        var offset = 0;
        offset -= showRows;
        displayDataLimit(offset, showRows);
    });

    //search data
    $(".search-val").keyup(function () {
        var searchVal = $(".search-val").val();
        if (searchVal != "" || searchVal != null) {
            var offset = 0;
            searchData(searchVal, offset, showRows);
        } else {
            var offset = 0;
            displayDataLimit(offset, showRows);
        }
    });

    //current row update
    $(document).on("click", "#customer-table tr #update", function (e) {
        var cusId = $(this).closest('tr').children('td:first').text();
        if (cusId != "" || cusId != null) {
            $(".lbl-cusId").addClass("active");
            $(".lbl-cusName").addClass("active");
            $(".lbl-tel").addClass("active");
            $('#modal-upadte').modal('open');
            displayData(cusId);
        }
    });

    //current row delete
    $(document).on("click", "#customer-table tr #delete-data", function (e) {
        var cusId = $(this).closest('tr').children('td:first').text();
        if (cusId != "" || cusId != null) {
            swal({
                title: "តើអ្នកពិតជាចង់លុបមែនទេ?",
                //text: "You will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "បាទ/ចាស",
                cancelButtonText: "អត់ទេ",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    deleteData(cusId);
                } else {
                    swal("Cancelled", "Your imaginary file is safe :)", "error");
                }
            });
        }
    });

    //reset update
    $("#reset-update").click(function () {
        $(".lbl-cusId").addClass("active");
        $(".lbl-cusName").addClass("active");
        $(".lbl-tel").val("");
        var cusId = $('.cusId').val();
        if (cusId != "" || cusId != null) {
            displayData(cusId);
        }
    });

    //insert data
    $("#insert-data").click(function () {
        var cusId = $('#<%=txtCusId.ClientID %>').val();
        var cusName = $('#<%=txtCusName.ClientID %>').val();
        var gender = $('#<%=txtGender.ClientID %> option:selected').val();
        var cusType = $('#<%=txtCusType.ClientID %> option:selected').val();
        var tel = $('#<%=txtTel.ClientID %>').val();
        insert(cusId, cusName, gender, cusType, tel);
    });

    //update data
    $("#update-data").click(function () {
        var cusId = $('#<%=txtCusIdUpdate.ClientID %>').val();
        var cusName = $('#<%=txtCusNameUpdate.ClientID %>').val();
        var gender = $('#<%=txtGenderUpdate.ClientID %> option:selected').val();
        var cusType = $('#<%=txtCusTypeUpdate.ClientID %> option:selected').val();
        var tel = $('#<%=txtTelUpdate.ClientID %>').val();
        update(cusId, cusName, gender, cusType, tel);
    });

    //function insert
    function insert(cusId, cusName, gender, cusType, tel) {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/InsertData",
            data: JSON.stringify({
                cusId: cusId,
                cusName: cusName,
                gender: gender,
                cusType: cusType,
                tel: tel
            }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                swal({
                    title: "បញ្ជូលបានជោគជ័យ!",
                    //text: "you clicked the button!",
                    type: "success",
                    showcancelbutton: false,
                    timer: 1500,
                    closeonconfirm: false,
                    closeoncancel: false
                });
                clearText();
                $(".cusId").val(result.d);
                $(".lbl-cusId").addClass("active");
                var offset = 0;
                displayDataLimit(offset, showRows);
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function update
    function update(cusId, cusName, gender, cusType, tel) {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/UpdateData",
            data: JSON.stringify({
                cusId: cusId,
                cusName: cusName,
                gender: gender,
                cusType: cusType,
                tel: tel
            }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                if (result.d = "success") {
                    swal({
                        title: "បញ្ជូលបានជោគជ័យ!",
                        //text: "you clicked the button!",
                        type: "success",
                        showcancelbutton: false,
                        timer: 1500,
                        closeonconfirm: false,
                        closeoncancel: false
                    });
                    $('#modal-upadte').modal('close');
                    clearText();
                    var offset = 0;
                    displayDataLimit(offset, showRows);
                }
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function delete
    function deleteData(cusId) {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/DeleteData",
            data: JSON.stringify({
                cusId: cusId
            }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                if (result.d = "delete") {
                    swal({
                        title: "លុបបានជោគជ័យ!",
                        //text: "you clicked the button!",
                        type: "success",
                        showcancelbutton: false,
                        timer: 1500,
                        closeonconfirm: false,
                        closeoncancel: false
                    });
                    $('#modal-upadte').modal('close');
                    clearText();
                    var offset = 0;
                    displayDataLimit(offset, showRows);
                }
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function maxId
    function maxId() {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/WindowLoad",
            data: JSON.stringify({}),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                clearText();
                $(".cusId").val(result.d);
                $(".lbl-cusId").addClass("active");
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function displayDataLimit
    function displayDataLimit(offset, rows) {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/DisplayDataLimit",
            data: JSON.stringify({ offset: offset, rows: rows }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                if (result.d) {
                    var customer = result.d;
                    $('#customer-list').html("");
                    for (var i = 0; i < customer.length; i++) {
                        $('#customer-list').append(
                            '<tr>' +
                                '<td>' + customer[i].cusId + '</td>' +
                                '<td>' + customer[i].cusName + '</td>' +
                                '<td>' + customer[i].gender + '</td>' +
                                '<td>' + customer[i].cusType + '</td>' +
                                '<td>' + customer[i].tel + '</td>' +
                                '<td>' +
                                '<button value=' + customer[i].cusId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + customer[i].cusId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                }
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function displayShortData
    function displayShortData(shortField, shortName, offset, rows) {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/DisplayShortData",
            data: JSON.stringify({
                shortField: shortField,
                shortName: shortName,
                offset: offset,
                rows: rows
            }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                if (result.d) {
                    var customer = result.d;
                    $('#customer-list').html("");
                    for (var i = 0; i < customer.length; i++) {
                        $('#customer-list').append(
                            '<tr>' +
                                '<td>' + customer[i].cusId + '</td>' +
                                '<td>' + customer[i].cusName + '</td>' +
                                '<td>' + customer[i].gender + '</td>' +
                                '<td>' + customer[i].cusType + '</td>' +
                                '<td>' + customer[i].tel + '</td>' +
                                '<td>' +
                                '<button value=' + customer[i].cusId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + customer[i].cusId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                }
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function searchData
    function searchData(searchVal, offset, rows) {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/SearchData",
            data: JSON.stringify({
                searchVal: searchVal,
                offset: offset,
                rows: rows
            }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                if (result.d) {
                    var customer = result.d;
                    $('#customer-list').html("");
                    for (var i = 0; i < customer.length; i++) {
                        $('#customer-list').append(
                            '<tr>' +
                                '<td>' + customer[i].cusId + '</td>' +
                                '<td>' + customer[i].cusName + '</td>' +
                                '<td>' + customer[i].gender + '</td>' +
                                '<td>' + customer[i].cusType + '</td>' +
                                '<td>' + customer[i].tel + '</td>' +
                                '<td>' +
                                '<button value=' + customer[i].cusId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + customer[i].cusId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                }
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function displayData
    function displayData(cusId) {
        $.ajax({
            type: "POST",
            url: "CustomerInfo.aspx/DisplayData",
            data: JSON.stringify({ cusId: cusId }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                if (result.d) {
                    var customer = result.d;
                    for (var i = 0; i < customer.length; i++) {
                        $('.cusId').val(customer[i].cusId);
                        $('.cusName').val(customer[i].cusName);
                        $('.tel').val(customer[i].tel);
                        $('#<%=txtCusTypeUpdate.ClientID %>').find('option[value=' + customer[i].cusType + ']').prop('selected', true);
                        $('#<%=txtGenderUpdate.ClientID %>').find('option[value=' + customer[i].gender + ']').prop('selected', true);
                        $('#<%=txtCusTypeUpdate.ClientID %>').material_select();
                        $('#<%=txtGenderUpdate.ClientID %>').material_select();
                    }
                }
            },
            failure: function (xmlhttprequest, textstatus, errorthrown) {
                sweetAlert("Oops...", errorthrown, "error");
            },
        });
    }

    //function clearTextBox
    function clearText() {
        var select = $('select');
        select.prop('selectedIndex', 0);
        select.material_select();
        $('.cusId').val("");
        $('.cusName').val("");
        $('.tel').val("");
    }

    $('.modal').modal();
    $('select').material_select();

    $("#modal-add").modal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        ready: function (modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
            maxId();
        },
        complete: function () { }
    });
});