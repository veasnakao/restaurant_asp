<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="KTV_MS.AddCustomer" enableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .sweet-alert h2 {
            font-family: 'Khmer OS Freehand';
            color: #26a69a;
        }
    </style>
    <br />
    <br />
    <a href="CustomerInfo.aspx" class="btn-floating btn-large waves-effect waves-light green darken-1"><i class="material-icons">arrow_back</i></a>
    <br />
    <br />
    <br />

    <div class="row">
        <form class="formValidate" id="formValidate">
                <div class="input-field col s4">
                    <label class="form-label lbl-cusId" data-error="wrong" data-success="right">លេខកូដអតិថិជន</label>
                    <asp:TextBox ID="txtCusId" runat="server" CssClass="cusId"></asp:TextBox>
                </div>
                
                <div class="input-field col s4">
                    <label class="form-label">ឈ្មោះអតិថិជន</label>
                    <asp:TextBox ID="txtCusName" runat="server" CssClass="cusName"></asp:TextBox> 
                </div>

            <div class="input-field col s4">
                    <asp:DropDownList ID="txtGender" runat="server" CssClass="form-label gender">
                        <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                        <asp:ListItem Text ="ប្រុស" Value ="male"></asp:ListItem>
                        <asp:ListItem Text ="ស្រី" Value ="female"></asp:ListItem>
                        </asp:DropDownList>
                    <label ​style="font-family:'Khmer OS Freehand'">ភេទ</label>
                </div>

                <div class="input-field col s4">
                    <asp:DropDownList ID="txtCusType" runat="server" CssClass="form-label cusType">
                        <asp:ListItem Text ="សូមជ្រើសរើស" Value = ""></asp:ListItem>
                        <asp:ListItem Text ="VIP" Value ="vip"></asp:ListItem>
                        <asp:ListItem Text ="ទូរទៅ" Value ="general"></asp:ListItem>
                        </asp:DropDownList>
                    <label ​style="font-family:'Khmer OS Freehand'">ប្រភេទអតិថិជន</label>
                </div>

                <div class="input-field col s4">
                    <label for="tel" class="form-label">លេខទូរស័ព្ទ</label>
                    <asp:TextBox ID="txtTel" runat="server" CssClass="tel"></asp:TextBox> 
                </div>
            </div>
            <div class="row">
                <div class="input-field col s5 offset-s8">
                    <button class="btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button type="button" id="insert" class="btn btn-large waves-effect waves-light form-label" name="action">បញ្ចូលថ្មី
                        <i class="material-icons right">send</i>
                    </button>

                </div>
            </div>
        </form>
    </div>
    
    
    <script>
        $(document).ready(function () {
            //window load
            $(window).load(function () {
                maxId();
            });

            //insert button
            $("#insert").click(function () {
                var cusId = $('.cusId').val();
                var cusName = $('.cusName').val();
                var gender = $('#<%=txtGender.ClientID %> option:selected').val();
                var cusType = $('#<%=txtCusType.ClientID %> option:selected').val();
                var tel = $('.tel').val();
                insert(cusId, cusName, gender, cusType, tel);
            });

            //function insert
            function insert(cusId, cusName, gender, cusType, tel) {
                $.ajax({
                    type: "POST",
                    url: "AddCustomer.aspx/OnSubmit",
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
                    url: "AddCustomer.aspx/WindowLoad",
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
                $('.cusId').focus();
                $('.cusName').focus();
                $('.tel').focus();
            }
            $('select').material_select();
        });
    </script>
    
</asp:Content>
