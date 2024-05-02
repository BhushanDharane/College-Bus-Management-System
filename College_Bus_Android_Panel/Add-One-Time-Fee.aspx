<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add-One-Time-Fee.aspx.cs" Inherits="Add_One_Time_Fee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-md-12">
                    <div data-collapsed="0" class="panel">
                        <div class="panel-heading">
                            <div class="panel-title">
                                ADD ONE TIME FEE
                                <asp:Label ID="LblId" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Student Name</label>
                                        <asp:TextBox ID="txtstud_name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtstud_name" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Stop Name</label>
                                        <asp:TextBox ID="txtstop_name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtstop_name" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>One Time Fee</label>
                                        <asp:TextBox ID="txtfee" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfee" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="[0-9]{1,50}" ControlToValidate="txtfee" ErrorMessage="Please Enter numbers only" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Bus No.</label>
                                        <asp:TextBox ID="txtbus_no" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtbus_no" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Time</label>
                                        <asp:TextBox ID="txttime" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txttime" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Date</label>
                                        <asp:TextBox ID="txtdate" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtdate" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <div class="form-group">
                                        <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="btnsubmit_Click"/>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

