<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Drink.aspx.cs" Inherits="KTV_MS.Drink" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modal {
            min-height: 100%;
            max-width: 80%;
            background-color: unset;
            bottom: unset;
            box-shadow: none;
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
            animation-duration: 1s;
        }

        @-webkit-keyframes animatebottom {
            from {
                bottom: -100px;
                opacity: 0;
            }

            to {
                bottom: 0px;
                opacity: 1;
            }
        }

        @keyframes animatebottom {
            from {
                bottom: -100px;
                opacity: 0;
            }

            to {
                bottom: 0;
                opacity: 1;
            }
        }

        #drink-list {
            display: none;
        }
    </style>
    <br />
    <br />
    <div class="row">
    <a href="Data.aspx" class="btn-floating btn-large waves-effect waves-light teal lighten-1" style="margin-right: 20px;"><i class="material-icons">arrow_back</i></a>
     <button data-target="modal-insert" class="btn modal-trigger waves-effect waves-light btn btn-large form-label"><i class="material-icons right">add</i>បង្កើតថ្មី</button>
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
    
    <div class="row">
        <table class="striped" id="drink-table">
            <thead>
                <tr class="th-label">
                    <th>
                        លេខភេសជ្ជៈ
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="drinkId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="drinkId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ឈ្មោះភេសជ្ជៈ
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="drinkName">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="drinkName">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ក្រុមភេសជ្ជៈ
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="drinkCateId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="drinkCateId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ខ្នាត
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="drinkUnitId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="drinkUnitId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ចំនួន</th>
                    <th>តម្លៃ</th>
                    <th>សកម្មភាព</th>
                </tr>
            </thead>
            <tbody id="drink-list" class="animate-bottom"></tbody>
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
  <div id="modal-insert" class="modal">
    <div class="modal-content">
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលពត៌មានភេសជ្ជៈ</h4>
        <hr class="style3"/><br />
        
        <form class="formValidate" id="formValidate">
            <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-drinkId" data-error="wrong" data-success="right">លេខកូដភេសជ្ជៈ</label>
                <asp:TextBox ID="txtDrinkId" runat="server" CssClass="cusId" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-drinkName">ឈ្មោះភេសជ្ជៈ</label>
                <asp:TextBox ID="txtDrinkName" runat="server" CssClass="cusName form-label" aria-required="true"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlDrinkCate" runat="server" CssClass="form-label">
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ក្រុមភេសជ្ជៈ</label>
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlDrinkUnit" runat="server" CssClass="form-label">
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ខ្នាត</label>
            </div>
            <div class="input-field col s6">
                <label for="tel" class="form-label lbl-qty">ចំនួន</label>
                <asp:TextBox ID="txtQty" runat="server"></asp:TextBox> 
            </div>
                <div class="input-field col s6">
                <label for="tel" class="form-label lbl-price">តម្លៃ</label>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox> 
            </div>
        </div>
        <hr class="style3"/> 
        <div class="row">
            <button class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                <i class="material-icons right">loop</i>
            </button>
            <button type="button" id="insert-drink" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
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
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែពត៌មានភេសជ្ជៈ</h4>
        <hr class="style3"/><br />
        <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-drinkId" data-error="wrong" data-success="right">លេខកូដភេសជ្ជៈ</label>
                <asp:TextBox ID="txtDrinkIdUpdate" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-drinkName">ឈ្មោះភេសជ្ជៈ</label>
                <asp:TextBox ID="txtDrinkNameUpdate" runat="server" CssClass="form-label" aria-required="true"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlDrinkCateUpdate" runat="server" CssClass="form-label">
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ក្រុមភេសជ្ជៈ</label>
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlDrinkUnitUpdate" runat="server" CssClass="form-label">
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ក្រុមភេសជ្ជៈ</label>
            </div>
            <div class="input-field col s6">
                <label for="tel" class="form-label lbl-qty">ចំនួន</label>
                <asp:TextBox ID="txtQtyUpdate" runat="server"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <label for="tel" class="form-label lbl-price">ចំនួន</label>
                <asp:TextBox ID="txtPriceUpdate" runat="server"></asp:TextBox> 
            </div>
        </div>
        <hr class="style3"/> 
        <div class="row">
            <button type="button" id="reset-update" class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">កំណត់ឡើងវិញ
                <i class="material-icons right">loop</i>
            </button>
            <button type="button" id="update-drink" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">កែប្រែទិន្ន័យ
                <i class="material-icons right">send</i>
            </button>
        </div>
    </div>
  </div>

    <script>
        $(document).ready(function () {
            var drinkArr = [];
            var drinkCateArr = [];
            var drinkUnitArr = [];
            var showRows = $(".show-rows").val();

            //window load
            $(window).load(function () {
                displayAllDrinkFromDB();
                displayAllDrinkCateFromDB();
                displayAllDrinkUnitFromDB();
                setTimeout(function () {
                    bindDrinkCate();
                    bindDrinkUnit();
                    $(".loader").css("display", "none");
                    $("#drink-list").show();
                    showRows = 5;
                    var field = "drinkId";
                    displayShortDESC(showRows, field);
                    document.getElementById("totalData").innerHTML = drinkArr.length;
                }, 1000);
            });

            //show row
            $('.show-rows').on('change', function () {
                showRows = $(".show-rows option:selected").val();
                var field = "drinkId";
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
            function displayAllDrinkFromDB() {
                $.ajax({
                    type: "POST",
                    url: "Drink.aspx/DisplayAllDrink",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            drinkArr = result.d;
                            return drinkArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function displayAllDrinkCateFromDB
            function displayAllDrinkCateFromDB() {
                $.ajax({
                    type: "POST",
                    url: "Drink.aspx/DisplayAllDrinkCate",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            drinkCateArr = result.d;
                            return drinkCateArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function displayAllDrinkUnitFromDB
            function displayAllDrinkUnitFromDB() {
                $.ajax({
                    type: "POST",
                    url: "Drink.aspx/DisplayAllDrinkUnit",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            drinkUnitArr = result.d;
                            return drinkUnitArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //displayDrinkCate
            function bindDrinkCate() {
                if (drinkCateArr.length > 0) {
                    var ddlDrinkCate = $('#<%=ddlDrinkCate.ClientID %>');
                    var ddlDrinkCateUpdate = $('#<%=ddlDrinkCateUpdate.ClientID %>');
                    ddlDrinkCate.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < drinkCateArr.length; i++) {
                        ddlDrinkCate.append(
                            '<option value="' + drinkCateArr[i].drinkCateId + '">' + drinkCateArr[i].drinkCateName + '</option>'
                        );
                    }
                    ddlDrinkCateUpdate.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < drinkCateArr.length; i++) {
                        ddlDrinkCateUpdate.append(
                            '<option value="' + drinkCateArr[i].drinkCateId + '">' + drinkCateArr[i].drinkCateName + '</option>'
                        );
                    }
                }
            }

            //displayDrinkCate
            function bindDrinkUnit() {
                if (drinkUnitArr.length > 0) {
                    var ddlDrinkUnit = $('#<%=ddlDrinkUnit.ClientID %>');
                    var ddlDrinkUnitUpdate = $('#<%=ddlDrinkUnitUpdate.ClientID %>');
                    ddlDrinkUnit.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < drinkUnitArr.length; i++) {
                        ddlDrinkUnit.append(
                            '<option value="' + drinkUnitArr[i].drinkUnitId + '">' + drinkUnitArr[i].drinkUnitName + '</option>'
                        );
                    }
                    ddlDrinkUnitUpdate.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < drinkUnitArr.length; i++) {
                        ddlDrinkUnitUpdate.append(
                            '<option value="' + drinkUnitArr[i].drinkUnitId + '">' + drinkUnitArr[i].drinkUnitName + '</option>'
                        );
                    }
                }
            }

            //displayShortDESC
            function displayShortDESC(showRows, field) {
                var drinkDESC = drinkArr.sort(function (a, b) {
                    if (field == "drinkId") {
                        if (a.drinkId < b.drinkId)
                            return 1;
                        if (a.drinkId > b.drinkId)
                            return -1;
                    } else if (field == "drinkName") {
                        if (a.drinkName < b.drinkName)
                            return 1;
                        if (a.drinkName > b.drinkName)
                            return -1;
                    } else if (field == "drinkCateId") {
                        if (a.drinkCateId < b.drinkCateId)
                            return 1;
                        if (a.drinkCateId > b.drinkCateId)
                            return -1;
                    } else if (field == "drinkUnitId") {
                        if (a.drinkUnitId < b.drinkUnitId)
                            return 1;
                        if (a.drinkUnitId > b.drinkUnitId)
                            return -1;
                    }
                });
                var drinkLimit = drinkDESC.slice(0, showRows);
                $('#drink-list').html("");
                for (var i = 0; i < drinkLimit.length; i++) {
                    $('#drink-list').append(
                        '<tr>' +
                            '<td>' + drinkLimit[i].drinkId + '</td>' +
                            '<td>' + drinkLimit[i].drinkName + '</td>' +
                            '<td>' + drinkLimit[i].drinkCateName + '</td>' +
                            '<td>' + drinkLimit[i].drinkUnitName + '</td>' +
                            '<td>' + drinkLimit[i].qty + '</td>' +
                            '<td>' + drinkLimit[i].price + '</td>' +
                            '<td>' +
                            '<button value=' + drinkLimit[i].drinkId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drink" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + drinkLimit[i].drinkId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drink">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortASC(showRows, field) {
                var drinkASC = drinkArr.sort(function (a, b) {
                    if (field == "drinkId") {
                        if (a.drinkId < b.drinkId)
                            return -1;
                        if (a.drinkId > b.drinkId)
                            return 1;
                    } else if (field == "drinkName") {
                        if (a.drinkName < b.drinkName)
                            return -1;
                        if (a.drinkName > b.drinkName)
                            return 1;
                    } else if (field == "drinkCateId") {
                        if (a.drinkCateId < b.drinkCateId)
                            return -1;
                        if (a.drinkCateId > b.drinkCateId)
                            return 1;
                    } else if (field == "drinkUnitId") {
                        if (a.drinkUnitId < b.drinkUnitId)
                            return -1;
                        if (a.drinkUnitId > b.drinkUnitId)
                            return 1;
                    }
                });
                var drinkLimit = drinkASC.slice(0, showRows);
                $('#drink-list').html("");
                for (var i = 0; i < drinkLimit.length; i++) {
                    $('#drink-list').append(
                        '<tr>' +
                            '<td>' + drinkLimit[i].drinkId + '</td>' +
                            '<td>' + drinkLimit[i].drinkName + '</td>' +
                            '<td>' + drinkLimit[i].drinkCateName + '</td>' +
                            '<td>' + drinkLimit[i].drinkUnitName + '</td>' +
                            '<td>' + drinkLimit[i].qty + '</td>' +
                            '<td>' + drinkLimit[i].price + '</td>' +
                            '<td>' +
                            '<button value=' + drinkLimit[i].drinkId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drink" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + drinkLimit[i].drinkId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drink">' +
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
                    var filterDrink = drinkArr.filter(function (obj) {
                        var data = obj.drinkId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.drinkName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.drinkCateName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.drinkUnitName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#drink-list').html("");
                    for (var i = 0; i < filterDrink.length; i++) {
                        $('#drink-list').append(
                            '<tr>' +
                                '<td>' + filterDrink[i].drinkId + '</td>' +
                                '<td>' + filterDrink[i].drinkName + '</td>' +
                                '<td>' + filterDrink[i].drinkCateName + '</td>' +
                                '<td>' + filterDrink[i].drinkUnitName + '</td>' +
                                '<td>' + filterDrink[i].qty + '</td>' +
                                '<td>' + filterDrink[i].price + '</td>' +
                                '<td>' +
                                '<button value=' + filterDrink[i].drinkId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drink" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filterDrink[i].drinkId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drink">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                } else {
                    displayDrinkLimit(showRows);
                }
            });

            //current row update
            $(document).on("click", "#drink-table tr #update-drink", function (e) {
                var drinkId = $(this).closest('tr').children('td:first').text();
                if (drinkId != "" || drinkId != null) {
                    $(".lbl-drinkId").addClass("active");
                    $(".lbl-drinkName").addClass("active");
                    $(".lbl-qty").addClass("active");
                    $(".lbl-price").addClass("active");
                    
                    var filterDrink = drinkArr.filter(function (obj) {
                        return obj.drinkId.toLowerCase().indexOf(drinkId.toLowerCase()) > -1;
                    });
                    if (filterDrink.length > 0) {
                        $('#modal-update').modal('open');
                        for (var i = 0; i < filterDrink.length; i++) {
                            var drinkCateId = filterDrink[i].drinkCateId;
                            var drinkUnitId = filterDrink[i].drinkUnitId;
                            $('#<%=txtDrinkIdUpdate.ClientID %>').val(filterDrink[i].drinkId);
                            $('#<%=txtDrinkNameUpdate.ClientID %>').val(filterDrink[i].drinkName);
                            $('#<%=txtQtyUpdate.ClientID %>').val(filterDrink[i].qty);
                            $('#<%=txtPriceUpdate.ClientID %>').val(filterDrink[i].price);
                            $("#<%=ddlDrinkCateUpdate.ClientID%>").val(drinkCateId);
                            $("#<%=ddlDrinkUnitUpdate.ClientID%>").val(drinkUnitId);
                            $('#<%=ddlDrinkCateUpdate.ClientID %>').material_select();
                            $('#<%=ddlDrinkUnitUpdate.ClientID %>').material_select();
                        }
                    }
                }
            });

            //current row delete
            $(document).on("click", "#drink-table tr #delete-drink", function (e) {
                var drinkId = $(this).closest('tr').children('td:first').text();
                if (drinkId != "" || drinkId != null) {
                    swal({
                        title: "តើអ្នកពិតជាចង់លុបមែនទេ?",
                        //text: "You will not be able to recover this imaginary file!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "បាទ/ចាស",
                        cancelButtonText: "អត់ទេ",
                        closeOnConfirm: true,
                        closeOnCancel: false
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            deleteDrink(drinkId);
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //reset update
            $("#reset-update").click(function () {
                $(".lbl-drinkId").addClass("active");
                $(".lbl-drinkName").addClass("active");
                $(".lbl-qty").addClass("active");
                $(".lbl-price").addClass("active");
                var drinkId = $('#<%=txtDrinkId.ClientID %>').val();
                if (drinkId != "" || drinkId != null) {
                    displayDrink(drinkId);
                }
            });

            //insert data
            $("#insert-drink").click(function () {
                insertDrink();
            });

            //update drinkCate key enter
            $('#<%=txtPrice.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    insertDrink();
                }
            });

            function insertDrink(){
                var drinkId = $('#<%=txtDrinkId.ClientID %>').val();
                var drinkName = $('#<%=txtDrinkName.ClientID %>').val();
                var drinkCate = $('#<%=ddlDrinkCate.ClientID %> option:selected').val();
                var drinkUnit = $('#<%=ddlDrinkUnit.ClientID %> option:selected').val();
                var qty = $('#<%=txtQty.ClientID %>').val();
                var price = $('#<%=txtPrice.ClientID %>').val();
                insert(drinkId, drinkName, drinkCate, drinkUnit, qty, price);
            }

            //update data
            $("#update-drink").click(function () {
                updateDrink();
            });

            //update drinkCate key enter
            $('#<%=txtPriceUpdate.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    updateDrink();
                }
            });

            function updateDrink() {
                var drinkId = $('#<%=txtDrinkIdUpdate.ClientID %>').val();
                var fooName = $('#<%=txtDrinkNameUpdate.ClientID %>').val();
                var drinkCate = $('#<%=ddlDrinkCateUpdate.ClientID %> option:selected').val();
                var drinkUnit = $('#<%=ddlDrinkUnitUpdate.ClientID %> option:selected').val();
                var qty = $('#<%=txtQtyUpdate.ClientID %>').val();
                var price = $('#<%=txtPriceUpdate.ClientID %>').val();
                update(drinkId, fooName, drinkCate, drinkUnit, qty, price);
            }

            //function insert
            //drinkId, drinkName, drinkCate, drinkUnit, qty, price
            function insert(drinkId, drinkName, drinkCate, drinkUnit, qty, price) {
                $.ajax({
                    type: "POST",
                    url: "Drink.aspx/InsertDrink",
                    data: JSON.stringify({
                        drinkId: drinkId,
                        drinkName: drinkName,
                        drinkCateId: drinkCate,
                        drinkUnitId: drinkUnit,
                        qty: parseInt(qty),
                        price: parseFloat(price)
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
                        $('#<%=txtDrinkId.ClientID %>').val(result.d);
                        $(".lbl-drinkId").addClass("active");
                        displayAllDrinkFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "drinkId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = drinkArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function update
            function update(drinkId, drinkName, drinkCate, drinkUnit, qty, price) {
                $.ajax({
                    type: "POST",
                    url: "Drink.aspx/UpdateDrink",
                    data: JSON.stringify({
                        drinkId: drinkId,
                        drinkName: drinkName,
                        drinkCateId: drinkCate,
                        drinkUnitId: drinkUnit,
                        qty: parseInt(qty),
                        price: parseFloat(price)
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
                            displayAllDrinkFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "cusId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = drinkArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function delete
            function deleteDrink(drinkId) {
                $.ajax({
                    type: "POST",
                    url: "Drink.aspx/DeleteDrink",
                    data: JSON.stringify({
                        drinkId: drinkId
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
                            displayAllDrinkFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "cusId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = drinkArr.length;
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
                    url: "Drink.aspx/WindowLoadDrink",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        clearText();
                        $('#<%=txtDrinkId.ClientID %>').val(result.d);
                        $(".lbl-drinkId").addClass("active");
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
                $('#<%=txtDrinkId.ClientID %>').val("");
                $('#<%=txtDrinkName.ClientID %>').val("");
                $('#<%=txtQty.ClientID %>').val("");
                $('#<%=txtPrice.ClientID %>').val("");
                $('#<%=txtDrinkId.ClientID %>').focus();
                $('#<%=txtDrinkName.ClientID %>').focus();
                $('#<%=txtQty.ClientID %>').focus();
                $('#<%=txtPrice.ClientID %>').focus();
            }

            $('.modal').modal();
            $('select').material_select();
            $("#modal-insert").modal({
                dismissible: true,
                ready: function (modal, trigger) {
                    maxId();
                },
                complete: function () { }
            });
        });
    </script>
</asp:Content>
