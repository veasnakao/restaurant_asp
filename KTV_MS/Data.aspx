<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Data.aspx.cs" Inherits="KTV_MS.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <a href="CustomerInfo.aspx">
            <div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">
                <div class="card-panel teal white-text icon-style">
                    <i class="material-icons large waves-effect waves-light">person</i>
                    <h5 style="font-family: 'Khmer OS Freehand';">អតិថិជន</h5>
                </div>
            </div>
        </a>
        <a href="TableInfo.aspx">
            <div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">
                <div class="card-panel teal white-text icon-style">
                    <i class="material-icons large waves-effect waves-light">weekend</i>
                    <h5 style="font-family: 'Khmer OS Freehand';">តុ</h5>
                </div>
            </div>
        </a>
        <a href="Food.aspx">
            <div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">
                <div class="card-panel teal white-text icon-style">
                    <i class="material-icons large waves-effect waves-light">room_service</i>
                    <h5 style="font-family: 'Khmer OS Freehand';">ម្ហូប</h5>
                </div>
            </div>
        </a>
        <a href="Drink.aspx">
            <div class="col s3 hvr-pulse-shrink hvr-underline-from-center" style="text-align: center; cursor: pointer;">
                <div class="card-panel teal white-text icon-style">
                    <i class="material-icons large waves-effect waves-light">local_bar</i>
                    <h5 style="font-family: 'Khmer OS Freehand';">ភេសជ្ជៈ</h5>
                </div>
            </div>
        </a>
    </div>
</asp:Content>
