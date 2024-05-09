<%@ Page Title="" Language="C#" MasterPageFile="~/DriverMasterPage.master" AutoEventWireup="true" CodeFile="Driver-View-Bus-Stop.aspx.cs" Inherits="Driver_View_Bus_Stop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblbus_no" runat="server" Visible="false"></asp:Label>

    <div class="container tm-mt-big tm-mb-big">
        <div class="row">
            <div class="col-12 mx-auto tm-login-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h2 class="tm-block-title mb-4">View Bus Stop</h2>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <div class="form-group mt-4">
                             <asp:Label ID="lblheadbus_stop" runat="server" Text="Bus Stops:" ForeColor="White"></asp:Label>   <asp:Label ID="lblbus_stop" runat="server" ForeColor="White"></asp:Label>
                            </div>

                            

                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

