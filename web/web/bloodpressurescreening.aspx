<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="bloodpressurescreening.aspx.cs" Inherits="web.bloodpressurescreening" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-wrap">
        <div class="patient-details-wrap">
            <div class="patient-name patient-detail">
                Name: Darius ###### #####
            </div>
            <div class="patient-name patient-detail">
                Phone: 0715 547 652
            </div>
            <div class="patient-name patient-detail">
               ID No: 27760904 
            </div>
            <div class="patient-name patient-detail">
               DOB: 11/10/1990 
            </div>
        </div>
        <div class="top-content-section">
            <div class="top-title-section">
                <h2>Blood Pressure Screening <i class="fa fa-heartbeat" aria-hidden="true"></i></i></h2>
            </div>
            <div class="top-visit-date">
                <label id="Label2" class="right15">
                     Visit Date 
                </label>
                <input id="txtarttransdate" runat="server" maxlength="11" size="30" name="txtarttransdate" />
            </div>
        </div>
        <form id="createpatient"  runat="server">
            <div class="form-row">
                <div class="form-group">
                    <label for="patientname">Systolic Reading (mmHg)</label>
                    <input type="text" class="form-control" id="Text7" name="patientname" placeholder="Enter Patient Name">
                </div>
                <div class="form-group">
                    <label for="patientname">Diastolic Reading (mmHg)</label>
                    <input type="text" class="form-control" id="Text8" name="patientname" placeholder="Enter Patient Name">
                </div>
            </div>
            <div class="form-row">
                <asp:Button ID="btnLogin" runat="server" Text="SUBMIT"/>
            </div>
        </form>
    </div>
</asp:Content>
