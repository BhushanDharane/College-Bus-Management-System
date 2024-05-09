<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add-Complaints.aspx.cs" Inherits="Add_Complaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>

    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-12 mx-auto tm-login-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12 text-center">
                <h2 class="tm-block-title mb-4">Add Complaint</h2>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">

                  <div class="form-group">
                    <label for="username">Name</label>
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                  </div>

                  <div class="form-group">
                    <label for="username">Contact No.</label>
                    <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                  </div>
                  
                  <div class="form-group">
                    <label for="username">Message</label>
                    <asp:TextBox ID="txtcomplaint" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                  </div>
                  
                  <div class="form-group mt-4">
                    <asp:Button ID="btnadd" runat="server" Text="Add Complaint" CssClass="btn btn-primary btn-block text-uppercase" OnClick="btnadd_Click" />
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

