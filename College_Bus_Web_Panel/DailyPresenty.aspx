<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DailyPresenty.aspx.cs" Inherits="DailyPresenty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblbus_no" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstu_name" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstop_name" runat="server" Visible="false"></asp:Label>

    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-12 mx-auto tm-login-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12 text-center">
                <h2 class="tm-block-title mb-4">Mark Presenty</h2>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">

                  
                  <div class="form-group">
                    <label for="username">Present/Absent</label>
                      <asp:DropDownList ID="cmbpresent_absent" runat="server" CssClass="form-control">
                          <asp:ListItem>Select</asp:ListItem>
                          <asp:ListItem>P</asp:ListItem>
                          <asp:ListItem>A</asp:ListItem>
                      </asp:DropDownList>
                  </div>
                  
                  <div class="form-group mt-4">
                    <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary btn-block text-uppercase" OnClick="btnsubmit_Click" />
                      <br />
                      <asp:Label ID="lblmsg" runat="server"></asp:Label>
                     
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>

