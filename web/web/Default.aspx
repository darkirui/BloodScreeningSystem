<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="web._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-wrap">
        <div class="login-container" width="40%;">
            <form id="signIn"  runat="server">
                <h2>Blood Pressure Screening Tool</h2>
                <div class="form-group">
                    <label for="patientname">Username</label>
                    <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="patientname">Password</label>
                    <asp:TextBox ID="txtUserPassword" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="patientgender">Choose Facility</label>
                     <asp:DropDownList ID="DDLFacility" class="form-control" runat="server">
                        <asp:ListItem Text="Choose Facility" Value=""></asp:ListItem>
                        <asp:ListItem Text="Kisumu" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Kericho" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Bungoma" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
