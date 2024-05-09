<%@ Page Title="" Language="C#" MasterPageFile="~/DriverMasterPage.master" AutoEventWireup="true" CodeFile="Driver-View-Present-Student-Stop.aspx.cs" Inherits="Driver_View_Present_Student_Stop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblbus_no" runat="server" Visible="false"></asp:Label>

    <div class="container tm-mt-big tm-mb-big">
        <div class="row">
            <div class="col-12 mx-auto tm-login-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h2 class="tm-block-title mb-4">View Present Student On Stop</h2>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">


                            <div class="form-group">
                                <label for="username">Present Students:</label>
                                <br />
                                <asp:Label ID="lblresult" runat="server" ForeColor="White"></asp:Label>

                                <br />
                                <asp:Label ID="lblstop_name" runat="server" ForeColor="White" Visible="false"></asp:Label>

                                <asp:Label ID="lblpresent_stud" runat="server" ForeColor="White" Visible="false"></asp:Label>
                                

                                <asp:Label ID="lblabsent_result" runat="server" ForeColor="White"></asp:Label>

                                <asp:Label ID="lblabsent_stud" runat="server" ForeColor="White" Visible="false"></asp:Label>

                                

                            </div>

                            <%--<div class="form-group mt-4">
                                <asp:Button ID="btnview" runat="server" Text="View" CssClass="btn btn-primary btn-block text-uppercase" />
                                <br />
                                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

