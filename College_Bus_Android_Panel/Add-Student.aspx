<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add-Student.aspx.cs" Inherits="Add_Student" %>

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
                                ADD STUDENT DETAILS
                                <asp:Label ID="LblId" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Student Name</label>
                                        <asp:TextBox ID="txtstu_name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtstu_name" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddress" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Mobile</label>
                                        <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmobile" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="[0-9]{1,50}" ControlToValidate="txtmobile" ErrorMessage="Please Enter numbers only" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail" Font-Size="X-Small" ForeColor="Red" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Stop</label>
                                        <asp:DropDownList ID="txtstop" runat="server" CssClass="form-control" OnSelectedIndexChanged="txtstop_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtstop" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Bus No.</label>
                                        <asp:TextBox ID="txtbus_no" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtbus_no" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Total Fees</label>
                                        <asp:TextBox ID="txttotal_fees" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txttotal_fees" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="viewRegularExpressionValidator" runat="server" ValidationExpression="[0-9]{1,50}" ControlToValidate="txttotal_fees" ErrorMessage="Please Enter numbers only" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Fees Paid</label>
                                        <asp:TextBox ID="txtpaid_fees" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpaid_fees" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="[0-9]{1,50}" ControlToValidate="txtpaid_fees" ErrorMessage="Please Enter numbers only" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Pending Fees</label>
                                        <asp:TextBox ID="txtpending_fees" runat="server" CssClass="form-control" Enabled="false" Text="0"></asp:TextBox>
                                        <br />
                                    </div>
                                </div>

                                <asp:TextBox ID="txtcollge" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>

                                <%--<div class="col-md-6">
                                    <div class="form-group">
                                        <label>College</label>
                                        <asp:TextBox ID="txtcollge" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtcollge" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>--%>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Year</label>
                                        <asp:TextBox ID="txtyear" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtyear" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Department</label>
                                        <asp:TextBox ID="txtdept" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtdept" ErrorMessage="Please Fill The Detail" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
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

