<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentQRCodeShow.aspx.cs" Inherits="StudentQRCodeShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>



    <div class="container tm-mt-big tm-mb-big">
        <div class="row">
            <div class="col-12 mx-auto tm-login-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h2 class="tm-block-title mb-4">Show Student QR Code</h2>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12 text-center">

                            <div class="form-group">
                                <asp:Image ID="imgQRCode" Width="250px" Height="250px" runat="server" Visible="false" />
                            </div>
                            <asp:Label ID="lblscan_mobile_no" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

