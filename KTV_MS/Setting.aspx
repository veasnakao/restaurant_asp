<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="KTV_MS.Setting" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">
            <div class="card-panel teal white-text icon-style">
                <i class="material-icons large waves-effect waves-light">domain</i>
                <h5 style="font-family: 'Khmer OS Freehand';">ក្រុមហ៊ុន</h5>
            </div>
        </div>
        <a href="ProductUnit.aspx">
            <div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">
                <div class="card-panel teal white-text icon-style">
                    <i class="material-icons large waves-effect waves-light">ac_unit</i>
                    <h5 style="font-family: 'Khmer OS Freehand';">ខ្នាតទំនិញ</h5>
                </div>
            </div>
        </a>
        <a href="ProductCate.aspx">
        <div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">
            <div class="card-panel teal white-text icon-style">
                <i class="material-icons large waves-effect waves-light">local_dining</i>
                <h5 style="font-family: 'Khmer OS Freehand';">ក្រុមទំនិញ</h5>
            </div>
        </div>
        </a>
    </div>
</asp:Content>
