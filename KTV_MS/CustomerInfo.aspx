<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="KTV_MS.CustomerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modal {
            max-height: 70%;
            max-width: 80%;
            background-color: unset;
            bottom: unset;
        }

        hr.style3 {
            border-top: 1px dashed #26a69a;
        }

        tr td {
            font-family: 'Khmer OS Freehand';
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

#customer-list{
    display:none;
}
    </style>
    <br />
    <br />
    <div class="row customerInfoPage">
    <a href="Data.aspx" class="btn-floating btn-large waves-effect waves-light teal lighten-1" style="margin-right: 20px;"><i class="material-icons">arrow_back</i></a>
    <a class="waves-effect waves-light btn btn-large form-label" href="#modal-add"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
    </div>
    <br />

    <div class="row customerInfoPage">
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
    
    <div class="row customerInfoPage">
        <table class="striped" id="customer-table">
            <thead>
                <tr class="th-label">
                    <th>
                        លេខកូដអតិថិជន
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="cusId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="cusId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ឈ្មោះអតិថិជន
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="cusName">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="cusName">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ភេទ
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="gender">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="gender">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ប្រភេទអតិថិជន
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="cusType">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="cusType">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>លេខទូរស័ព្ទ</th>
                    <th>សកម្មភាព</th>
                </tr>
            </thead>
            <tbody id="customer-list" class="animate-bottom"></tbody>
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
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលពត៌មានអតិថិជន</h4>
        <hr class="style3"/><br />
        
        <form class="formValidate" id="formValidate">
            <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-cusId" data-error="wrong" data-success="right">លេខកូដអតិថិជន</label>
                <asp:TextBox ID="txtCusId" runat="server" CssClass="cusId" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-cusName">ឈ្មោះអតិថិជន</label>
                <asp:TextBox ID="txtCusName" runat="server" CssClass="cusName form-label"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="txtGender" runat="server" CssClass="form-label gender">
                <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                <asp:ListItem Text ="ប្រុស" Value ="ប្រុស"></asp:ListItem>
                <asp:ListItem Text ="ស្រី" Value ="ស្រី"></asp:ListItem>
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ភេទ</label>
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="txtCusType" runat="server" CssClass="form-label cusType">
                    <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                    <asp:ListItem Text ="VIP" Value ="vip"></asp:ListItem>
                    <asp:ListItem Text ="ទូរទៅ" Value ="ទូរទៅ"></asp:ListItem>
                    </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ប្រភេទអតិថិជន</label>
            </div>
            <div class="input-field col s4">
                <label for="tel" class="form-label">លេខទូរស័ព្ទ</label>
                <asp:TextBox ID="txtTel" runat="server" CssClass="tel"></asp:TextBox> 
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
  <div id="modal-upadte" class="modal">
    <div class="modal-content">
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែពត៌មានអតិថិជន</h4>
        <hr class="style3"/><br />
        <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-cusId" data-error="wrong" data-success="right">លេខកូដអតិថិជន</label>
                <asp:TextBox ID="txtCusIdUpdate" runat="server" CssClass="cusId" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-cusName">ឈ្មោះអតិថិជន</label>
                <asp:TextBox ID="txtCusNameUpdate" runat="server" CssClass="cusName form-label" aria-required="true"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="txtGenderUpdate" runat="server" CssClass="form-label gender">
                <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                <asp:ListItem Text ="ប្រុស" Value ="ប្រុស"></asp:ListItem>
                <asp:ListItem Text ="ស្រី" Value ="ស្រី"></asp:ListItem>
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ភេទ</label>
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="txtCusTypeUpdate" runat="server" CssClass="form-label cusType">
                    <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                    <asp:ListItem Text ="VIP" Value ="vip"></asp:ListItem>
                    <asp:ListItem Text ="ទូរទៅ" Value ="ទូរទៅ"></asp:ListItem>
                    </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ប្រភេទអតិថិជន</label>
            </div>
            <div class="input-field col s4">
                <label for="tel" class="form-label lbl-tel">លេខទូរស័ព្ទ</label>
                <asp:TextBox ID="txtTelUpdate" runat="server" CssClass="tel"></asp:TextBox> 
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
            var customerArr = [];
            var showRows = $(".show-rows").val();

            //window load
            $(window).load(function () {
                displayAllDataFromDB();
                setTimeout(function () {
                    $(".loader").css("display", "none");
                    $("#customer-list").show();
                    showRow = 5;
                    var field = "cusId";
                    displayShortDESC(showRows, field);
                    document.getElementById("totalData").innerHTML = customerArr.length;
                }, 1000);
            });

            //show row
            $('.show-rows').on('change', function () {
                showRows = $(".show-rows option:selected").val();
                var field = "cusId";
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
                    url: "CustomerInfo.aspx/DisplayAllData",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            customerArr = result.d;
                            return customerArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //displayShortDESC
            function displayShortDESC(showRows, field) {
                var customerDESC = customerArr.sort(function (a, b) {
                    if (field == "cusId") {
                        if (a.cusId < b.cusId)
                            return 1;
                        if (a.cusId > b.cusId)
                            return -1;
                    } else if (field == "cusName") {
                        if (a.cusName < b.cusName)
                            return 1;
                        if (a.cusName > b.cusName)
                            return -1;
                    } else if (field == "gender") {
                        if (a.gender < b.gender)
                            return 1;
                        if (a.gender > b.gender)
                            return -1;
                    } else if (field == "cusType") {
                        if (a.cusType < b.cusType)
                            return 1;
                        if (a.cusType > b.cusType)
                            return -1;
                    }
                });
                var customerLimit = customerDESC.slice(0, showRows);
                $('#customer-list').html("");
                for (var i = 0; i < customerLimit.length; i++) {
                    $('#customer-list').append(
                        '<tr>' +
                            '<td>' + customerLimit[i].cusId + '</td>' +
                            '<td>' + customerLimit[i].cusName + '</td>' +
                            '<td>' + customerLimit[i].gender + '</td>' +
                            '<td>' + customerLimit[i].cusType + '</td>' +
                            '<td>' + customerLimit[i].tel + '</td>' +
                            '<td>' +
                            '<button value=' + customerLimit[i].cusId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + customerLimit[i].cusId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortASC(showRows, field) {
                var customerASC = customerArr.sort(function (a, b) {
                    if (field == "cusId") {
                        if (a.cusId < b.cusId)
                            return -1;
                        if (a.cusId > b.cusId)
                            return 1;
                    } else if (field == "cusName") {
                        if (a.cusName < b.cusName)
                            return -1;
                        if (a.cusName > b.cusName)
                            return 1;
                    } else if (field == "gender") {
                        if (a.gender < b.gender)
                            return -1;
                        if (a.gender > b.gender)
                            return 1;
                    } else if (field == "cusType") {
                        if (a.cusType < b.cusType)
                            return -1;
                        if (a.cusType > b.cusType)
                            return 1;
                    }
                });
                var customerLimit = customerASC.slice(0, showRows);
                $('#customer-list').html("");
                for (var i = 0; i < customerLimit.length; i++) {
                    $('#customer-list').append(
                        '<tr>' +
                            '<td>' + customerLimit[i].cusId + '</td>' +
                            '<td>' + customerLimit[i].cusName + '</td>' +
                            '<td>' + customerLimit[i].gender + '</td>' +
                            '<td>' + customerLimit[i].cusType + '</td>' +
                            '<td>' + customerLimit[i].tel + '</td>' +
                            '<td>' +
                            '<button value=' + customerLimit[i].cusId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + customerLimit[i].cusId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
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
                    var filterCus = customerArr.filter(function (obj) {
                        var data = obj.cusId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.cusName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.gender.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.cusType.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#customer-list').html("");
                    for (var i = 0; i < filterCus.length; i++) {
                        $('#customer-list').append(
                            '<tr>' +
                                '<td>' + filterCus[i].cusId + '</td>' +
                                '<td>' + filterCus[i].cusName + '</td>' +
                                '<td>' + filterCus[i].gender + '</td>' +
                                '<td>' + filterCus[i].cusType + '</td>' +
                                '<td>' + filterCus[i].tel + '</td>' +
                                '<td>' +
                                '<button value=' + filterCus[i].cusId + ' type="button" class="btn-floating waves-effect waves-light" id="update" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filterCus[i].cusId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-data">' +
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
            $(document).on("click", "#customer-table tr #update", function (e) {
                var cusId = $(this).closest('tr').children('td:first').text();
                if (cusId != "" || cusId != null) {
                    $(".lbl-cusId").addClass("active");
                    $(".lbl-cusName").addClass("active");
                    $(".lbl-tel").addClass("active");
                    $('#modal-upadte').modal('open');
                    var filterCus = customerArr.filter(function (obj) {
                        return obj.cusId.toLowerCase().indexOf(cusId.toLowerCase()) > -1;
                    });
                    if (filterCus.length > 0) {
                        for (var i = 0; i < filterCus.length; i++) {
                            $('#<%=txtCusIdUpdate.ClientID %>').val(filterCus[i].cusId);
                            $('#<%=txtCusNameUpdate.ClientID %>').val(filterCus[i].cusName);
                            $('#<%=txtGenderUpdate.ClientID %>').val(filterCus[i].gender);
                            $('#<%=txtCusTypeUpdate.ClientID %>').val(filterCus[i].cusType);
                            $('#<%=txtTelUpdate.ClientID %>').val(filterCus[i].tel);
                            $('#<%=txtCusTypeUpdate.ClientID %>').material_select();
                            $('#<%=txtGenderUpdate.ClientID %>').material_select();
                        }
                    }
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
                        displayAllDataFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "cusId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = customerArr.length;
                            }, 500);
                        }
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
                                title: "កែប្រែបានជោគជ័យ!",
                                //text: "you clicked the button!",
                                type: "success",
                                showcancelbutton: false,
                                timer: 1500,
                                closeonconfirm: false,
                                closeoncancel: false
                            });
                            $('#modal-upadte').modal('close');
                            clearText();
                            displayAllDataFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "cusId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = customerArr.length;
                            }, 500);
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
                            displayAllDataFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "cusId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = customerArr.length;
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
                dismissible: true,
                ready: function (modal, trigger) {
                    maxId();
                },
                complete: function () { }
            });
        });
    </script>

</asp:Content>
