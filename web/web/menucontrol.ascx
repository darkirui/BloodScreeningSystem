<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menucontrol.ascx.cs" Inherits="web.menucontrol" %>
<div class="header-bottom">
                <div class="content-wrap">
            <div class="menuwrap">
                <nav class="navbar navbar-default">
                    <div class="">
                        <div class="navbar-header">
		                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		                        <span class="sr-only">Toggle navigation</span>
		                        <span class="icon-bar"></span>
		                        <span class="icon-bar"></span>
		                        <span class="icon-bar"></span>
		                    </button>
		                    <a class="navbar-brand" href="/default.aspx"><i class="fa fa-home" aria-hidden="true"></i></a>
		                </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-left">
                                <li class="dropdown">
								    <a href="/allpatients.aspx" class='dropdown-toggle disabled' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>PATIENTS<span class='caret'></span></a>
									<ul class="dropdown-menu">
                                        <li><a href="/allpatients.aspx">All Patients</a></li>
                                        <li><a href="/searchpatient.aspx">Search Patient</a></li>
                                        <li><a href="/addpatient.aspx">Add Patient</a></li>			
									</ul>
								</li>

                                <asp:PlaceHolder runat="server" ID="patientMenuPlaceholder" ></asp:PlaceHolder>
                                <%--<li class="dropdown">
								    <a href="Account/Login.aspx" class='dropdown-toggle disabled' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>SCREENING TOOLS<span class='caret'></span></a>
									<ul class="dropdown-menu">
                                        <li><a href="">Blood Pressure Screening</a></li>
                                        <li><a href="">Alcohol Screening</a></li>
                                        <li><a href="">Depression Screening</a></li>
                                        <li><a href="">Gender Based Violence Screening</a></li>			
									</ul>
								</li>
                                <li class="">
								    <a class="" href="/default.aspx">AVAILABLE DATA</a>
								</li>--%>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
								    <a href="Account/Login.aspx" class='dropdown-toggle disabled' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><i class="fa fa-user-circle-o" aria-hidden="true"></i> DARIUS<span class='caret'></span></a>
									<ul class="dropdown-menu">
                                        <li><a href="/logout.aspx">LOGOUT</a></li>
                                        <li><a href="/settings.aspx">SETTINGS</a></li>
                                        <li><a href="/adduser.aspx">ADD USERS</a></li>
                                        <li><a href="/adduserroles.aspx">ADD USERS ROLES</a></li>
                                        <li><a href="/addfacility.aspx">ADD FACILITIES</a></li>			
									</ul>
								</li    
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </nav>
            </div> 
        </div>
    </div>