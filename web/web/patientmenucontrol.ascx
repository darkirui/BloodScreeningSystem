<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="patientmenucontrol.ascx.cs" Inherits="web.patientmenucontrol" %>
<li class="dropdown">
	<a href="Account/Login.aspx" class='dropdown-toggle disabled' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>SCREENING TOOLS<span class='caret'></span></a>
	<ul class="dropdown-menu">
        <li><a href="/bloodpressurescreening.aspx">Blood Pressure Screening</a></li>
        <li><a href="/alcoholscreening.aspx">Alcohol Screening</a></li>
        <li><a href="/depressionscreening.aspx">Depression Screening</a></li>
        <li><a href="/gbvscreening.aspx">Gender Based Violence Screening</a></li>			
	</ul>
</li>
<li class="">
	<a class="" href="/data.aspx">AVAILABLE DATA</a>
</li>