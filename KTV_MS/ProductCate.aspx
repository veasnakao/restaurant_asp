<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductCate.aspx.cs" Inherits="KTV_MS.ProductCate" %>
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

        #foodCate-list {
            display: none;
        }

        #drinkCate-list {
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
        <div class="col">
            <a href="Setting.aspx" class="btn-floating btn-large waves-effect waves-light teal lighten-1" style="margin-right: 20px;"><i class="material-icons">arrow_back</i></a>
        </div>
        <div class="col s11 no-pd">
            <ul class="tabs tabs-icon tabs tab-demo-active z-depth-1 teal lighten-1">
                <li class="tab col s6">
                    <a href="#food-cate" class="white-text waves-effect waves-light active">
                        <i class="material-icons">restaurant_menu</i>ក្រុមម្ហូប
                    </a>
                </li>
                <li class="tab col s6">
                    <a href="#drink-cate" class="white-text waves-effect waves-light active">
                        <i class="material-icons">local_bar</i>ក្រុមភេសជ្ជៈ
                    </a>
                </li>
            </ul>

            <%-- foodCate --%>
            <div id="food-cate" class="col s12">
                <br />
                <div class="row">
                    <div class="col s12">
                        <a class="waves-effect waves-light btn btn-large form-label" href="#modal-insert-foodCate"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
                    </div>
                </div>

                <hr class="style3"/>
                <div class="row">
                    <div class="input-field col s2">
                        <label​ class="form-label">បង្ហាញចំនួនទិន្ន័យ</label​>
                        <select class="form-label show-rows-foodCate">
                            <option value="5">០៥</option>
                            <option value="10">១០</option>
                            <option value="15">១៥</option>
                        </select>
                    </div>

                    <div class="input-field col s5 offset-s5">
                        <i class="material-icons prefix" style="color:#26a69a;">search</i>
                        <asp:TextBox ID="txtSearchFoodCate" runat="server" CssClass="search-foodCate form-label​"></asp:TextBox>
                        <label for="icon_prefix" class="form-label">ស្វែងរក</label>
                    </div>
                </div>

                <table id="foodCate-table">
                    <thead>
                        <tr class="th-label">
                            <th>លេខកូដក្រុមម្ហូប
                                <button type="button" class="btn-floating waves-effect waves-light ascFoodCate" value="foodCateId">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descFoodCate" value="foodCateId">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>ឈ្មោះក្រុមម្ហូប
                                <button type="button" class="btn-floating waves-effect waves-light ascFoodCate" value="foodCateName">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descFoodCate" value="foodCateName">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>សកម្មភាព</th>
                        </tr>
                    </thead>
                    <tbody id="foodCate-list" class="animate-bottom"></tbody>
                </table>
                <br />
                <div class="row">
                    <div class="col s12">
                        <div class="card-panel teal lighten-1">
                            <span class="white-text form-label">ទិន្ន័យសរុប ៖ <span id="totalFoodCate"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <%-- end foodCate --%>

            <%-- drinkCate --%>
            <div id="drink-cate" class="col s12">
                <br />
                <div class="row">
                    <div class="col s12">
                        <a class="waves-effect waves-light btn btn-large form-label" href="#modal-insert-drinkCate"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
                    </div>
                </div>

                <hr class="style3"/>
                <div class="row">
                    <div class="input-field col s2">
                        <label​ class="form-label">បង្ហាញចំនួនទិន្ន័យ</label​>
                        <select class="form-label show-rows-drinkCate">
                            <option value="5">០៥</option>
                            <option value="10">១០</option>
                            <option value="15">១៥</option>
                        </select>
                    </div>

                    <div class="input-field col s5 offset-s5">
                        <i class="material-icons prefix" style="color:#26a69a;">search</i>
                        <asp:TextBox ID="txtSearchDrinkCate" runat="server" CssClass="search-drinkCate form-label​"></asp:TextBox>
                        <label for="icon_prefix" class="form-label">ស្វែងរក</label>
                    </div>
                </div>

                <table id="drinkCate-table">
                    <thead>
                        <tr class="th-label">
                            <th>លេខកូដក្រុមភេសជ្ជៈ
                                <button type="button" class="btn-floating waves-effect waves-light ascDrinkCate" value="drinkCateId">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descDrinkCate" value="drinkCateId">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>ឈ្មោះក្រុមភេសជ្ជៈ
                                <button type="button" class="btn-floating waves-effect waves-light ascDrinkCate" value="drinkCateName">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descDrinkCate" value="drinkCateName">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>សកម្មភាព</th>
                        </tr>
                    </thead>
                    <tbody id="drinkCate-list" class="animate-bottom"></tbody>
                </table>
                <br />
                <div class="row">
                    <div class="col s12">
                        <div class="card-panel teal lighten-1">
                            <span class="white-text form-label">ទិន្ន័យសរុប ៖ <span id="totalDrinkCate"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <%-- end drinkCate --%>
        </div>
    </div>
    <div class="loader"></div>

    <!-- Modal insert foodCate -->
    <div id="modal-insert-foodCate" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលក្រុមម្ហូប</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodCateId" data-error="wrong" data-success="right">លេខកូដក្រុមម្ហូប</label>
                        <asp:TextBox ID="txtFoodCateId" runat="server" CssClass="bevgCateId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodCateName">ឈ្មោះក្រុមម្ហូប</label>
                        <asp:TextBox ID="txtFoodCateName" runat="server" CssClass="bevgCateName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="insert-foodCate" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal insert foodCate --%>

    <!-- Modal update foodCate -->
    <div id="modal-update-foodCate" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែក្រុមម្ហូប</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodCateId" data-error="wrong" data-success="right">លេខកូដក្រុមម្ហូប</label>
                        <asp:TextBox ID="txtFoodCateIdUpdate" runat="server" CssClass="foodCateId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodCateName">ឈ្មោះក្រុមម្ហូប</label>
                        <asp:TextBox ID="txtFoodCateNameUpdate" runat="server" CssClass="foodCateName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button type="button" id="reset-update-foodCate" class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="update-foodCate" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">កែប្រែទិន្ន័យ
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal update food cate --%>

    <!-- Modal insert drinkCate -->
    <div id="modal-insert-drinkCate" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលក្រុមភេសជ្ជៈ</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkCateId" data-error="wrong" data-success="right">លេខកូដក្រុមភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkCateId" runat="server" CssClass="bevgCateId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkCateName">ឈ្មោះក្រុមភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkCateName" runat="server" CssClass="bevgCateName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="insert-drinkCate" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal insert drinkCate --%>

    <!-- Modal update drinkCate -->
    <div id="modal-update-drinkCate" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែក្រុមភេសជ្ជៈ</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkCateId" data-error="wrong" data-success="right">លេខកូដក្រុមភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkCateIdUpdate" runat="server" CssClass="drinkCateId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkCateName">ឈ្មោះក្រុមភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkCateNameUpdate" runat="server" CssClass="drinkCateName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button type="button" id="reset-update-drinkCate" class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="update-drinkCate" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">កែប្រែទិន្ន័យ
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal update drink cate --%>

    <script>
        $(document).ready(function () {
            $('select').material_select();
            $('.modal').modal();

            var foodCateArr = [];
            var drinkCateArr = [];
            var showRowsFoodCate = $(".show-rows-foodCate").val();
            var showRowsBevgCate = $(".show-rows-bevgCate").val();

            //window load
            $(window).load(function () {
                displayAllFoodCateFromDB();
                displayAllDrinkCateFromDB();
                setTimeout(function () {
                    $(".loader").css("display", "none");
                    $("#foodCate-list").show();
                    showRowsFoodCate = 5;
                    var fieldFood = "foodCateId";
                    displayShortFoodCateDESC(showRowsFoodCate, fieldFood);
                    document.getElementById("totalFoodCate").innerHTML = foodCateArr.length;

                    $("#drinkCate-list").show();
                    showRowsDrinkCate = 5;
                    var fieldDrink = "drinkCateId";
                    displayShortDrinkCateDESC(showRowsDrinkCate, fieldDrink);
                    document.getElementById("totalDrinkCate").innerHTML = drinkCateArr.length;
                }, 1000);
            });

            //show row
            $('.show-rows-foodCate').on('change', function () {
                showRowsFoodCate = $(".show-rows-foodCate option:selected").val();
                var field = "foodCateId";
                displayShortFoodCateDESC(showRowsFoodCate, field);
            });

            //ASC foodCate
            $('.ascFoodCate').click(function () {
                var shortField = this.value;
                displayShortFoodCateASC(showRowsFoodCate, shortField);
            });

            //DESC foodCate
            $('.descFoodCate').click(function () {
                var shortField = this.value;
                displayShortFoodCateDESC(showRowsFoodCate, shortField);
            });

            //function displayAllFoodCateFromDB
            function displayAllFoodCateFromDB() {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/DisplayAllFoodCate",
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

            //displayShortDESC
            function displayShortFoodCateDESC(showRowsFoodCate, field) {
                var foodCateDESC = foodCateArr.sort(function (a, b) {
                    if (field == "foodCateId") {
                        if (a.foodCateId < b.foodCateId)
                            return 1;
                        if (a.foodCateId > b.foodCateId)
                            return -1;
                    } else if (field == "foodCateName") {
                        if (a.foodCateName < b.foodCateName)
                            return 1;
                        if (a.foodCateName > b.foodCateName)
                            return -1;
                    }
                });
                var foodCateLimit = foodCateDESC.slice(0, showRowsFoodCate);
                $('#foodCate-list').html("");
                for (var i = 0; i < foodCateLimit.length; i++) {
                    $('#foodCate-list').append(
                        '<tr>' +
                            '<td>' + foodCateLimit[i].foodCateId + '</td>' +
                            '<td>' + foodCateLimit[i].foodCateName + '</td>' +
                            '<td>' +
                            '<button value=' + foodCateLimit[i].foodCateId + ' type="button" class="btn-floating waves-effect waves-light" id="update-foodCate" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + foodCateLimit[i].foodCateId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-foodCate">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortFoodCateASC(showRowsFoodCate, field) {
                var foodCateASC = foodCateArr.sort(function (a, b) {
                    if (field == "foodCateId") {
                        if (a.foodCateId < b.foodCateId)
                            return -1;
                        if (a.foodCateId > b.foodCateId)
                            return 1;
                    } else if (field == "foodCateName") {
                        if (a.foodCateName < b.foodCateName)
                            return -1;
                        if (a.foodCateName > b.foodCateName)
                            return 1;
                    }
                });
                var foodCateLimit = foodCateASC.slice(0, showRowsFoodCate);
                $('#foodCate-list').html("");
                for (var i = 0; i < foodCateLimit.length; i++) {
                    $('#foodCate-list').append(
                        '<tr>' +
                            '<td>' + foodCateLimit[i].foodCateId + '</td>' +
                            '<td>' + foodCateLimit[i].foodCateName + '</td>' +
                            '<td>' +
                            '<button value=' + foodCateLimit[i].foodCateId + ' type="button" class="btn-floating waves-effect waves-light" id="update-foodCate" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + foodCateLimit[i].foodCateId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-foodCate">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //search data
            $('#<%=txtSearchFoodCate.ClientID %>').keyup(function () {
                var searchVal = $('#<%=txtSearchFoodCate.ClientID %>').val();
                if (searchVal != "" || searchVal != null) {
                    var filterFoodCate = foodCateArr.filter(function (obj) {
                        var data = obj.foodCateId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.foodCateName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#foodCate-list').html("");
                    for (var i = 0; i < filterFoodCate.length; i++) {
                        $('#foodCate-list').append(
                            '<tr>' +
                                '<td>' + filterFoodCate[i].foodCateId + '</td>' +
                                '<td>' + filterFoodCate[i].foodCateName + '</td>' +
                                '<td>' +
                                '<button value=' + filterFoodCate[i].foodCateId + ' type="button" class="btn-floating waves-effect waves-light" id="update-foodCate" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filterFoodCate[i].foodCateId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-foodCate">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                } else {
                    displayFoodCateLimit(showRowsFoodCate);
                }
            });

            //current row 
            $(document).on("click", "#foodCate-table tr #update-foodCate", function (e) {
                var foodCateId = $(this).closest('tr').children('td:first').text();
                if (foodCateId != "" || foodCateId != null) {
                    $(".lbl-foodCateId").addClass("active");
                    $(".lbl-foodCateName").addClass("active");
                    $('#modal-update-foodCate').modal('open');
                    var filterFoodCate = foodCateArr.filter(function (obj) {
                        return obj.foodCateId.toLowerCase().indexOf(foodCateId.toLowerCase()) > -1;
                    });
                    if (foodCateArr.length > 0) {
                        for (var i = 0; i < filterFoodCate.length; i++) {
                            $('#<%=txtFoodCateIdUpdate.ClientID %>').val(filterFoodCate[i].foodCateId);
                            $('#<%=txtFoodCateNameUpdate.ClientID %>').val(filterFoodCate[i].foodCateName);
                        }
                    }
                }
            });

            //current row delete
            $(document).on("click", "#foodCate-table tr #delete-foodCate", function (e) {
                var foodCateId = $(this).closest('tr').children('td:first').text();
                if (foodCateId != "" || foodCateId != null) {
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
                            deleteFoodCate(foodCateId);
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //reset update
            $("#reset-update-foodCate").click(function () {
                $(".lbl-foodCateId").addClass("active");
                $(".lbl-foodCateName").addClass("active");
                var foodCateId = $('#<%=txtFoodCateId.ClientID %>').val();
                if (foodCateId != "" || foodCateId != null) {
                    displayFoodCate(foodCateId);
                }
            });

            //insert foodCate
            $("#insert-foodCate").click(function () {
                var foodCateId = $('#<%=txtFoodCateId.ClientID %>').val();
                var foodCateName = $('#<%=txtFoodCateName.ClientID %>').val();
                insertFoodCate(foodCateId, foodCateName);
            });

            //insert foodCate key enter
            $('#<%=txtFoodCateName.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var foodCateId = $('#<%=txtFoodCateId.ClientID %>').val();
                    var foodCateName = $('#<%=txtFoodCateName.ClientID %>').val();
                    insertFoodCate(foodCateId, foodCateName);
                }
            });

            //update foodCate
            $("#update-foodCate").click(function () {
                var foodCateId = $('#<%=txtFoodCateIdUpdate.ClientID %>').val();
                var foodCateName = $('#<%=txtFoodCateNameUpdate.ClientID %>').val();
                updateFoodCate(foodCateId, foodCateName);
            });

            //update foodCate key enter
            $('#<%=txtFoodCateNameUpdate.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var foodCateId = $('#<%=txtFoodCateIdUpdate.ClientID %>').val();
                    var foodCateName = $('#<%=txtFoodCateNameUpdate.ClientID %>').val();
                    updateFoodCate(foodCateId, foodCateName);
                }
            });

            //function insert foodCate
            function insertFoodCate(foodCateId, foodCateName) {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/InsertFoodCate",
                    data: JSON.stringify({
                        foodCateId: foodCateId,
                        foodCateName: foodCateName
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
                        clearFoodCateText();
                        $('#<%=txtFoodCateId.ClientID %>').val(result.d);
                        $(".lbl-foodCateId").addClass("active");
                        displayAllFoodCateFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "foodCateId";
                                displayShortFoodCateDESC(showRowsFoodCate, field);
                                document.getElementById("totalFoodCate").innerHTML = foodCateArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function update
            function updateFoodCate(foodCateId, foodCateName) {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/UpdateFoodCate",
                    data: JSON.stringify({
                        foodCateId: foodCateId,
                        foodCateName: foodCateName
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
                            clearFoodCateText();
                            displayAllFoodCateFromDB();
                            $('#modal-update-foodCate').modal('close');
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "foodCateId";
                                displayShortFoodCateDESC(showRowsFoodCate, field);
                                document.getElementById("totalFoodCate").innerHTML = foodCateArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function delete
            function deleteFoodCate(foodCateId) {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/DeleteFoodCate",
                    data: JSON.stringify({
                        foodCateId: foodCateId
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
                            displayAllFoodCateFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "foodCateId";
                                displayShortFoodCateDESC(showRowsFoodCate, field);
                                document.getElementById("totalFoodCate").innerHTML = foodCateArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function maxId
            function maxFoodCateId() {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/WindowLoadFoodCate",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        clearFoodCateText();
                        $('#<%=txtFoodCateId.ClientID %>').val(result.d);
                        $(".lbl-foodCateId").addClass("active");
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function clearTextBox
            function clearFoodCateText() {
                $('#<%=txtFoodCateId.ClientID %>').val(null);
                $('#<%=txtFoodCateName.ClientID %>').val(null);
            }

            $("#modal-insert-foodCate").modal({
                dismissible: true,
                ready: function (modal, trigger) {
                    maxFoodCateId();
                },
                complete: function () { }
            });
            //-------- end foodCate


            //-------- drinkCate ---------
            //show row
            $('.show-rows-drinkCate').on('change', function () {
                showRowsDrinkCate = $(".show-rows-drinkCate option:selected").val();
                var field = "drinkCateId";
                displayShortDrinkCateDESC(showRowsDrinkCate, field);
            });

            //ASC drinkCate
            $('.ascDrinkCate').click(function () {
                var shortField = this.value;
                displayShortDrinkCateASC(showRowsDrinkCate, shortField);
            });

            //DESC drinkCate
            $('.descDrinkCate').click(function () {
                var shortField = this.value;
                displayShortDrinkCateDESC(showRowsDrinkCate, shortField);
            });

            //function displayAllDrinkCateFromDB
            function displayAllDrinkCateFromDB() {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/DisplayAllDrinkCate",
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

            //displayShortDESC
            function displayShortDrinkCateDESC(showRowsDrinkCate, field) {
                var drinkCateDESC = drinkCateArr.sort(function (a, b) {
                    if (field == "drinkCateId") {
                        if (a.drinkCateId < b.drinkCateId)
                            return 1;
                        if (a.drinkCateId > b.drinkCateId)
                            return -1;
                    } else if (field == "drinkCateName") {
                        if (a.drinkCateName < b.drinkCateName)
                            return 1;
                        if (a.drinkCateName > b.drinkCateName)
                            return -1;
                    }
                });
                var drinkCateLimit = drinkCateDESC.slice(0, showRowsDrinkCate);
                $('#drinkCate-list').html("");
                for (var i = 0; i < drinkCateLimit.length; i++) {
                    $('#drinkCate-list').append(
                        '<tr>' +
                            '<td>' + drinkCateLimit[i].drinkCateId + '</td>' +
                            '<td>' + drinkCateLimit[i].drinkCateName + '</td>' +
                            '<td>' +
                            '<button value=' + drinkCateLimit[i].drinkCateId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drinkCate" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + drinkCateLimit[i].drinkCateId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drinkCate">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortDrinkCateASC(showRowsDrinkCate, field) {
                var drinkCateASC = drinkCateArr.sort(function (a, b) {
                    if (field == "drinkCateId") {
                        if (a.drinkCateId < b.drinkCateId)
                            return -1;
                        if (a.drinkCateId > b.drinkCateId)
                            return 1;
                    } else if (field == "drinkCateName") {
                        if (a.drinkCateName < b.drinkCateName)
                            return -1;
                        if (a.drinkCateName > b.drinkCateName)
                            return 1;
                    }
                });
                var drinkCateLimit = drinkCateASC.slice(0, showRowsDrinkCate);
                $('#drinkCate-list').html("");
                for (var i = 0; i < drinkCateLimit.length; i++) {
                    $('#drinkCate-list').append(
                        '<tr>' +
                            '<td>' + drinkCateLimit[i].drinkCateId + '</td>' +
                            '<td>' + drinkCateLimit[i].drinkCateName + '</td>' +
                            '<td>' +
                            '<button value=' + drinkCateLimit[i].drinkCateId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drinkCate" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + drinkCateLimit[i].drinkCateId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drinkCate">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //search data
            $('#<%=txtSearchDrinkCate.ClientID %>').keyup(function () {
                var searchVal = $('#<%=txtSearchDrinkCate.ClientID %>').val();
                if (searchVal != "" || searchVal != null) {
                    var filterDrinkCate = drinkCateArr.filter(function (obj) {
                        var data = obj.drinkCateId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.drinkCateName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#drinkCate-list').html("");
                    for (var i = 0; i < filterDrinkCate.length; i++) {
                        $('#drinkCate-list').append(
                            '<tr>' +
                                '<td>' + filterDrinkCate[i].drinkCateId + '</td>' +
                                '<td>' + filterDrinkCate[i].drinkCateName + '</td>' +
                                '<td>' +
                                '<button value=' + filterDrinkCate[i].drinkCateId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drinkCate" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filterDrinkCate[i].drinkCateId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drinkCate">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                } else {
                    displayDrinkCateLimit(showRowsDrinkCate);
                }
            });

            //current row 
            $(document).on("click", "#drinkCate-table tr #update-drinkCate", function (e) {
                var drinkCateId = $(this).closest('tr').children('td:first').text();
                if (drinkCateId != "" || drinkCateId != null) {
                    $(".lbl-drinkCateId").addClass("active");
                    $(".lbl-drinkCateName").addClass("active");
                    $('#modal-update-drinkCate').modal('open');
                    var filterDrinkCate = drinkCateArr.filter(function (obj) {
                        return obj.drinkCateId.toLowerCase().indexOf(drinkCateId.toLowerCase()) > -1;
                    });
                    if (drinkCateArr.length > 0) {
                        for (var i = 0; i < filterDrinkCate.length; i++) {
                            $('#<%=txtDrinkCateIdUpdate.ClientID %>').val(filterDrinkCate[i].drinkCateId);
                            $('#<%=txtDrinkCateNameUpdate.ClientID %>').val(filterDrinkCate[i].drinkCateName);
                        }
                    }
                }
            });

            //current row delete
            $(document).on("click", "#drinkCate-table tr #delete-drinkCate", function (e) {
                var drinkCateId = $(this).closest('tr').children('td:first').text();
                if (drinkCateId != "" || drinkCateId != null) {
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
                            deleteDrinkCate(drinkCateId);
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //reset update
            $("#reset-update-drinkCate").click(function () {
                $(".lbl-drinkCateId").addClass("active");
                $(".lbl-drinkCateName").addClass("active");
                var drinkCateId = $('#<%=txtDrinkCateId.ClientID %>').val();
                if (drinkCateId != "" || drinkCateId != null) {
                    displayDrinkCate(drinkCateId);
                }
            });

            //insert drinkCate
            $("#insert-drinkCate").click(function () {
                var drinkCateId = $('#<%=txtDrinkCateId.ClientID %>').val();
                var drinkCateName = $('#<%=txtDrinkCateName.ClientID %>').val();
                insertDrinkCate(drinkCateId, drinkCateName);
            });

            //insert drinkCate key enter
            $('#<%=txtDrinkCateName.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var drinkCateId = $('#<%=txtDrinkCateId.ClientID %>').val();
                    var drinkCateName = $('#<%=txtDrinkCateName.ClientID %>').val();
                    insertDrinkCate(drinkCateId, drinkCateName);
                }
            });

            //update drinkCate
            $("#update-drinkCate").click(function () {
                var drinkCateId = $('#<%=txtDrinkCateIdUpdate.ClientID %>').val();
                var drinkCateName = $('#<%=txtDrinkCateNameUpdate.ClientID %>').val();
                updateDrinkCate(drinkCateId, drinkCateName);
            });

            //update drinkCate key enter
            $('#<%=txtDrinkCateNameUpdate.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var drinkCateId = $('#<%=txtDrinkCateIdUpdate.ClientID %>').val();
                    var drinkCateName = $('#<%=txtDrinkCateNameUpdate.ClientID %>').val();
                    updateDrinkCate(drinkCateId, drinkCateName);
                }
            });

            //function insert drinkCate
            function insertDrinkCate(drinkCateId, drinkCateName) {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/InsertDrinkCate",
                    data: JSON.stringify({
                        drinkCateId: drinkCateId,
                        drinkCateName: drinkCateName
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
                        clearDrinkCateText();
                        $('#<%=txtDrinkCateId.ClientID %>').val(result.d);
                        $(".lbl-drinkCateId").addClass("active");
                        displayAllDrinkCateFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "drinkCateId";
                                displayShortDrinkCateDESC(showRowsDrinkCate, field);
                                document.getElementById("totalDrinkCate").innerHTML = drinkCateArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function update
            function updateDrinkCate(drinkCateId, drinkCateName) {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/UpdateDrinkCate",
                    data: JSON.stringify({
                        drinkCateId: drinkCateId,
                        drinkCateName: drinkCateName
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
                            clearDrinkCateText();
                            displayAllDrinkCateFromDB();
                            $('#modal-update-drinkCate').modal('close');
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "drinkCateId";
                                displayShortDrinkCateDESC(showRowsDrinkCate, field);
                                document.getElementById("totalDrinkCate").innerHTML = drinkCateArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function delete
            function deleteDrinkCate(drinkCateId) {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/DeleteDrinkCate",
                    data: JSON.stringify({
                        drinkCateId: drinkCateId
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
                            displayAllDrinkCateFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "drinkCateId";
                                displayShortDrinkCateDESC(showRowsDrinkCate, field);
                                document.getElementById("totalDrinkCate").innerHTML = drinkCateArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function maxId
            function maxDrinkCateId() {
                $.ajax({
                    type: "POST",
                    url: "ProductCate.aspx/WindowLoadDrinkCate",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        clearDrinkCateText();
                        $('#<%=txtDrinkCateId.ClientID %>').val(result.d);
                        $(".lbl-drinkCateId").addClass("active");
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function clearTextBox
            function clearDrinkCateText() {
                $('#<%=txtDrinkCateId.ClientID %>').val(null);
                $('#<%=txtDrinkCateName.ClientID %>').val(null);
            }
            $("#modal-insert-drinkCate").modal({
                dismissible: true,
                ready: function (modal, trigger) {
                    maxDrinkCateId();
                },
                complete: function () { }
            });
            //----------- end drinkCate ----------

        });
    </script>
</asp:Content>
