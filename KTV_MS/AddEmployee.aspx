<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="KTV_MS.AddEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <a href="EmployeeInfo.aspx" class="btn-floating btn-large waves-effect waves-light green darken-1"><i class="material-icons">arrow_back</i></a>
    <br />
    <br />
    <br />

    <div class="row">
        <form class="formValidate" id="formValidate">
            <div class="row">
                <div class="input-field col s4">
                    <label for="empId" class="form-label">លេខកូដបុគ្គលិក</label>
                    <input id="empId" class="validate" type="text" required>
                </div>

                <div class="input-field col s4">
                    <label for="empName" class="form-label">ឈ្មោះបុគ្គលិក</label>
                    <input id="firstName" class="validate" type="text" required>
                </div>

                <div class="input-field col s4">
                    <select class="form-label" id="gender">
                        <option value="" disabled selected>សូមជ្រើសរើស</option>
                        <option value="male">ប្រុស</option>
                        <option value="female">ស្រី</option>
                    </select>
                    <label ​style="font-family:'Khmer OS Freehand';">ភេទ</label>
                </div>

                <div class="input-field col s4">
                    <label for="empName" class="form-label">ថ្ងៃខែឆ្នាំកំណើត</label>
                    <input type="date" class="datepicker">
                </div>

                <div class="input-field col s4">
                    <label for="tel" class="form-label">លេខទូរស័ព្ទ</label>
                    <input id="tel" class="validate" type="text" required>
                </div>

                <div class="input-field col s12">
                    <textarea id="textarea1" class="materialize-textarea"></textarea>
                    <label for="textarea1" class="form-label">អាសយដ្ឋាន</label>
                </div>

            </div>
            <div class="row">
                <div class="input-field col s5 offset-s8">
                    <button class="btn btn-large waves-effect waves-light blue-grey darken-1 form-label" type="reset" name="action">កំណត់ឡើងវិញ
                        <i class="material-icons right">loop</i>
                    </button>
                    <button class="btn btn-large waves-effect waves-light form-label" type="submit" name="action">បញ្ចូលថ្មី
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function () {
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 80 // Creates a dropdown of 15 years to control year
            });

            $('select').material_select();
        });
    </script>
</asp:Content>
