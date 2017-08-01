<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TableInfo.aspx.cs" Inherits="KTV_MS.TableInfo" validateRequest="false" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modal {
            min-height: 30%;
            max-width: 80%;
            background-color: unset;
            bottom: unset;
        }

        .container {
            width: 80%;
            max-width: initial;
            > .row;

        {
            margin: 0;
            > .col;

        {
            padding: 0;
        }

        }
        }

        .tabs-icon {
            font-size: 10px;
            overflow: hidden;
        }

            .tabs-icon i {
                display: block;
                margin-top: 5px;
                margin-bottom: -15px;
                font-size: 24px;
            }

            .tabs-icon a.active {
                background-color: #F3F3F3;
                text-decoration: none;
            }
        /* OVERWRITE MATERIAL CSS MIN WIDTH FOR MOBILE */
        .tabs .tab {
            min-width: 50px !important;
        }

        .tabs .tab-hide {
            display: none;
        }

        .no-pd {
            padding: 0 !important;
        }

        ul li a:hover {
            text-decoration: none;
            color: darkslategrey;
        }

        ul li a {
            font-family: 'Khmer OS Freehand';
        }

        .tabs .tab a {
            color: #00bcd4;
            height: 55px;
        }

        .tabs .indicator {
            background-color: white;
        }

        .tabs {
            height: 55px;
        }

        thead tr td {
            font-family: 'Khmer OS Freehand';
        }

        hr.style3 {
            border-top: 1px dashed #26a69a;
        }

        #txtSearchFoodCate {
            font-family: 'Khmer OS Freehand';
        }

        #tableInfo-list {
            display: none;
        }
        .loader {
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
            margin: 0 auto;
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }


        /* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}
    </style>

    <br />
    <br />
    <div class="row">
    <a href="Data.aspx" class="btn-floating btn-large waves-effect waves-light teal lighten-1" style="margin-right: 20px;"><i class="material-icons">arrow_back</i></a>
    <a class="waves-effect waves-light btn btn-large form-label" href="#modal-add" id="open-modal"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
    </div>
    <br />

    <div class="row">
        <div class="input-field col s2">
            <label​ class="form-label">បង្ហាញចំនួនទិន្ន័យ</label​>
            <select class="form-label show-rows">
                <option value="5">០៥</option>
                <option value="10">១០</option>
                <option value="15">១៥</option>
            </select>
        </div>

        <div class="input-field col s5 offset-s5">
            <i class="material-icons prefix" style="color:#26a69a;">search</i>
            <asp:TextBox ID="txtSearchVal" runat="server" CssClass="search-val form-label​"></asp:TextBox>
            <label for="icon_prefix" class="form-label">ស្វែងរក</label>
        </div>
    </div>
    
    <div class="row">
        <table class="striped" id="tableInfo-table">
            <thead>
                <tr class="th-label">
                    <th>
                        លេខកូដតុ
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="tableId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="tableId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ឈ្មោះតុ
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="tableName">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="tableName">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ប្រភេទតុ
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="tableType">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="tableType">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>សកម្មភាព</th>
                </tr>
            </thead>
            <tbody id="table-list" class="animate-bottom"></tbody>
        </table>
        <br />
        <div class="row">
            <div class="col s12">
                <div class="card-panel teal lighten-1">
                    <span class="white-text form-label">ទិន្ន័យសរុប ៖ <span id="totalData"></span></span>
                </div>
            </div>
        </div>
    </div>
    <div class="loader"></div>

  <!-- Modal Add -->
  <div id="modal-add" class="modal">
    <div class="modal-content">
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលពត៌មានតុ</h4>
        <hr class="style3"/><br />
        
        <form class="formValidate" id="formValidate">
            <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-tableId" data-error="wrong" data-success="right">លេខកូដតុ</label>
                <asp:TextBox ID="txtTableId" runat="server" CssClass="tableId" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-tableName">ឈ្មោះតុ</label>
                <asp:TextBox ID="txtTableName" runat="server" CssClass="tableName form-label"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="txtTableType" runat="server" CssClass="form-label tableType">
                    <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                    <asp:ListItem Text ="VIP" Value ="vip"></asp:ListItem>
                    <asp:ListItem Text ="ធម្មតា" Value ="ធម្មតា"></asp:ListItem>
                    </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ប្រភេទតុ</label>
            </div>
        </div>
        <hr class="style3"/> 
        <div class="row">
            <button class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                <i class="material-icons right">loop</i>
            </button>
            <button type="button" id="insert-data" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
                <i class="material-icons right">send</i>
            </button>
        </div>
        </form>
        
    </div>
  </div>
  <%-- End modal add --%>

    <!-- Modal Update -->
  <div id="modal-update" class="modal">
    <div class="modal-content">
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែពត៌មានតុ</h4>
        <hr class="style3"/><br />
        <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-tableId" data-error="wrong" data-success="right">លេខកូដតុ</label>
                <asp:TextBox ID="txtTableIdUpdate" runat="server" CssClass="tableId" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-tableName">ឈ្មោះតុ</label>
                <asp:TextBox ID="txtTableNameUpdate" runat="server" CssClass="cusName form-label"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="txtTableTypeUpdate" runat="server" CssClass="form-label tableType">
                    <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                    <asp:ListItem Text ="VIP" Value ="vip"></asp:ListItem>
                    <asp:ListItem Text ="ធម្មតា" Value ="ធម្មតា"></asp:ListItem>
                    </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ប្រភេទតុ</label>
            </div>
        </div>
        <hr class="style3"/> 
        <div class="row">
            <button type="button" id="reset-update" class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">កំណត់ឡើងវិញ
                <i class="material-icons right">loop</i>
            </button>
            <button type="button" id="update-data" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">កែប្រែទិន្ន័យ
                <i class="material-icons right">send</i>
            </button>
        </div>
    </div>
  </div>

  <script>
      $(document).ready(function () {
          
            var tableArr = [];
            var showRows = $(".show-rows").val();
            //window load
            $(window).load(function () {
                displayAllDataFromDB();
                setTimeout(function () {
                    $(".loader").css("display", "none");
                    $("#table-list").show();
                    showRow = 5;
                    var field = "tableId";
                    displayShortDESC(showRows, field);
                    document.getElementById("totalData").innerHTML = tableArr.length;
                }, 1000);
            });

            //show row
            $('.show-rows').on('change', function () {
                showRows = $(".show-rows option:selected").val();
                var field = "tableId";
                displayShortDESC(showRows, field);
            });

            //ASC 
            $('.asc').click(function () {
                var shortField = this.value;
                displayShortASC(showRows, shortField);
            });

            //DESC
            $('.desc').click(function () {
                var shortField = this.value;
                displayShortDESC(showRows, shortField);
            });

            //function displayAllDataFromDB
            function displayAllDataFromDB() {
                $.ajax({
                    type: "POST",
                    url: "TableInfo.aspx/DisplayAllData",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            tableArr = result.d;
                            return tableArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //displayShortDESC
            function displayShortDESC(showRows, field) {
                var tableDESC = tableArr.sort(function (a, b) {
                    if (field == "tableId") {
                        if (a.tableId < b.tableId)
                            return 1;
                        if (a.tableId > b.tableId)
                            return -1;
                    } else if (field == "tableName") {
                        if (a.tableName < b.tableName)
                            return 1;
                        if (a.tableName > b.tableName)
                            return -1;
                    } else if (field == "tableType") {
                        if (a.tableType < b.tableType)
                            return 1;
                        if (a.tableType > b.tableType)
                            return -1;
                    }
                });
                var tableLimit = tableDESC.slice(0, showRows);
                $('#table-list').html("");
                for (var i = 0; i < tableLimit.length; i++) {
                    $('#table-list').append(
                        '<tr>' +
                            '<td>' + tableLimit[i].tableId + '</td>' +
                            '<td>' + tableLimit[i].tableName + '</td>' +
                            '<td>' + tableLimit[i].tableType + '</td>' +
                            '<td>' +
                            '<button value=' + tableLimit[i].tableId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + tableLimit[i].tableId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortASC(showRows, field) {
                var tableASC = tableArr.sort(function (a, b) {
                    if (field == "tableId") {
                        if (a.tableId < b.tableId)
                            return -1;
                        if (a.tableId > b.tableId)
                            return 1;
                    } else if (field == "tableName") {
                        if (a.tableName < b.tableName)
                            return -1;
                        if (a.tableName > b.tableName)
                            return 1;
                    } else if (field == "tableType") {
                        if (a.tableType < b.tableType)
                            return -1;
                        if (a.tableType > b.tableType)
                            return 1;
                    }
                });
                var tableLimit = tableASC.slice(0, showRows);
                $('#table-list').html("");
                for (var i = 0; i < tableLimit.length; i++) {
                    $('#table-list').append(
                        '<tr>' +
                            '<td>' + tableLimit[i].tableId + '</td>' +
                            '<td>' + tableLimit[i].tableName + '</td>' +
                            '<td>' + tableLimit[i].tableType + '</td>' +
                            '<td>' +
                            '<button value=' + tableLimit[i].tableId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + tableLimit[i].tableId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //search data
            $('#<%=txtSearchVal.ClientID %>').keyup(function () {
                var searchVal = $('#<%=txtSearchVal.ClientID %>').val();
                if (searchVal != "" || searchVal != null) {
                    var filtertable = tableArr.filter(function (obj) {
                        var data = obj.tableId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.tableName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.tableType.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#table-list').html("");
                    for (var i = 0; i < filtertable.length; i++) {
                        $('#table-list').append(
                            '<tr>' +
                                '<td>' + filtertable[i].tableId + '</td>' +
                                '<td>' + filtertable[i].tableName + '</td>' +
                                '<td>' + filtertable[i].tableType + '</td>' +
                                '<td>' +
                                '<button value=' + filtertable[i].tableId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filtertable[i].tableId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                } else {
                    displayDataLimit(showRows);
                }
            });

            //current row update
            $(document).on("click", "#tableInfo-table tr #update", function (e) {
                var tableId = $(this).closest('tr').children('td:first').text();
                if (tableId != "" || tableId != null) {
                    $(".lbl-tableId").addClass("active");
                    $(".lbl-tableName").addClass("active");
                    $('#modal-update').modal('open');
                    var filtertable = tableArr.filter(function (obj) {
                        return obj.tableId.toLowerCase().indexOf(tableId.toLowerCase()) > -1;
                    });
                    if (filtertable.length > 0) {
                        for (var i = 0; i < filtertable.length; i++) {
                            $('#<%=txtTableIdUpdate.ClientID %>').val(filtertable[i].tableId);
                            $('#<%=txtTableNameUpdate.ClientID %>').val(filtertable[i].tableName);
                            $('#<%=txtTableTypeUpdate.ClientID %>').find('option[value=' + filtertable[i].tableType + ']').prop('selected', true);
                            $('#<%=txtTableTypeUpdate.ClientID %>').material_select();
                        }
                    }
                }
            });

            //current row delete
            $(document).on("click", "#tableInfo-table tr #delete-data", function (e) {
                var tableId = $(this).closest('tr').children('td:first').text();
                if (tableId != "" || tableId != null) {
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
                            deleteData(tableId);
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //reset update
            $("#reset-update").click(function () {
                $(".lbl-tableId").addClass("active");
                $(".lbl-tableName").addClass("active");
                var tableId = $('.tableId').val();
                if (tableId != "" || tableId != null) {
                    displayData(tableId);
                }
            });

            //insert data
            $("#insert-data").click(function () {
                var tableId = $('#<%=txtTableId.ClientID %>').val();
                var tableName = $('#<%=txtTableName.ClientID %>').val();
                var tableType = $('#<%=txtTableType.ClientID %> option:selected').val();
                insert(tableId, tableName, tableType);
            });

            //update data
            $("#update-data").click(function () {
                var tableId = $('#<%=txtTableIdUpdate.ClientID %>').val();
                    var tableName = $('#<%=txtTableNameUpdate.ClientID %>').val();
                    var tableType = $('#<%=txtTableTypeUpdate.ClientID %> option:selected').val();
                    update(tableId, tableName, tableType);
                });

            //function insert
            function insert(tableId, tableName,tableType) {
                $.ajax({
                    type: "POST",
                    url: "TableInfo.aspx/InsertData",
                    data: JSON.stringify({
                        tableId: tableId,
                        tableName: tableName,
                        tableType: tableType
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
                        $(".tableId").val(result.d);
                        $(".lbl-tableId").addClass("active");
                        displayAllDataFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "tableId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = tableArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function update
            function update(tableId, tableName, tableType) {
                $.ajax({
                    type: "POST",
                    url: "TableInfo.aspx/UpdateData",
                    data: JSON.stringify({
                        tableId: tableId,
                        tableName: tableName,
                        tableType: tableType
                    }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d = "success") {
                            swal({
                                title: "កែប្រែបានជោគជ័យ!",
                                //text: "you clicked the button!",
                                type: "success",
                                showcancelbutton: false,
                                timer: 1500,
                                closeonconfirm: false,
                                closeoncancel: false
                            });
                            $('#modal-update').modal('close');
                            clearText();
                            displayAllDataFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "tableId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = tableArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function delete
            function deleteData(tableId) {
                $.ajax({
                    type: "POST",
                    url: "TableInfo.aspx/DeleteData",
                    data: JSON.stringify({
                        tableId: tableId
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
                            $('#modal-update').modal('close');
                            displayAllDataFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "tableId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = tableArr.length;
                            }, 500);
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
                    url: "TableInfo.aspx/WindowLoad",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        clearText();
                        $(".tableId").val(result.d);
                        $(".lbl-tableId").addClass("active");
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
                $('.tableId').val("");
                $('.tableName').val("");
            }

            $('.modal').modal();
            $('select').material_select();

            $("#open-modal").click(function () {
                $("#modal-add").modal('open');
            });

            $("#modal-add").modal({
                dismissible: true,
                ready: function (modal, trigger) {
                    maxId();
                },
                complete: function () { }
            });
        });
    </script>  

</asp:Content>
