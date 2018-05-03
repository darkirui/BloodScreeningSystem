<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="searchpatient.aspx.cs" Inherits="web.searchpatient" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-wrap">
        <div class="login-container" width="40%;">
            <form id="signIn"  runat="server">
                <h2>Search Patient</h2>
                <div class="form-group">
                    <label for="patientname">Enter Phone Number</label>
                    <asp:TextBox ID="txtPhone" class="form-control" runat="server"></asp:TextBox>
                </div>
                <h2>OR</h2>
                <div class="form-group">
                    <label for="patientname">Enter ID Number</label>
                    <asp:TextBox ID="txtIDNO" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSearchPatient" runat="server" Text="Search" OnClick="btnSearchPatient_Click"/>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
