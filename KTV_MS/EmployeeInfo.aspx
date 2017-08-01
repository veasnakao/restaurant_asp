<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeInfo.aspx.cs" Inherits="KTV_MS.EmployeeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <a href="Data.aspx" class="btn-floating btn-large waves-effect waves-light green darken-1" style="margin-right: 20px;"><i class="material-icons">arrow_back</i></a>
    <a href="AddEmployee.aspx" class="waves-effect waves-light btn btn-large form-label"><i class="material-icons right">add</i>បង្កើតថ្មី</a>
    <br />
    <br />
    <br />
    <table>
        <thead>
            <tr class="th-label">
                <th>លេខកូដ</th>
                <th>ឈ្មោះបុគ្គលិក</th>
                <th>ភេទ</th>
                <th>ថ្ងៃខែឆ្នាំកំណើត</th>
                <th>លេខទូរស័ព្ទ</th>
                <th>សកម្មភាព</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td>Alvin</td>
                <td>Eclair</td>
                <td>$0.87</td>
                <td></td>
                <td></td>
                <td>
                    <a class="btn-floating waves-effect waves-light"><i class="material-icons">edit</i></a>
                    <a class="btn-floating waves-effect waves-light red"><i class="material-icons">delete</i></a>
                </td>
            </tr>
            <tr>
                <td>Alan</td>
                <td>Jellybean</td>
                <td>$3.76</td>
                <td></td>
                <td></td>
                <td>
                    <a class="btn-floating waves-effect waves-light"><i class="material-icons">edit</i></a>
                    <a class="btn-floating waves-effect waves-light red"><i class="material-icons">delete</i></a>
                </td>
            </tr>
            <tr>
                <td>Jonathan</td>
                <td>Lollipop</td>
                <td>$7.00</td>
                <td></td>
                <td></td>
                <td>
                    <a class="btn-floating waves-effect waves-light"><i class="material-icons">edit</i></a>
                    <a class="btn-floating waves-effect waves-light red"><i class="material-icons">delete</i></a>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
