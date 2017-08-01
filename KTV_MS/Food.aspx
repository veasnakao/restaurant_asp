<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="KTV_MS.Food" %>
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

        #food-list {
            display: none;
        }
    </style>
    <br />
    <br />
    <div class="row">
    <a href="Data.aspx" class="btn-floating btn-large waves-effect waves-light teal lighten-1" style="margin-right: 20px;"><i class="material-icons">arrow_back</i></a>
    <a class="waves-effect waves-light btn btn-large form-label" href="#modal-insert"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
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
        <table class="striped" id="food-table">
            <thead>
                <tr class="th-label">
                    <th>
                        លេខម្ហូប
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="foodId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="foodId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ឈ្មោះម្ហូប
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="foodName">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="foodName">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ក្រុមម្ហូប
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="foodCateId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="foodCateId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ខ្នាត
                        <button type="button" class="btn-floating waves-effect waves-light asc" value="foodUnitId">
                            <i class="material-icons right">arrow_upward</i>
                        </button>
                        <button type="button" class="btn-floating waves-effect waves-light desc" value="foodUnitId">
                            <i class="material-icons right">arrow_downward</i>
                        </button>
                    </th>
                    <th>ចំនួន</th>
                    <th>តម្លៃ</th>
                    <th>សកម្មភាព</th>
                </tr>
            </thead>
            <tbody id="food-list" class="animate-bottom"></tbody>
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
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលពត៌មានម្ហូប</h4>
        <hr class="style3"/><br />
        
        <form class="formValidate" id="formValidate">
            <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-foodId" data-error="wrong" data-success="right">លេខកូដម្ហូប</label>
                <asp:TextBox ID="txtFoodId" runat="server" CssClass="cusId" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-foodName">ឈ្មោះម្ហូប</label>
                <asp:TextBox ID="txtFoodName" runat="server" CssClass="cusName form-label"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlFoodCate" runat="server" CssClass="form-label">
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ក្រុមម្ហូប</label>
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlFoodUnit" runat="server" CssClass="form-label">
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
            <button type="button" id="insert-food" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
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
        <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែពត៌មានម្ហូប</h4>
        <hr class="style3"/><br />
        <div class="row">
            <div class="input-field col s6">
                <label class="form-label lbl-foodId" data-error="wrong" data-success="right">លេខកូដម្ហូប</label>
                <asp:TextBox ID="txtFoodIdUpdate" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="input-field col s6">
                <label class="form-label lbl-foodName">ឈ្មោះម្ហូប</label>
                <asp:TextBox ID="txtFoodNameUpdate" runat="server" CssClass="form-label"></asp:TextBox> 
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlFoodCateUpdate" runat="server" CssClass="form-label">
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ក្រុមម្ហូប</label>
            </div>
            <div class="input-field col s6">
                <asp:DropDownList ID="ddlFoodUnitUpdate" runat="server" CssClass="form-label">
                </asp:DropDownList>
                <label ​style="font-family:'Khmer OS Freehand'">ក្រុមម្ហូប</label>
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
            <button type="button" id="update-food" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">កែប្រែទិន្ន័យ
                <i class="material-icons right">send</i>
            </button>
        </div>
    </div>
  </div>

    <script>
        $(document).ready(function () {
            $('.modal').modal();
            $('select').material_select();
            var foodArr = [];
            var foodCateArr = [];
            var foodUnitArr = [];
            var showRows = $(".show-rows").val();

            //window load
            $(window).load(function () {
                displayAllFoodFromDB();
                displayAllFoodCateFromDB();
                displayAllFoodUnitFromDB();
                setTimeout(function () {
                    bindFoodCate();
                    bindFoodUnit();
                    $(".loader").css("display", "none");
                    $("#food-list").show();
                    showRows = 5;
                    var field = "foodId";
                    displayShortDESC(showRows, field);
                    document.getElementById("totalData").innerHTML = foodArr.length;
                }, 1000);
            });

            //show row
            $('.show-rows').on('change', function () {
                showRows = $(".show-rows option:selected").val();
                var field = "foodId";
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
            function displayAllFoodFromDB() {
                $.ajax({
                    type: "POST",
                    url: "Food.aspx/DisplayAllFood",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            foodArr = result.d;
                            return foodArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function displayAllFoodCateFromDB
            function displayAllFoodCateFromDB() {
                $.ajax({
                    type: "POST",
                    url: "Food.aspx/DisplayAllFoodCate",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            foodCateArr = result.d;
                            return foodCateArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function displayAllFoodUnitFromDB
            function displayAllFoodUnitFromDB() {
                $.ajax({
                    type: "POST",
                    url: "Food.aspx/DisplayAllFoodUnit",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            foodUnitArr = result.d;
                            return foodUnitArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //displayFoodCate
            function bindFoodCate() {
                if (foodCateArr.length > 0) {
                    var ddlFoodCate = $('#<%=ddlFoodCate.ClientID %>');
                    var ddlFoodCateUpdate = $('#<%=ddlFoodCateUpdate.ClientID %>');
                    ddlFoodCate.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < foodCateArr.length; i++) {
                        ddlFoodCate.append(
                            '<option value="' + foodCateArr[i].foodCateId + '">' + foodCateArr[i].foodCateName + '</option>'
                        );
                    }
                    ddlFoodCateUpdate.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < foodCateArr.length; i++) {
                        ddlFoodCateUpdate.append(
                            '<option value="' + foodCateArr[i].foodCateId + '">' + foodCateArr[i].foodCateName + '</option>'
                        );
                    }
                }
            }

            //displayFoodCate
            function bindFoodUnit() {
                if (foodUnitArr.length > 0) {
                    var ddlFoodUnit = $('#<%=ddlFoodUnit.ClientID %>');
                    var ddlFoodUnitUpdate = $('#<%=ddlFoodUnitUpdate.ClientID %>');
                    ddlFoodUnit.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < foodUnitArr.length; i++) {
                        ddlFoodUnit.append(
                            '<option value="' + foodUnitArr[i].foodUnitId + '">' + foodUnitArr[i].foodUnitName + '</option>'
                        );
                    }
                    ddlFoodUnitUpdate.append('<option value="">សូមជ្រើសរើស</option>');
                    for (var i = 0; i < foodUnitArr.length; i++) {
                        ddlFoodUnitUpdate.append(
                            '<option value="' + foodUnitArr[i].foodUnitId + '">' + foodUnitArr[i].foodUnitName + '</option>'
                        );
                    }
                }
            }

            //displayShortDESC
            function displayShortDESC(showRows, field) {
                var foodDESC = foodArr.sort(function (a, b) {
                    if (field == "foodId") {
                        if (a.foodId < b.foodId)
                            return 1;
                        if (a.foodId > b.foodId)
                            return -1;
                    } else if (field == "foodName") {
                        if (a.foodName < b.foodName)
                            return 1;
                        if (a.foodName > b.foodName)
                            return -1;
                    } else if (field == "foodCateId") {
                        if (a.foodCateId < b.foodCateId)
                            return 1;
                        if (a.foodCateId > b.foodCateId)
                            return -1;
                    } else if (field == "foodUnitId") {
                        if (a.foodUnitId < b.foodUnitId)
                            return 1;
                        if (a.foodUnitId > b.foodUnitId)
                            return -1;
                    }
                });
                var foodLimit = foodDESC.slice(0, showRows);
                $('#food-list').html("");
                for (var i = 0; i < foodLimit.length; i++) {
                    $('#food-list').append(
                        '<tr>' +
                            '<td>' + foodLimit[i].foodId + '</td>' +
                            '<td>' + foodLimit[i].foodName + '</td>' +
                            '<td>' + foodLimit[i].foodCateName + '</td>' +
                            '<td>' + foodLimit[i].foodUnitName + '</td>' +
                            '<td>' + foodLimit[i].qty + '</td>' +
                            '<td>' + foodLimit[i].price + '</td>' +
                            '<td>' +
                            '<button value=' + foodLimit[i].foodId + ' type="button" class="btn-floating waves-effect waves-light" id="update-food" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + foodLimit[i].foodId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-food">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortASC(showRows, field) {
                var foodASC = foodArr.sort(function (a, b) {
                    if (field == "foodId") {
                        if (a.foodId < b.foodId)
                            return -1;
                        if (a.foodId > b.foodId)
                            return 1;
                    } else if (field == "foodName") {
                        if (a.foodName < b.foodName)
                            return -1;
                        if (a.foodName > b.foodName)
                            return 1;
                    } else if (field == "foodCateId") {
                        if (a.foodCateId < b.foodCateId)
                            return -1;
                        if (a.foodCateId > b.foodCateId)
                            return 1;
                    } else if (field == "foodUnitId") {
                        if (a.foodUnitId < b.foodUnitId)
                            return -1;
                        if (a.foodUnitId > b.foodUnitId)
                            return 1;
                    }
                });
                var foodLimit = foodASC.slice(0, showRows);
                $('#food-list').html("");
                for (var i = 0; i < foodLimit.length; i++) {
                    $('#food-list').append(
                        '<tr>' +
                            '<td>' + foodLimit[i].foodId + '</td>' +
                            '<td>' + foodLimit[i].foodName + '</td>' +
                            '<td>' + foodLimit[i].foodCateName + '</td>' +
                            '<td>' + foodLimit[i].foodUnitName + '</td>' +
                            '<td>' + foodLimit[i].qty + '</td>' +
                            '<td>' + foodLimit[i].price + '</td>' +
                            '<td>' +
                            '<button value=' + foodLimit[i].foodId + ' type="button" class="btn-floating waves-effect waves-light" id="update-food" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + foodLimit[i].foodId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-food">' +
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
                    var filterFood = foodArr.filter(function (obj) {
                        var data = obj.foodId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.foodName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.foodCateName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.foodUnitName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#food-list').html("");
                    for (var i = 0; i < filterFood.length; i++) {
                        $('#food-list').append(
                            '<tr>' +
                                '<td>' + filterFood[i].foodId + '</td>' +
                                '<td>' + filterFood[i].foodName + '</td>' +
                                '<td>' + filterFood[i].foodCateName + '</td>' +
                                '<td>' + filterFood[i].foodUnitName + '</td>' +
                                '<td>' + filterFood[i].qty + '</td>' +
                                '<td>' + filterFood[i].price + '</td>' +
                                '<td>' +
                                '<button value=' + filterFood[i].foodId + ' type="button" class="btn-floating waves-effect waves-light" id="update-food" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filterFood[i].foodId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-food">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                } else {
                    displayFoodLimit(showRows);
                }
            });

            //current row update
            $(document).on("click", "#food-table tr #update-food", function (e) {
                var foodId = $(this).closest('tr').children('td:first').text();
                if (foodId != "" || foodId != null) {
                    $(".lbl-foodId").addClass("active");
                    $(".lbl-foodName").addClass("active");
                    $(".lbl-qty").addClass("active");
                    $(".lbl-price").addClass("active");
                    
                    var filterFood = foodArr.filter(function (obj) {
                        return obj.foodId.toLowerCase().indexOf(foodId.toLowerCase()) > -1;
                    });
                    if (filterFood.length > 0) {
                        $('#modal-update').modal('open');
                        for (var i = 0; i < filterFood.length; i++) {
                            var foodCateId = filterFood[i].foodCateId;
                            var foodUnitId = filterFood[i].foodUnitId;
                            $('#<%=txtFoodIdUpdate.ClientID %>').val(filterFood[i].foodId);
                            $('#<%=txtFoodNameUpdate.ClientID %>').val(filterFood[i].foodName);
                            $('#<%=txtQtyUpdate.ClientID %>').val(filterFood[i].qty);
                            $('#<%=txtPriceUpdate.ClientID %>').val(filterFood[i].price);
                            $("#<%=ddlFoodCateUpdate.ClientID%>").val(foodCateId);
                            $("#<%=ddlFoodUnitUpdate.ClientID%>").val(foodUnitId);
                            $('#<%=ddlFoodCateUpdate.ClientID %>').material_select();
                            $('#<%=ddlFoodUnitUpdate.ClientID %>').material_select();
                        }
                    }
                }
            });

            //current row delete
            $(document).on("click", "#food-table tr #delete-food", function (e) {
                var foodId = $(this).closest('tr').children('td:first').text();
                if (foodId != "" || foodId != null) {
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
                            deleteFood(foodId);
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //reset update
            $("#reset-update").click(function () {
                $(".lbl-foodId").addClass("active");
                $(".lbl-foodName").addClass("active");
                $(".lbl-qty").addClass("active");
                $(".lbl-price").addClass("active");
                var foodId = $('#<%=txtFoodId.ClientID %>').val();
                if (foodId != "" || foodId != null) {
                    displayFood(foodId);
                }
            });

            //insert data
            $("#insert-food").click(function () {
                insertFood();
            });

            //update foodCate key enter
            $('#<%=txtPrice.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    insertFood();
                }
            });

            function insertFood(){
                var foodId = $('#<%=txtFoodId.ClientID %>').val();
                var foodName = $('#<%=txtFoodName.ClientID %>').val();
                var foodCate = $('#<%=ddlFoodCate.ClientID %> option:selected').val();
                var foodUnit = $('#<%=ddlFoodUnit.ClientID %> option:selected').val();
                var qty = $('#<%=txtQty.ClientID %>').val();
                var price = $('#<%=txtPrice.ClientID %>').val();
                insert(foodId, foodName, foodCate, foodUnit, qty, price);
            }

            //update data
            $("#update-food").click(function () {
                updateFood();
            });

            //update foodCate key enter
            $('#<%=txtPriceUpdate.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    updateFood();
                }
            });

            function updateFood() {
                var foodId = $('#<%=txtFoodIdUpdate.ClientID %>').val();
                var fooName = $('#<%=txtFoodNameUpdate.ClientID %>').val();
                var foodCate = $('#<%=ddlFoodCateUpdate.ClientID %> option:selected').val();
                var foodUnit = $('#<%=ddlFoodUnitUpdate.ClientID %> option:selected').val();
                var qty = $('#<%=txtQtyUpdate.ClientID %>').val();
                var price = $('#<%=txtPriceUpdate.ClientID %>').val();
                update(foodId, fooName, foodCate, foodUnit, qty, price);
            }

            //function insert
            //foodId, foodName, foodCate, foodUnit, qty, price
            function insert(foodId, foodName, foodCate, foodUnit, qty, price) {
                $.ajax({
                    type: "POST",
                    url: "Food.aspx/InsertFood",
                    data: JSON.stringify({
                        foodId: foodId,
                        foodName: foodName,
                        foodCateId: foodCate,
                        foodUnitId: foodUnit,
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
                        $('#<%=txtFoodId.ClientID %>').val(result.d);
                        $(".lbl-foodId").addClass("active");
                        displayAllFoodFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "foodId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = foodArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function update
            function update(foodId, foodName, foodCate, foodUnit, qty, price) {
                $.ajax({
                    type: "POST",
                    url: "Food.aspx/UpdateFood",
                    data: JSON.stringify({
                        foodId: foodId,
                        foodName: foodName,
                        foodCateId: foodCate,
                        foodUnitId: foodUnit,
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
                            displayAllFoodFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "cusId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = foodArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function delete
            function deleteFood(foodId) {
                $.ajax({
                    type: "POST",
                    url: "Food.aspx/DeleteFood",
                    data: JSON.stringify({
                        foodId: foodId
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
                            displayAllFoodFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "cusId";
                                displayShortDESC(showRows, field);
                                document.getElementById("totalData").innerHTML = foodArr.length;
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
                    url: "Food.aspx/WindowLoadFood",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        clearText();
                        $('#<%=txtFoodId.ClientID %>').val(result.d);
                        $(".lbl-foodId").addClass("active");
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
                $('#<%=txtFoodId.ClientID %>').val("");
                $('#<%=txtFoodName.ClientID %>').val("");
                $('#<%=txtQty.ClientID %>').val("");
                $('#<%=txtPrice.ClientID %>').val("");
                $('#<%=txtFoodId.ClientID %>').focus();
                $('#<%=txtFoodName.ClientID %>').focus();
                $('#<%=txtQty.ClientID %>').focus();
                $('#<%=txtPrice.ClientID %>').focus();
            }

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
