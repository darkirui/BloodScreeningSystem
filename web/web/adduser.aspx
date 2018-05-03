<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="web.adduser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-wrap">
        <div class="login-container" width="40%;">
            <form id="signIn"  runat="server">
                <h2>Add User</h2>
                <div class="form-group">
                    <label for="patientname">Username</label>
                    <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="patientname">Password</label>
                    <asp:TextBox ID="txtUserPassword" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="patientgender">Choose User Role</label>
                    <asp:DropDownList ID="DDLUserRoles" class="form-control" runat="server">
                        <asp:ListItem Text="Choose" Value=""></asp:ListItem>
                        <asp:ListItem Text="Super Admin" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Doctor" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Nurse" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Health Worker" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSaveUser" runat="server" Text="ADD USER" OnClick="btnSaveUser_Click"/>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
