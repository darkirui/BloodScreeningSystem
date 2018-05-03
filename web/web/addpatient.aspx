<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addpatient.aspx.cs" Inherits="web.addpatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-wrap">
        <form id="createpatient"  runat="server">
        <div class="top-content-section">
            <div class="top-title-section">
                <h2>Add Patient <i class="fa fa-plus-square" aria-hidden="true"></i></h2>
            </div>
            <div class="top-visit-date">
                <label id="Label2" class="right15">
                     Visit Date 
                </label>
                <asp:TextBox ID="txtsarttransdate" runat="server" maxlength="11" size="30" />
            </div>
        </div>
        <div class="form-section">
                <div class="form-row">
                    <div class="form-group">
                        <label for="patientname">Firstname</label>
                        <asp:TextBox ID="txtfirstname" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="patientname">Surname</label>
                        <asp:TextBox ID="txtsurname" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="patientname">Lastname</label>
                        <asp:TextBox ID="txtlastname" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="patientname">ID Number</label>
                        <asp:TextBox ID="txtidno" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="patientname">Phonenumber</label>
                        <asp:TextBox ID="txtPhonenumber" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="patientname">DOB</label>
                        <asp:TextBox ID="txtDOB" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="patientname">Gender</label>
                        <asp:TextBox ID="txtGender" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="top-content-section">
                    <div class="top-title-section">
                        <h2>Blood Pressure Screening <i class="fa fa-heartbeat" aria-hidden="true"></i></h2>
                    </div>
                    <div class="top-visit-date">
                        First Visit Screening
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="patientname">Systolic Reading (mmHg)</label>
                        <asp:TextBox ID="txtSystolic" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="patientname">Diastolic Reading (mmHg)</label>
                        <asp:TextBox ID="txtDiastolic" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <asp:Button ID="btnLogin" runat="server" Text="SUBMIT" OnClick="btnAddPatient_Click"/>
                </div>
        </div>
        </form>
    </div>
</asp:Content>
