<%@ Page Title="" Language="C#" MasterPageFile="~/DriverMasterPage.master" AutoEventWireup="true" CodeFile="Driver-Scan-Student-QR.aspx.cs" Inherits="Driver_Scan_Student_QR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container tm-mt-big tm-mb-big">
        <div class="row">
            <div class="col-12 mx-auto tm-login-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h2 class="tm-block-title mb-4">Scan Qr Code</h2>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <div class="form-group mt-4">
                                <asp:Button ID="btnscan" runat="server" Text="Scan QR Code" CssClass="btn btn-primary btn-block text-uppercase" OnClick="btnscan_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

