<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sale.aspx.cs" Inherits="KTV_MS.Sale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .navbar-fixed-top {
            z-index: 100;
        }

        .modal.open {
            width: 100%;
            max-height: 100%;
            height: 100%;
            top: 0 !important;
        }

        .productNameLineHeight {
            line-height: 30px;
        }

        #table-list {
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
    </style>
    <br />
    <br />
    <div class="row">
        <nav>
            <div class="nav-wrapper teal lighten-1">
                <form class="formValidate">
                    <div class="input-field">
                        <input id="search" type="search">
                        <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                        <i class="material-icons">close</i>
                    </div>
                </form>
            </div>
        </nav>
    </div>

    <div class="row">
        <button type="button" class="waves-effect waves-light btn-large form-label filter-table" value="ធម្មតា">តុធម្មតា</button>
        <button type="button" class="waves-effect waves-light btn-large form-label filter-table" value="vip">VIP</button>
        <button type="button" class="waves-effect waves-light btn-large form-label filter-table" value="active">កំពុងមានភ្ញៀវ</button>
        <button type="button" class="waves-effect waves-light btn-large form-label filter-table" value="closed">អត់មានភ្ញៀវ</button>
        <button type="button" class="waves-effect waves-light btn-large form-label filter-table" value="showAll">បង្ហាញទាំងអស់</button>
    </div>
    <div class="row">
        <div id="table-list" class="animate-bottom">
        </div>
        <div class="loader"></div>
    </div>

    <!-- Modal Insert -->
    <div id="modal-insert" class="modal">
        <div class="modal-content">
            <div class="row">
                <nav>
                    <div class="nav-wrapper teal lighten-1">
                        <form class="formValidate">
                            <div class="input-field">
                                <input id="search-product" type="search">
                                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                                <i class="material-icons">close</i>
                            </div>
                        </form>
                    </div>
                </nav>
            </div>
            <hr class="style3" />
            <div class="row">
                <div class="col s5">
                    <span id="food-cate"></span>
                    <span id="drink-cate"></span>
                </div>
                <div class="col s5 offset-s1">
                    <h4 class="form-label" style="color:#0277bd;">ឈ្មោះតុ : <span id="tableName"></span></h4>
                </div>
            </div>

            <div class="row">
                <div class="col s5">
                    <div class="card-panel">
                        <div class="row">
                            <div id="product-list">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button type="button" id="reset-update" class="col s3 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">
                            រក្សាទុក
                            <i class="material-icons right">save</i>
                        </button>
                    </div>
                </div>

                <div class="col s5 offset-s1">
                    <table>
                        <thead>
                            <tr>
                                <th>ឈ្មោះទំនិញ</th>
                                <th>ខ្នាត</th>
                                <th>ចំនួន</th>
                                <th>តម្លៃ</th>
                                <th>ចំនួនសរុប</th>
                                <th>សកម្មភាព</th>
                            </tr>
                        </thead>
                        <tbody id="product-sale">
                        </tbody>
                        <tbody style="border-top: 1px solid #eeeeee;">
                            <tr class="form-label" style="font-size: 30px; color: #009688;">
                                <td colspan="4">
                                    <h3></h3>
                                    សរុប​ : </td>
                                <td id="total"></td>
                            </tr>
                        </tbody>
                    </table>
                    <hr style="style3" />
                </div>

                <div class="col s5 offset-s1">
                    <div class="row">
                        <button type="button" class="col s3 btn btn-large waves-effect waves-light form-label btn-save">
                            រក្សាទុក
                            <i class="material-icons right">save</i>
                        </button>
                    </div>
                </div>

            </div>

            <%--<div class="row" id="footer">
                <button type="button" id="reset-update" class="col s3 btn btn-large waves-effect waves-light blue-grey darken-1 form-label" name="action">
                    រក្សាទុក
                <i class="material-icons right">save</i>
                </button>
                <button type="button" id="update-data" class="col s3 btn btn-large waves-effect waves-light form-label" name="action">
                    កែប្រែទិន្ន័យ
                <i class="material-icons right">send</i>
                </button>
            </div>--%>

        </div>
    </div>

    <script>
        $(document).ready(function () {
            var tableArr = [];
            var foodCateArr = [];
            var drinkCateArr = [];
            var allFoodArr = [];
            var allDrinkArr = [];
            var productSale = [];

            //window load
            $(window).load(function () {
                displayAllTableFromDB();
                displayAllFoodCate();
                displayAllDrinkCate();
                displayAllFood();
                displayAllDrink();
                setTimeout(function () {
                    $(".js-discount").val(0);
                    $(".loader").css("display", "none");
                    $("#table-list").show();
                    var tableField = "tableId";
                    var foodCateField = "foodCateId";
                    var drinkCateField = "drinkCateId";

                    displayShortTableASC(tableField);
                    displayShortFoodCateASC(foodCateField);
                    displayShortDrinkCateASC(drinkCateField);
                    displayAllFoodList();
                }, 1000);
            });

            $("#search").keyup(function () {
                var search = $("#search").val();
                if (search != "" || search != null) {
                    searchTable(search);
                }
            });

            $(".filter-table").click(function () {
                var filterVal = this.value;
                searchTable(filterVal);
            });

            $(document).on("click", "#table-list .table-info", function (e) {
                var tableId = $(this).find('.tableId').val();
                var filterTable = tableArr.filter(function (obj) {
                    var data = obj.tableId.toLowerCase().indexOf(tableId.toLowerCase()) > -1;
                    return (data);
                });
                for (var i = 0; i < filterTable.length; i++) {
                    document.getElementById("tableName").innerHTML = filterTable[i].tableName;
                }

                $("#modal-insert").modal("open");
                $("#modal-insert").css("display", "grid");
            });

            //function displayAllTableFromDB
            function displayAllTableFromDB() {
                $.ajax({
                    type: "POST",
                    url: "Sale.aspx/DisplayAllTable",
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

            //function displayAllFoodCate
            function displayAllFoodCate() {
                $.ajax({
                    type: "POST",
                    url: "Sale.aspx/DisplayAllFoodCate",
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

            //function displayAllDrinkCate
            function displayAllDrinkCate() {
                $.ajax({
                    type: "POST",
                    url: "Sale.aspx/DisplayAllDrinkCate",
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

            //function displayAllFood
            function displayAllFood() {
                $.ajax({
                    type: "POST",
                    url: "Sale.aspx/DisplayAllFood",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            allFoodArr = result.d;
                            return allFoodArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //function displayAllDrink
            function displayAllDrink() {
                $.ajax({
                    type: "POST",
                    url: "Sale.aspx/DisplayAllDrink",
                    data: JSON.stringify({}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        if (result.d) {
                            allDrinkArr = result.d;
                            return allDrinkArr;
                        }
                    },
                    failure: function (xmlhttprequest, textstatus, errorthrown) {
                        sweetAlert("Oops...", errorthrown, "error");
                    },
                });
            }

            //displayShortTableASC
            function displayShortTableASC(field) {
                var tableASC = tableArr.sort(function (a, b) {
                    if (field == "tableId") {
                        if (a.tableId < b.tableId)
                            return -1;
                        if (a.tableId > b.tableId)
                            return 1;
                    }
                });
                $('#table-list').html("");
                var str = "";
                for (var i = 0; i < tableASC.length; i++) {
                    var status = (tableASC[i].status).trim();
                    $('#table-list').append(
                        '<div class="col s2 hvr-pulse-shrink hvr-underline-from-center table-info" style="text-align: center; cursor: pointer;">' +
                            '<div class="card">' +
                                '<div class="card-image waves-effect waves-block waves-light">' +
                                    ((tableASC[i].status).trim() == "closed" ? '<img class="activator" src="image/closed.png">' : '<img class="activator" src="image/active.png">') +
                                '</div>' +
                                '<div class="card-content">' +
                                    '<button style="display:none;" class="tableId" value=' + tableASC[i].tableId + '></button>' +
                                    '<span class="card-title activator teal-text text-darken-4​ form-label" data-tableName=' + tableASC[i].tableName + '>' + tableASC[i].tableName + '</span>' +
                                    '<p style="text-align:center;" class="orange-text text-darken-4 form-label">' + tableASC[i].tableType + '</p>' +
                                '</div>' +
                            '</div>' +
                        '</div>'
                        );
                }
            }

            //search
            function searchTable(filterVal) {
                if (filterVal != "" || filterVal != null) {
                    var filterTable = tableArr.filter(function (obj) {
                        var data = obj.tableName.toLowerCase().indexOf(filterVal.toLowerCase()) > -1 ||
                                   obj.status.toLowerCase().indexOf(filterVal.toLowerCase()) > -1 ||
                                   obj.tableType.toLowerCase().indexOf(filterVal.toLowerCase()) > -1;
                        return (data);
                    });
                    $('#table-list').html("");
                    var str = "";
                    for (var i = 0; i < filterTable.length; i++) {
                        $('#table-list').append(
                            '<div class="col s2 hvr-pulse-shrink hvr-underline-from-center table-info" style="text-align: center; cursor: pointer;">' +
                                '<div class="card" data-tableName=' + filterTable[i].tableName + '>' +
                                    '<div class="card-image waves-effect waves-block waves-light">' +
                                        ((filterTable[i].status).trim() == "closed" ? '<img class="activator" src="image/closed.png">' : '<img class="activator" src="image/active.png">') +
                                    '</div>' +
                                    '<div class="card-content">' +
                                        '<button style="display:none;" class="tableId" value=' + filterTable[i].tableId + '></button>' +
                                        '<span class="card-title activator teal-text text-darken-4​ form-label">' + filterTable[i].tableName + '</span>' +
                                        '<p style="text-align:center;" class="orange-text text-darken-4 form-label">' + filterTable[i].tableType + '</p>' +
                                    '</div>' +
                                '</div>' +
                            '</div>'
                        );
                    }
                }
                if (filterVal == 'showAll' || filterVal == "") {
                    var field = 'tableId';
                    displayShortTableASC(field);
                }
            }

            //displayFoodCate
            function displayShortFoodCateASC(field) {
                var foodCateASC = foodCateArr.sort(function (a, b) {
                    if (field == "foodCateId") {
                        if (a.foodCateId < b.foodCateId)
                            return -1;
                        if (a.foodCateId > b.foodCateId)
                            return 1;
                    }
                });
                $('#food-cate').html("");
                for (var i = 0; i < foodCateASC.length; i++) {
                    $('#food-cate').append(
                        '<button type="button"' +
                        ' class="waves-effect waves-light btn-large green lighten-1 form-label food-cate" ' +
                        'style="margin-right:10px;" value=' + foodCateASC[i].foodCateId + '>' + foodCateASC[i].foodCateName + '</button>'
                    );
                }
            }

            //displayDrinkCate
            function displayShortDrinkCateASC(field) {
                var drinkCateASC = drinkCateArr.sort(function (a, b) {
                    if (field == "drinkCateId") {
                        if (a.drinkCateId < b.drinkCateId)
                            return -1;
                        if (a.drinkCateId > b.drinkCateId)
                            return 1;
                    }
                });
                $('#drink-cate').html("");
                for (var i = 0; i < drinkCateASC.length; i++) {
                    $('#drink-cate').append(
                        '<button type="button" ' +
                        'class="waves-effect waves-light btn-large light-blue lighten-1 form-label drink-cate"' +
                        ' style="margin-right:10px;" value=' + drinkCateASC[i].drinkCateId + '>' + drinkCateASC[i].drinkCateName + '</button>'
                    );
                }
            }

            //displayAllFoodList
            function displayAllFoodList() {
                var limit = 10;
                var foodLimit = allFoodArr.slice(0, limit);
                $('#product-list').html("");
                for (var i = 0; i < foodLimit.length; i++) {
                    $('#product-list').append(
                        '<div class="col s3 hvr-pulse-shrink hvr-underline-from-center productInfo" style="text-align: center; cursor: pointer;">' +
                            '<div class="card-panel teal white-text icon-style">' +
                                '<button style="display:none;" value=' + foodLimit[i].foodId + ' class="productId"></button>' +
                                '<span>' + foodLimit[i].foodName + '</span><br>' +
                                '<span>' + foodLimit[i].foodUnitName + '</span>' +
                                '<hr class="style3">' +
                                '<span>' + foodLimit[i].price + ' ៛</span>' +
                            '</div>' +
                        '</div>'
                    )
                }
            }

            //searchAllProduct
            function searchAllProduct(search) {
                var filterFood = allFoodArr.filter(function (obj) {
                    var data = obj.foodCateId.toLowerCase().indexOf(search.toLowerCase()) > -1 ||
                               obj.foodName.toLowerCase().indexOf(search.toLowerCase()) > -1;
                    return (data);
                });
                var filterDrink = allDrinkArr.filter(function (obj) {
                    var data = obj.drinkCateId.toLowerCase().indexOf(search.toLowerCase()) > -1 ||
                               obj.drinkName.toLowerCase().indexOf(search.toLowerCase()) > -1;
                    return (data);
                });

                $('#product-list').html("");
                if (filterFood.length > 0 || filterDrink.length > 0) {
                    for (var i = 0; i < filterFood.length; i++) {
                        $('#product-list').append(
                            '<div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">' +
                                '<div class="card-panel teal white-text icon-style">' +
                                    '<button style="display:none;" value=' + filterFood[i].foodId + ' class="productId"></button>' +
                                    '<span>' + filterFood[i].foodName + '</span><br>' +
                                    '<span>' + filterFood[i].foodUnitName + '</span>' +
                                    '<hr class="style3">' +
                                    '<span>' + filterFood[i].price + ' ៛</span>' +
                                '</div>' +
                            '</div>'
                        )
                    }
                    for (var i = 0; i < filterDrink.length; i++) {
                        $('#product-list').append(
                            '<div class="col s3 hvr-pulse-shrink hvr-underline-from-center productInfo" style="text-align: center; cursor: pointer;">' +
                                '<div class="card-panel teal white-text icon-style">' +
                                    '<button style="display:none;" value=' + filterDrink[i].drinkId + ' class="productId"></button>' +
                                    '<span>' + filterDrink[i].drinkName + '</span>' +
                                    '<span>' + filterDrink[i].drinkUnitName + '</span>' +
                                    '<hr class="style3">' +
                                    '<span>' + filterDrink[i].price + ' ៛</span>' +
                                '</div>' +
                            '</div>'
                        )
                    }
                }
            }

            $("#search-product").keyup(function () {
                var search = $("#search-product").val();
                if (search != "" || search != null) {
                    searchAllProduct(search);
                }
                if (search == "" || search == null) {
                    displayAllFoodList();
                }
            });

            $(document).on("click", "#food-cate .food-cate", function (e) {
                var foodCateId = e.currentTarget.value;
                var filterFood = allFoodArr.filter(function (obj) {
                    var data = obj.foodCateId.toLowerCase().indexOf(foodCateId.toLowerCase()) > -1;
                    return (data);
                });
                $('#product-list').html("");
                if (filterFood.length > 0) {
                    for (var i = 0; i < filterFood.length; i++) {
                        $('#product-list').append(
                            '<div class="col s3  hvr-pulse-shrink hvr-underline-from-center productInfo" style="text-align: center; cursor: pointer;">' +
                                '<div class="card-panel teal white-text icon-style">' +
                                    '<button style="display:none;" value=' + filterFood[i].foodId + ' class="productId"></button>' +
                                    '<span>' + filterFood[i].foodName + '</span><br>' +
                                    '<span>' + filterFood[i].foodUnitName + '</span>' +
                                    '<hr class="style3">' +
                                    '<span>' + filterFood[i].price + ' ៛</span>' +
                                '</div>' +
                            '</div>'
                        )
                    }
                }
            });

            $(document).on("click", "#drink-cate .drink-cate", function (e) {
                var drinkCateId = e.currentTarget.value;
                var filterDrink = allDrinkArr.filter(function (obj) {
                    var data = obj.drinkCateId.toLowerCase().indexOf(drinkCateId.toLowerCase()) > -1;
                    return (data);
                });

                $('#product-list').html("");
                if (filterDrink.length > 0) {
                    for (var i = 0; i < filterDrink.length; i++) {
                        $('#product-list').append(
                            '<div class="col s3 hvr-pulse-shrink hvr-underline-from-center productInfo" style="text-align: center; cursor: pointer;">' +
                                '<div class="card-panel teal white-text icon-style">' +
                                    '<button style="display:none;" class="productId" value=' + filterDrink[i].drinkId + '></button>' +
                                    '<span>' + filterDrink[i].drinkName + '</span><br>' +
                                    '<span>' + filterDrink[i].drinkUnitName + '</span><br>' +
                                    '<hr class="style3">' +
                                    '<span>' + filterDrink[i].price + ' ៛</span>' +
                                '</div>' +
                            '</div>'
                        )
                    }
                }
            });

            //=============== sale ==============
            $(document).on("click", "#product-list .productInfo", function () {
                var productId = $(this).find('.productId').val();
                if (!!productId) {
                    if (productSale.length > 0) {
                        var product = productSale.find(function (o) {
                            if (!o) {
                                return null;
                            }
                            return o.productId.trim() == productId;
                        });
                        if (product) {
                            product.qty = parseInt(product.qty) + 1;
                            product.amount = product.qty * product.price;
                        } else {
                            insertProductArr(productId);
                        }
                    }
                    else {
                        insertProductArr(productId);
                    }
                    appenProductSale();
                }
            });

            //appenProductSale
            function appenProductSale() {
                $("#product-sale").html("");
                var total = 0;
                for (var i = 0; i < productSale.length; i++) {
                    if (productSale[i]) {
                        total += productSale[i].amount;
                        $("#product-sale").append(
                        '<tr>' +
                            '<td style="display:none;">' + productSale[i].productId + '</td>' +
                            '<td>' + productSale[i].productName + '</td>' +
                            '<td>' + productSale[i].productUnit + '</td>' +
                            '<td>' +
                                '<button value=' + productSale[i].productId + ' type="button" class="btn-floating waves-effect waves-light decreaseQty" data-productId=' + productSale[i].productId + '>' +
                                    '<i class="material-icons">remove</i>' +
                                '</button>' +
                                    '<span style="margin-right:20px;margin-left:20px;">' + productSale[i].qty + '</span>' +
                                    //'<input type="text" value=' + productSale[i].qty + ' class="js-qty" style="width:100px;" data-productId=' + productSale[i].productId + '>'+
                                '<button value=' + productSale[i].productId + ' type="button" class="btn-floating waves-effect waves-light increaseQty" data-productId=' + productSale[i].productId + '>' +
                                    '<i class="material-icons">add</i>' +
                                '</button>' +
                            '</td>' +
                            '<td>' + productSale[i].price + '​៛</td>' +
                            '<td style="color:#0277bd;">' + productSale[i].amount + '៛</td>' +
                            '<td>' +
                            '<button value=' + productSale[i].productId + ' type="button" class="btn-floating waves-effect waves-light red delete-product" data-index=' + i + '>' +
                                '<i class="material-icons">delete</i></button>' +
                            '</td>' +
                        '</tr>'
                    );

                    }
                }
                document.getElementById("total").innerHTML = total + "៛";
            }

            //insertProductArr
            function insertProductArr(productId) {
                if (allFoodArr.length > 0 || allDrinkArr.length > 0) {
                    var filterFood = allFoodArr.filter(function (obj) {
                        var data = obj.foodId.toLowerCase().indexOf(productId.toLowerCase()) > -1;
                        return (data);
                    });
                    var filterDrink = allDrinkArr.filter(function (obj) {
                        var data = obj.drinkId.toLowerCase().indexOf(productId.toLowerCase()) > -1;
                        return (data);
                    });
                    var data = {};
                    if (filterFood.length > 0) {
                        for (var i = 0; i < filterFood.length > 0; i++) {
                            data = {
                                productId: filterFood[i].foodId,
                                productName: filterFood[i].foodName,
                                productUnit: filterFood[i].foodUnitName,
                                qty: filterFood[i].qty,
                                price: filterFood[i].price,
                                amount: filterFood[i].qty * filterFood[i].price
                            };
                            productSale.push(data);
                        }
                    }
                    if (filterDrink.length > 0) {
                        for (var i = 0; i < filterDrink.length > 0; i++) {
                            data = {
                                productId: filterDrink[i].drinkId,
                                productName: filterDrink[i].drinkName,
                                productUnit: filterDrink[i].drinkUnitName,
                                qty: filterDrink[i].qty,
                                price: filterDrink[i].price,
                                amount: filterDrink[i].qty * filterDrink[i].price
                            };
                            productSale.push(data);
                        }
                    }
                }
            }
            //=============== end sale ==========

            $(document).on("keypress", "#product-sale tr .js-qty", function (e) {
                if (e.which == 13) {
                    var currentTarget = $(e.currentTarget);
                    var currentValue = currentTarget.val();
                    var productId = currentTarget.attr("data-productId");
                    if (productSale.length > 0) {
                        var product = productSale.find(function (o) {
                            return o.productId.trim() == productId;
                        });
                        if (product) {
                            product.qty = currentValue;
                            product.amount = currentValue * product.price;
                        }
                        appenProductSale();
                    }
                }
            });

            //current row delete
            $(document).on("click", "#product-sale tr .delete-product", function (e) {
                var currentTarget = $(e.currentTarget);
                var index = currentTarget.attr("data-index");
                if (!!index) {
                    swal({
                        title: "តើអ្នកពិតជាចង់លុបមែនទេ?",
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
                            delete productSale[index];
                            appenProductSale();
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                }
            });

            //increaseQty
            $(document).on("click", "#product-sale tr .increaseQty", function (e) {
                var currentTarget = $(e.currentTarget);
                var productId = currentTarget.attr("data-productId");
                if (productSale.length > 0) {
                    var product = productSale.find(function (o) {
                        if (!o) {
                            return null;
                        }
                        return o.productId.trim() == productId;
                    });
                    if (product) {
                        product.qty = parseInt(product.qty) + 1;
                        product.amount = product.qty * product.price;
                    }
                    appenProductSale();
                }
            });

            //descraseQty
            $(document).on("click", "#product-sale tr .decreaseQty", function (e) {
                var currentTarget = $(e.currentTarget);
                var productId = currentTarget.attr("data-productId");
                if (productSale.length > 0) {
                    var product = productSale.find(function (o) {
                        if (!o) {
                            return null;
                        }
                        return o.productId.trim() == productId;
                    });
                    if (product) {
                        product.qty = parseInt(product.qty) - 1;
                        if (product.qty <= 0)
                            product.qty = 1;
                        product.amount = product.qty * product.price;
                    }
                    appenProductSale();
                }
            });

            $(document).on("keypress", "#product-sale tr .js-qty", function (e) {
                if (e.which == 13) {
                    var currentTarget = $(e.currentTarget);
                    var currentValue = currentTarget.val();
                    var productId = currentTarget.attr("data-productId");
                    if (productSale.length > 0) {
                        var product = productSale.find(function (o) {
                            return o.productId.trim() == productId;
                        });
                        if (product) {
                            product.qty = currentValue;
                            product.amount = currentValue * product.price;
                        }
                        appenProductSale();
                    }
                }
            });

            //saveProduct
            $(".btn-save").click(function () {
                if (productSale.length > 0) {
                    $.ajax({
                        type: "POST",
                        url: "Sale.aspx/SaveProduct",
                        data: JSON.stringify({ productSale: productSale }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (result) {
                            /*
                            if (result.d) {
                                allFoodArr = result.d;
                                return allFoodArr;
                            }
                            */
                        },
                        failure: function (xmlhttprequest, textstatus, errorthrown) {
                            console.log(errorthrown);
                            //sweetAlert("Oops...", errorthrown, "error");
                        },
                    });
                }
            });

            $("#modal-insert").modal({
                dismissible: true,
                ready: function (modal, trigger) {
                },
                complete: function () {
                    productSale = [];
                    $("#product-sale").html("");
                    document.getElementById("total").innerHTML = "0";
                }
            });
            //$('.modal').modal();
        });
    </script>
</asp:Content>
