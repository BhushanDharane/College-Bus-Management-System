<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="View-Bus.aspx.cs" Inherits="View_Bus" %>

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
                                Driver Details
                                <asp:Label ID="LblId" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblname" runat="server" Visible="false"></asp:Label>
                        <div class="panel-body">
                            <div style="width: 1040px; height: 480px; overflow: scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="Sr.No." ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                        <asp:BoundField DataField="bus_no" HeaderText="Bus No." SortExpression="bus_no"></asp:BoundField>
                                        <asp:BoundField DataField="bus_name" HeaderText="Bus Name" SortExpression="bus_name"></asp:BoundField>
                                        <asp:BoundField DataField="driver_name" HeaderText="Driver Name" SortExpression="driver_name"></asp:BoundField>
                                        <asp:BoundField DataField="driver_contact" HeaderText="Driver Contact" SortExpression="driver_contact"></asp:BoundField>
                                        <asp:ImageField DataImageUrlField="bus_timetable_image" HeaderText="Time Table">
                                            <ControlStyle Height="100px" Width="100px" />
                                        </asp:ImageField>
                                        <asp:ButtonField CommandName="select" Text="Update" ItemStyle-Width="60" ItemStyle-ForeColor="Red">
                                            <ControlStyle CssClass="btn btn-primary" ForeColor="White" />
                                            <ItemStyle ForeColor="Red" Width="60px"></ItemStyle>
                                        </asp:ButtonField>
                                        <asp:CommandField ShowDeleteButton="True">
                                            <ControlStyle CssClass="btn btn-primary" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:connection %>' SelectCommand="SELECT [id], [bus_no], [bus_name], [route], [driver_name], [driver_contact], [password], [bus_timetable_image] FROM [add_bus]" DeleteCommand="delete from add_bus where id=@id">
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

