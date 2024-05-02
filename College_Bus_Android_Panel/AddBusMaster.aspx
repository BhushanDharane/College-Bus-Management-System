<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddBusMaster.aspx.cs" Inherits="AddBusMaster" %>

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
                                ADD BUS Details
                                <asp:Label ID="LblId" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Bus No.</label>
                                        <asp:TextBox ID="txtbus_no" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbus_no" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Stop Name</label>
                                        <asp:TextBox ID="txtstop_name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtstop_name" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <div class="form-group">
                                        <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="btnsubmit_Click" />
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

