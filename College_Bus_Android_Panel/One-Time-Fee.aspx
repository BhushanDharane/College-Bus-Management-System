<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="One-Time-Fee.aspx.cs" Inherits="One_Time_Fee" %>

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
                                One Time Fees
                                <asp:Label ID="LblId" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblname" runat="server" Visible="false"></asp:Label>
                        <div class="panel-body">
                            <div style="width: 1040px; height: 480px; overflow: scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                        <asp:BoundField DataField="stud_name" HeaderText="Student Name" SortExpression="stud_name"></asp:BoundField>
                                        <asp:BoundField DataField="stop_name" HeaderText="stop_name" SortExpression="stop_name"></asp:BoundField>
                                        <asp:BoundField DataField="fee" HeaderText="fee" SortExpression="fee"></asp:BoundField>
                                        <asp:BoundField DataField="bus_time" HeaderText="bus_time" SortExpression="bus_time"></asp:BoundField>
                                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date"></asp:BoundField>
                                        <asp:ButtonField CommandName="select" Text="Update" ItemStyle-Width="60" ItemStyle-ForeColor="Red">
                                            <ControlStyle CssClass="btn btn-primary" ForeColor="White" />
                                            <ItemStyle ForeColor="Red" Width="60px"></ItemStyle>
                                        </asp:ButtonField>
                                        <asp:CommandField ShowDeleteButton="True">
                                            <ControlStyle CssClass="btn btn-primary" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:connection %>' SelectCommand="SELECT [id], [stop_name], [fee], stud_name, bus_time, date FROM [one_time_fee]" DeleteCommand="delete from one_time_fee where id=@id">
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

