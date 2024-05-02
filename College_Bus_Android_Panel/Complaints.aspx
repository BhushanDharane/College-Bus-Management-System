<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Complaints.aspx.cs" Inherits="Complaints" %>

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
                                All Complaints
                                <asp:Label ID="LblId" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblname" runat="server" Visible="false"></asp:Label>
                        <div class="panel-body">
                            <div style="width: 1040px; height: 480px; overflow: scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"></asp:BoundField>
                                        <asp:BoundField DataField="contact" HeaderText="Contact No." SortExpression="contact"></asp:BoundField>
                                        <asp:BoundField DataField="msg" HeaderText="Message" SortExpression="msg"></asp:BoundField>
                                        <asp:BoundField DataField="bus_no" HeaderText="Complaint For Bus No." SortExpression="bus_no"></asp:BoundField>
                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True">
                                        <ControlStyle CssClass="btn btn-primary" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:connection %>' SelectCommand="SELECT [id], [msg], name, contact, bus_no FROM [complaints]" DeleteCommand="delete from complaints where id=@id">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

