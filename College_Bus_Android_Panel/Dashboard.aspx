<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="main-content">
	<section class="wrapper">
		<!-- //market-->
		<div class="market-updates">
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-4 market-update-right">
                        <img src="images/bus.png" width="60" height="50" />
					</div>
					 <div class="col-md-8 market-update-left">
					 <h4>Total Bus</h4>
					<h3> <asp:Label ID="lbltotal_bus" runat="server"></asp:Label> </h3>
				  </div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-4 market-update-right">
						<img src="images/user.png" width="55" height="50" />
					</div>
					<div class="col-md-8 market-update-left">
					<h4>Total Student</h4>
						<h3> <asp:Label ID="lblstudent" runat="server"></asp:Label> </h3>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			
			
		   <div class="clearfix"> </div>
		</div>	
		<div class="agil-info-calendar">
			<div class="clearfix"> </div>
		</div>
</section>
</section>
</asp:Content>

