<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductUnit.aspx.cs" Inherits="KTV_MS.ProductUnit" %>

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

        #foodUnit-list {
            display: none;
        }

        #drinkUnit-list {
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
                    <a href="#food-unit" class="white-text waves-effect waves-light active">
                        <i class="material-icons">restaurant_menu</i>ខ្នាតម្ហូប
                    </a>
                </li>
                <li class="tab col s6">
                    <a href="#drink-unit" class="white-text waves-effect waves-light active">
                        <i class="material-icons">local_bar</i>ខ្នាតភេសជ្ជៈ
                    </a>
                </li>
            </ul>

            <%-- foodUnit --%>
            <div id="food-unit" class="col s12">
                <br />
                <div class="row">
                    <div class="col s12">
                        <a class="waves-effect waves-light btn btn-large form-label" href="#modal-insert-foodUnit"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
                    </div>
                </div>

                <hr class="style3"/>
                <div class="row">
                    <div class="input-field col s2">
                        <label​ class="form-label">បង្ហាញចំនួនទិន្ន័យ</label​>
                        <select class="form-label show-rows-foodUnit">
                            <option value="5">០៥</option>
                            <option value="10">១០</option>
                            <option value="15">១៥</option>
                        </select>
                    </div>

                    <div class="input-field col s5 offset-s5">
                        <i class="material-icons prefix" style="color:#26a69a;">search</i>
                        <asp:TextBox ID="txtSearchFoodUnit" runat="server" CssClass="search-foodUnit form-label​"></asp:TextBox>
                        <label for="icon_prefix" class="form-label">ស្វែងរក</label>
                    </div>
                </div>

                <table id="foodUnit-table">
                    <thead>
                        <tr class="th-label">
                            <th>លេខកូដខ្នាតម្ហូប
                                <button type="button" class="btn-floating waves-effect waves-light ascFoodUnit" value="foodUnitId">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descFoodUnit" value="foodUnitId">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>ឈ្មោះខ្នាតម្ហូប
                                <button type="button" class="btn-floating waves-effect waves-light ascFoodUnit" value="foodUnitName">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descFoodUnit" value="foodUnitName">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>សកម្មភាព</th>
                        </tr>
                    </thead>
                    <tbody id="foodUnit-list" class="animate-bottom"></tbody>
                </table>
                <br />
                <div class="row">
                    <div class="col s12">
                        <div class="card-panel teal lighten-1">
                            <span class="white-text form-label">ទិន្ន័យសរុប ៖ <span id="totalFoodUnit"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <%-- end foodUnit --%>

            <%-- drinkUnit --%>
            <div id="drink-unit" class="col s12">
                <br />
                <div class="row">
                    <div class="col s12">
                        <a class="waves-effect waves-light btn btn-large form-label" href="#modal-insert-drinkUnit"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
                    </div>
                </div>

                <hr class="style3"/>
                <div class="row">
                    <div class="input-field col s2">
                        <label​ class="form-label">បង្ហាញចំនួនទិន្ន័យ</label​>
                        <select class="form-label show-rows-drinkUnit">
                            <option value="5">០៥</option>
                            <option value="10">១០</option>
                            <option value="15">១៥</option>
                        </select>
                    </div>

                    <div class="input-field col s5 offset-s5">
                        <i class="material-icons prefix" style="color:#26a69a;">search</i>
                        <asp:TextBox ID="txtSearchDrinkUnit" runat="server" CssClass="search-drinkUnit form-label​"></asp:TextBox>
                        <label for="icon_prefix" class="form-label">ស្វែងរក</label>
                    </div>
                </div>

                <table id="drinkUnit-table">
                    <thead>
                        <tr class="th-label">
                            <th>លេខកូដខ្នាតភេសជ្ជៈ
                                <button type="button" class="btn-floating waves-effect waves-light ascDrinkUnit" value="drinkUnitId">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descDrinkUnit" value="drinkUnitId">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>ឈ្មោះខ្នាតភេសជ្ជៈ
                                <button type="button" class="btn-floating waves-effect waves-light ascDrinkUnit" value="drinkUnitName">
                                    <i class="material-icons right">arrow_upward</i>
                                </button>
                                <button type="button" class="btn-floating waves-effect waves-light descDrinkUnit" value="drinkUnitName">
                                    <i class="material-icons right">arrow_downward</i>
                                </button>
                            </th>
                            <th>សកម្មភាព</th>
                        </tr>
                    </thead>
                    <tbody id="drinkUnit-list" class="animate-bottom"></tbody>
                </table>
                <br />
                <div class="row">
                    <div class="col s12">
                        <div class="card-panel teal lighten-1">
                            <span class="white-text form-label">ទិន្ន័យសរុប ៖ <span id="totalDrinkUnit"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <%-- end drinkUnit --%>
        </div>
    </div>
    <div class="loader"></div>

    <!-- Modal insert foodUnit -->
    <div id="modal-insert-foodUnit" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលខ្នាតម្ហូប</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodUnitId" data-error="wrong" data-success="right">លេខកូដខ្នាតម្ហូប</label>
                        <asp:TextBox ID="txtFoodUnitId" runat="server" CssClass="bevgUnitId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodUnitName">ឈ្មោះខ្នាតម្ហូប</label>
                        <asp:TextBox ID="txtFoodUnitName" runat="server" CssClass="bevgUnitName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="insert-foodUnit" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal insert foodUnit --%>

    <!-- Modal update foodUnit -->
    <div id="modal-update-foodUnit" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែខ្នាតម្ហូប</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodUnitId" data-error="wrong" data-success="right">លេខកូដខ្នាតម្ហូប</label>
                        <asp:TextBox ID="txtFoodUnitIdUpdate" runat="server" CssClass="foodUnitId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-foodUnitName">ឈ្មោះខ្នាតម្ហូប</label>
                        <asp:TextBox ID="txtFoodUnitNameUpdate" runat="server" CssClass="foodUnitName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button type="button" id="reset-update-foodUnit" class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="update-foodUnit" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">កែប្រែទិន្ន័យ
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal update food unit --%>

    <!-- Modal insert drinkUnit -->
    <div id="modal-insert-drinkUnit" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">បញ្ចូលខ្នាតភេសជ្ជៈ</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkUnitId" data-error="wrong" data-success="right">លេខកូដខ្នាតភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkUnitId" runat="server" CssClass="bevgUnitId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkUnitName">ឈ្មោះខ្នាតភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkUnitName" runat="server" CssClass="bevgUnitName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="insert-drinkUnit" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal insert drinkUnit --%>

    <!-- Modal update drinkUnit -->
    <div id="modal-update-drinkUnit" class="modal">
        <div class="modal-content">
            <h4 style="color:#26a69a;font-family:'Khmer OS Freehand';margin-top:10px;margin-bottom:25px;">កែប្រែខ្នាតភេសជ្ជៈ</h4>
            <hr class="style3"/><br />
            <form class="formValidate">
                <div class="row">
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkUnitId" data-error="wrong" data-success="right">លេខកូដខ្នាតភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkUnitIdUpdate" runat="server" CssClass="drinkUnitId" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <label class="form-label lbl-drinkUnitName">ឈ្មោះខ្នាតភេសជ្ជៈ</label>
                        <asp:TextBox ID="txtDrinkUnitNameUpdate" runat="server" CssClass="drinkUnitName form-label"></asp:TextBox> 
                    </div>
                </div>
                <hr class="style3"/> 
                <div class="row">
                    <button type="button" id="reset-update-drinkUnit" class="col s5 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="update-drinkUnit" class="col s5 offset-s2 btn btn-large waves-effect waves-light form-label" name="action">កែប្រែទិន្ន័យ
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%-- End modal update drink unit --%>



    <script>
        $(document).ready(function () {
            $('select').material_select();
            $('.modal').modal();

            var foodUnitArr = [];
            var drinkUnitArr = [];
            var showRowsFoodUnit = $(".show-rows-foodUnit").val();
            var showRowsBevgUnit = $(".show-rows-bevgUnit").val();

            //window load
            $(window).load(function () {
                displayAllFoodUnitFromDB();
                displayAllDrinkUnitFromDB();
                setTimeout(function () {
                    $(".loader").css("display", "none");
                    $("#foodUnit-list").show();
                    showRowsFoodUnit = 5;
                    var fieldFood = "foodUnitId";
                    displayShortFoodUnitDESC(showRowsFoodUnit, fieldFood);
                    document.getElementById("totalFoodUnit").innerHTML = foodUnitArr.length;

                    $("#drinkUnit-list").show();
                    showRowsDrinkUnit = 5;
                    var fieldDrink = "drinkUnitId";
                    displayShortDrinkUnitDESC(showRowsDrinkUnit, fieldDrink);
                    document.getElementById("totalDrinkUnit").innerHTML = drinkUnitArr.length;
                }, 1000);
            });

            //show row
            $('.show-rows-foodUnit').on('change', function () {
                showRowsFoodUnit = $(".show-rows-foodUnit option:selected").val();
                var field = "foodUnitId";
                displayShortFoodUnitDESC(showRowsFoodUnit, field);
            });

            //ASC foodUnit
            $('.ascFoodUnit').click(function () {
                var shortField = this.value;
                displayShortFoodUnitASC(showRowsFoodUnit, shortField);
            });

            //DESC foodUnit
            $('.descFoodUnit').click(function () {
                var shortField = this.value;
                displayShortFoodUnitDESC(showRowsFoodUnit, shortField);
            });

            //function displayAllFoodUnitFromDB
            function displayAllFoodUnitFromDB() {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/DisplayAllFoodUnit",
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

            //displayShortDESC
            function displayShortFoodUnitDESC(showRowsFoodUnit, field) {
                var foodUnitDESC = foodUnitArr.sort(function (a, b) {
                    if (field == "foodUnitId") {
                        if (a.foodUnitId < b.foodUnitId)
                            return 1;
                        if (a.foodUnitId > b.foodUnitId)
                            return -1;
                    } else if (field == "foodUnitName") {
                        if (a.foodUnitName < b.foodUnitName)
                            return 1;
                        if (a.foodUnitName > b.foodUnitName)
                            return -1;
                    }
                });
                var foodUnitLimit = foodUnitDESC.slice(0, showRowsFoodUnit);
                $('#foodUnit-list').html("");
                for (var i = 0; i < foodUnitLimit.length; i++) {
                    $('#foodUnit-list').append(
                        '<tr>' +
                            '<td>' + foodUnitLimit[i].foodUnitId + '</td>' +
                            '<td>' + foodUnitLimit[i].foodUnitName + '</td>' +
                            '<td>' +
                            '<button value=' + foodUnitLimit[i].foodUnitId + ' type="button" class="btn-floating waves-effect waves-light" id="update-foodUnit" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + foodUnitLimit[i].foodUnitId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-foodUnit">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortFoodUnitASC(showRowsFoodUnit, field) {
                var foodUnitASC = foodUnitArr.sort(function (a, b) {
                    if (field == "foodUnitId") {
                        if (a.foodUnitId < b.foodUnitId)
                            return -1;
                        if (a.foodUnitId > b.foodUnitId)
                            return 1;
                    } else if (field == "foodUnitName") {
                        if (a.foodUnitName < b.foodUnitName)
                            return -1;
                        if (a.foodUnitName > b.foodUnitName)
                            return 1;
                    }
                });
                var foodUnitLimit = foodUnitASC.slice(0, showRowsFoodUnit);
                $('#foodUnit-list').html("");
                for (var i = 0; i < foodUnitLimit.length; i++) {
                    $('#foodUnit-list').append(
                        '<tr>' +
                            '<td>' + foodUnitLimit[i].foodUnitId + '</td>' +
                            '<td>' + foodUnitLimit[i].foodUnitName + '</td>' +
                            '<td>' +
                            '<button value=' + foodUnitLimit[i].foodUnitId + ' type="button" class="btn-floating waves-effect waves-light" id="update-foodUnit" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + foodUnitLimit[i].foodUnitId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-foodUnit">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //search data
            $('#<%=txtSearchFoodUnit.ClientID %>').keyup(function () {
                var searchVal = $('#<%=txtSearchFoodUnit.ClientID %>').val();
                if (searchVal != "" || searchVal != null) {
                    var filterFoodUnit = foodUnitArr.filter(function (obj) {
                        var data = obj.foodUnitId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.foodUnitName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#foodUnit-list').html("");
                    for (var i = 0; i < filterFoodUnit.length; i++) {
                        $('#foodUnit-list').append(
                            '<tr>' +
                                '<td>' + filterFoodUnit[i].foodUnitId + '</td>' +
                                '<td>' + filterFoodUnit[i].foodUnitName + '</td>' +
                                '<td>' +
                                '<button value=' + filterFoodUnit[i].foodUnitId + ' type="button" class="btn-floating waves-effect waves-light" id="update-foodUnit" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filterFoodUnit[i].foodUnitId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-foodUnit">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                } else {
                    displayFoodUnitLimit(showRowsFoodUnit);
                }
            });

            //current row 
            $(document).on("click", "#foodUnit-table tr #update-foodUnit", function (e) {
                var foodUnitId = $(this).closest('tr').children('td:first').text();
                if (foodUnitId != "" || foodUnitId != null) {
                    $(".lbl-foodUnitId").addClass("active");
                    $(".lbl-foodUnitName").addClass("active");
                    $('#modal-update-foodUnit').modal('open');
                    var filterFoodUnit = foodUnitArr.filter(function (obj) {
                        return obj.foodUnitId.toLowerCase().indexOf(foodUnitId.toLowerCase()) > -1;
                    });
                    if (foodUnitArr.length > 0) {
                        for (var i = 0; i < filterFoodUnit.length; i++) {
                            $('#<%=txtFoodUnitIdUpdate.ClientID %>').val(filterFoodUnit[i].foodUnitId);
                            $('#<%=txtFoodUnitNameUpdate.ClientID %>').val(filterFoodUnit[i].foodUnitName);
                        }
                    }
                }
            });

            //current row delete
            $(document).on("click", "#foodUnit-table tr #delete-foodUnit", function (e) {
                var foodUnitId = $(this).closest('tr').children('td:first').text();
                if (foodUnitId != "" || foodUnitId != null) {
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
                            deleteFoodUnit(foodUnitId);
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //reset update
            $("#reset-update-foodUnit").click(function () {
                $(".lbl-foodUnitId").addClass("active");
                $(".lbl-foodUnitName").addClass("active");
                var foodUnitId = $('#<%=txtFoodUnitId.ClientID %>').val();
                if (foodUnitId != "" || foodUnitId != null) {
                    displayFoodUnit(foodUnitId);
                }
            });

            //insert foodUnit
            $("#insert-foodUnit").click(function () {
                var foodUnitId = $('#<%=txtFoodUnitId.ClientID %>').val();
                var foodUnitName = $('#<%=txtFoodUnitName.ClientID %>').val();
                insertFoodUnit(foodUnitId, foodUnitName);
            });

            //insert foodUnit key enter
            $('#<%=txtFoodUnitName.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var foodUnitId = $('#<%=txtFoodUnitId.ClientID %>').val();
                    var foodUnitName = $('#<%=txtFoodUnitName.ClientID %>').val();
                    insertFoodUnit(foodUnitId, foodUnitName);
                }
            });

            //update foodUnit
            $("#update-foodUnit").click(function () {
                var foodUnitId = $('#<%=txtFoodUnitIdUpdate.ClientID %>').val();
                var foodUnitName = $('#<%=txtFoodUnitNameUpdate.ClientID %>').val();
                updateFoodUnit(foodUnitId, foodUnitName);
            });

            //update foodUnit key enter
            $('#<%=txtFoodUnitNameUpdate.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var foodUnitId = $('#<%=txtFoodUnitIdUpdate.ClientID %>').val();
                    var foodUnitName = $('#<%=txtFoodUnitNameUpdate.ClientID %>').val();
                    updateFoodUnit(foodUnitId, foodUnitName);
                }
            });

            //function insert foodUnit
            function insertFoodUnit(foodUnitId, foodUnitName) {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/InsertFoodUnit",
                    data: JSON.stringify({
                        foodUnitId: foodUnitId,
                        foodUnitName: foodUnitName
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
                        clearFoodUnitText();
                        $('#<%=txtFoodUnitId.ClientID %>').val(result.d);
                        $(".lbl-foodUnitId").addClass("active");
                        displayAllFoodUnitFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "foodUnitId";
                                displayShortFoodUnitDESC(showRowsFoodUnit, field);
                                document.getElementById("totalFoodUnit").innerHTML = foodUnitArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function update
            function updateFoodUnit(foodUnitId, foodUnitName) {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/UpdateFoodUnit",
                    data: JSON.stringify({
                        foodUnitId: foodUnitId,
                        foodUnitName: foodUnitName
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
                            clearFoodUnitText();
                            displayAllFoodUnitFromDB();
                            $('#modal-update-foodUnit').modal('close');
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "foodUnitId";
                                displayShortFoodUnitDESC(showRowsFoodUnit, field);
                                document.getElementById("totalFoodUnit").innerHTML = foodUnitArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function delete
            function deleteFoodUnit(foodUnitId) {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/DeleteFoodUnit",
                    data: JSON.stringify({
                        foodUnitId: foodUnitId
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
                            displayAllFoodUnitFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "foodUnitId";
                                displayShortFoodUnitDESC(showRowsFoodUnit, field);
                                document.getElementById("totalFoodUnit").innerHTML = foodUnitArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function maxId
            function maxFoodUnitId() {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/WindowLoadFoodUnit",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        //clearFoodUnitText();
                        console.log(result.d);
                        $('#<%=txtFoodUnitId.ClientID %>').val(result.d);
                        $(".lbl-foodUnitId").addClass("active");
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function clearTextBox
            function clearFoodUnitText() {
                $('#<%=txtFoodUnitId.ClientID %>').val(null);
                $('#<%=txtFoodUnitName.ClientID %>').val(null);
            }

            $("#modal-insert-foodUnit").modal({
                dismissible: true,
                ready: function (modal, trigger) {
                    maxFoodUnitId();
                },
                complete: function () { }
            });
            //-------- end foodUnit


            //-------- drinkUnit ---------
            //show row
            $('.show-rows-drinkUnit').on('change', function () {
                showRowsDrinkUnit = $(".show-rows-drinkUnit option:selected").val();
                var field = "drinkUnitId";
                displayShortDrinkUnitDESC(showRowsDrinkUnit, field);
            });

            //ASC drinkUnit
            $('.ascDrinkUnit').click(function () {
                var shortField = this.value;
                displayShortDrinkUnitASC(showRowsDrinkUnit, shortField);
            });

            //DESC drinkUnit
            $('.descDrinkUnit').click(function () {
                var shortField = this.value;
                displayShortDrinkUnitDESC(showRowsDrinkUnit, shortField);
            });

            //function displayAllDrinkUnitFromDB
            function displayAllDrinkUnitFromDB() {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/DisplayAllDrinkUnit",
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

            //displayShortDESC
            function displayShortDrinkUnitDESC(showRowsDrinkUnit, field) {
                var drinkUnitDESC = drinkUnitArr.sort(function (a, b) {
                    if (field == "drinkUnitId") {
                        if (a.drinkUnitId < b.drinkUnitId)
                            return 1;
                        if (a.drinkUnitId > b.drinkUnitId)
                            return -1;
                    } else if (field == "drinkUnitName") {
                        if (a.drinkUnitName < b.drinkUnitName)
                            return 1;
                        if (a.drinkUnitName > b.drinkUnitName)
                            return -1;
                    }
                });
                var drinkUnitLimit = drinkUnitDESC.slice(0, showRowsDrinkUnit);
                $('#drinkUnit-list').html("");
                for (var i = 0; i < drinkUnitLimit.length; i++) {
                    $('#drinkUnit-list').append(
                        '<tr>' +
                            '<td>' + drinkUnitLimit[i].drinkUnitId + '</td>' +
                            '<td>' + drinkUnitLimit[i].drinkUnitName + '</td>' +
                            '<td>' +
                            '<button value=' + drinkUnitLimit[i].drinkUnitId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drinkUnit" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + drinkUnitLimit[i].drinkUnitId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drinkUnit">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //displayShortASC
            function displayShortDrinkUnitASC(showRowsDrinkUnit, field) {
                var drinkUnitASC = drinkUnitArr.sort(function (a, b) {
                    if (field == "drinkUnitId") {
                        if (a.drinkUnitId < b.drinkUnitId)
                            return -1;
                        if (a.drinkUnitId > b.drinkUnitId)
                            return 1;
                    } else if (field == "drinkUnitName") {
                        if (a.drinkUnitName < b.drinkUnitName)
                            return -1;
                        if (a.drinkUnitName > b.drinkUnitName)
                            return 1;
                    }
                });
                var drinkUnitLimit = drinkUnitASC.slice(0, showRowsDrinkUnit);
                $('#drinkUnit-list').html("");
                for (var i = 0; i < drinkUnitLimit.length; i++) {
                    $('#drinkUnit-list').append(
                        '<tr>' +
                            '<td>' + drinkUnitLimit[i].drinkUnitId + '</td>' +
                            '<td>' + drinkUnitLimit[i].drinkUnitName + '</td>' +
                            '<td>' +
                            '<button value=' + drinkUnitLimit[i].drinkUnitId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drinkUnit" style="margin-right:10px;">' +
                                '<i class="material-icons">edit</i>' +
                            '</button>' +
                            '<button value=' + drinkUnitLimit[i].drinkUnitId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drinkUnit">' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    )
                }
            }

            //search data
            $('#<%=txtSearchDrinkUnit.ClientID %>').keyup(function () {
                var searchVal = $('#<%=txtSearchDrinkUnit.ClientID %>').val();
                if (searchVal != "" || searchVal != null) {
                    var filterDrinkUnit = drinkUnitArr.filter(function (obj) {
                        var data = obj.drinkUnitId.toLowerCase().indexOf(searchVal.toLowerCase()) > -1 ||
                                    obj.drinkUnitName.toLowerCase().indexOf(searchVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#drinkUnit-list').html("");
                    for (var i = 0; i < filterDrinkUnit.length; i++) {
                        $('#drinkUnit-list').append(
                            '<tr>' +
                                '<td>' + filterDrinkUnit[i].drinkUnitId + '</td>' +
                                '<td>' + filterDrinkUnit[i].drinkUnitName + '</td>' +
                                '<td>' +
                                '<button value=' + filterDrinkUnit[i].drinkUnitId + ' type="button" class="btn-floating waves-effect waves-light" id="update-drinkUnit" style="margin-right:10px;">' +
                                    '<i class="material-icons">edit</i>' +
                                '</button>' +
                                '<button value=' + filterDrinkUnit[i].drinkUnitId + ' type="button" class="btn-floating waves-effect waves-light red" id="delete-drinkUnit">' +
                                    '<i class="material-icons">delete</i></button>' +
                                '</td>' +
                            '</tr>'
                        )
                    }
                } else {
                    displayDrinkUnitLimit(showRowsDrinkUnit);
                }
            });

            //current row 
            $(document).on("click", "#drinkUnit-table tr #update-drinkUnit", function (e) {
                var drinkUnitId = $(this).closest('tr').children('td:first').text();
                if (drinkUnitId != "" || drinkUnitId != null) {
                    $(".lbl-drinkUnitId").addClass("active");
                    $(".lbl-drinkUnitName").addClass("active");
                    $('#modal-update-drinkUnit').modal('open');
                    var filterDrinkUnit = drinkUnitArr.filter(function (obj) {
                        return obj.drinkUnitId.toLowerCase().indexOf(drinkUnitId.toLowerCase()) > -1;
                    });
                    if (drinkUnitArr.length > 0) {
                        for (var i = 0; i < filterDrinkUnit.length; i++) {
                            $('#<%=txtDrinkUnitIdUpdate.ClientID %>').val(filterDrinkUnit[i].drinkUnitId);
                            $('#<%=txtDrinkUnitNameUpdate.ClientID %>').val(filterDrinkUnit[i].drinkUnitName);
                        }
                    }
                }
            });

            //current row delete
            $(document).on("click", "#drinkUnit-table tr #delete-drinkUnit", function (e) {
                var drinkUnitId = $(this).closest('tr').children('td:first').text();
                if (drinkUnitId != "" || drinkUnitId != null) {
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
                            deleteDrinkUnit(drinkUnitId);
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //reset update
            $("#reset-update-drinkUnit").click(function () {
                $(".lbl-drinkUnitId").addClass("active");
                $(".lbl-drinkUnitName").addClass("active");
                var drinkUnitId = $('#<%=txtDrinkUnitId.ClientID %>').val();
                if (drinkUnitId != "" || drinkUnitId != null) {
                    displayDrinkUnit(drinkUnitId);
                }
            });

            //insert drinkUnit
            $("#insert-drinkUnit").click(function () {
                var drinkUnitId = $('#<%=txtDrinkUnitId.ClientID %>').val();
                var drinkUnitName = $('#<%=txtDrinkUnitName.ClientID %>').val();
                insertDrinkUnit(drinkUnitId, drinkUnitName);
            });

            //insert drinkUnit key enter
            $('#<%=txtDrinkUnitName.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var drinkUnitId = $('#<%=txtDrinkUnitId.ClientID %>').val();
                    var drinkUnitName = $('#<%=txtDrinkUnitName.ClientID %>').val();
                    insertDrinkUnit(drinkUnitId, drinkUnitName);
                }
            });

            //update drinkUnit
            $("#update-drinkUnit").click(function () {
                var drinkUnitId = $('#<%=txtDrinkUnitIdUpdate.ClientID %>').val();
                var drinkUnitName = $('#<%=txtDrinkUnitNameUpdate.ClientID %>').val();
                updateDrinkUnit(drinkUnitId, drinkUnitName);
            });

            //update drinkUnit key enter
            $('#<%=txtDrinkUnitNameUpdate.ClientID %>').keypress(function (e) {
                if (e.which == 13) {
                    var drinkUnitId = $('#<%=txtDrinkUnitIdUpdate.ClientID %>').val();
                    var drinkUnitName = $('#<%=txtDrinkUnitNameUpdate.ClientID %>').val();
                    updateDrinkUnit(drinkUnitId, drinkUnitName);
                }
            });

            //function insert drinkUnit
            function insertDrinkUnit(drinkUnitId, drinkUnitName) {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/InsertDrinkUnit",
                    data: JSON.stringify({
                        drinkUnitId: drinkUnitId,
                        drinkUnitName: drinkUnitName
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
                        clearDrinkUnitText();
                        $('#<%=txtDrinkUnitId.ClientID %>').val(result.d);
                        $(".lbl-drinkUnitId").addClass("active");
                        displayAllDrinkUnitFromDB();
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "drinkUnitId";
                                displayShortDrinkUnitDESC(showRowsDrinkUnit, field);
                                document.getElementById("totalDrinkUnit").innerHTML = drinkUnitArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function update
            function updateDrinkUnit(drinkUnitId, drinkUnitName) {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/UpdateDrinkUnit",
                    data: JSON.stringify({
                        drinkUnitId: drinkUnitId,
                        drinkUnitName: drinkUnitName
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
                            clearDrinkUnitText();
                            displayAllDrinkUnitFromDB();
                            $('#modal-update-drinkUnit').modal('close');
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "drinkUnitId";
                                displayShortDrinkUnitDESC(showRowsDrinkUnit, field);
                                document.getElementById("totalDrinkUnit").innerHTML = drinkUnitArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function delete
            function deleteDrinkUnit(drinkUnitId) {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/DeleteDrinkUnit",
                    data: JSON.stringify({
                        drinkUnitId: drinkUnitId
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
                            displayAllDrinkUnitFromDB();
                        }
                    },
                    complete: function (obj) {
                        if (obj.statusText == "OK") {
                            setTimeout(function () {
                                var field = "drinkUnitId";
                                displayShortDrinkUnitDESC(showRowsDrinkUnit, field);
                                document.getElementById("totalDrinkUnit").innerHTML = drinkUnitArr.length;
                            }, 500);
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function maxId
            function maxDrinkUnitId() {
                $.ajax({
                    type: "POST",
                    url: "ProductUnit.aspx/WindowLoadDrinkUnit",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        clearDrinkUnitText();
                        $('#<%=txtDrinkUnitId.ClientID %>').val(result.d);
                        $(".lbl-drinkUnitId").addClass("active");
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function clearTextBox
            function clearDrinkUnitText() {
                $('#<%=txtDrinkUnitId.ClientID %>').val(null);
                $('#<%=txtDrinkUnitName.ClientID %>').val(null);
            }

            $("#modal-insert-drinkUnit").modal({
                dismissible: true,
                ready: function (modal, trigger) {
                    maxDrinkUnitId();
                },
                complete: function () { }
            });
            //----------- end drinkUnit ----------
        });
    </script>

</asp:Content>
