<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add-Bus.aspx.cs" Inherits="Add_Bus" %>

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
                                ADD Driver Details
                                <asp:Label ID="LblId" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Bus No.</label>
                                        <asp:DropDownList ID="txtbus_no" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbus_no" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Bus Name</label>
                                        <asp:TextBox ID="txtbus_name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                    </div>
                                </div>

                                <asp:TextBox ID="txtroute" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>

                                <%--<div class="col-md-6">
                                    <div class="form-group">
                                        <label>Route</label>
                                        <asp:TextBox ID="txtroute" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtroute" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>--%>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Driver Name</label>
                                        <asp:TextBox ID="txtdriver_name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Driver Contact</label>
                                        <asp:TextBox ID="txtdriver_contact" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdriver_contact" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="[0-9]{1,50}" ControlToValidate="txtdriver_contact" ErrorMessage="Please Enter numbers only" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    Bus Time Table Image
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                    <asp:Label ID="lblimg_path" runat="server"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Please Upload Time Table" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
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

