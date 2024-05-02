<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="View-Student.aspx.cs" Inherits="View_Student" %>

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
                                Student Details
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
                                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"></asp:BoundField>
                                        <asp:BoundField DataField="bus_no" HeaderText="Bus No." SortExpression="bus_no"></asp:BoundField>
                                        <asp:BoundField DataField="college" HeaderText="college" SortExpression="college"></asp:BoundField>
                                        <asp:BoundField DataField="year" HeaderText="year" SortExpression="year"></asp:BoundField>
                                        <asp:BoundField DataField="dept" HeaderText="dept" SortExpression="dept"></asp:BoundField>
                                        <asp:BoundField DataField="stop" HeaderText="stop" SortExpression="stop"></asp:BoundField>
                                        <asp:BoundField DataField="fees_paid" HeaderText="fees_paid" SortExpression="fees_paid"></asp:BoundField>
                                        <asp:BoundField DataField="total_fees" HeaderText="total_fees" SortExpression="total_fees"></asp:BoundField>
                                        <asp:BoundField DataField="pending_fees" HeaderText="pending_fees" SortExpression="pending_fees"></asp:BoundField>
<%--                                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"></asp:BoundField>
                                        <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile"></asp:BoundField>
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
                                        <asp:BoundField DataField="bus_no" HeaderText="bus_no" SortExpression="bus_no"></asp:BoundField>--%>
                                        
                                        <%--<asp:TemplateField HeaderText="Assign Order To Delivery Boy">
                                            <ItemTemplate>
                                                <asp:Button ID="btnapprove" CssClass="btn btn-primary" runat="server" CommandName="approve" CommandArgument='<%# Eval("id") %>' Text='<%# Eval("status").ToString() == "True" ? "Approved" : "Not Approved"  %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        

                                        <asp:ButtonField CommandName="select" Text="Update" ItemStyle-Width="60" ItemStyle-ForeColor="Red">
                                            <ControlStyle CssClass="btn btn-primary" ForeColor="White" />
                                            <ItemStyle ForeColor="Red" Width="60px"></ItemStyle>
                                        </asp:ButtonField>
                                        <asp:CommandField ShowDeleteButton="True">
                                            <ControlStyle CssClass="btn btn-primary" />
                                        </asp:CommandField>

                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:connection %>' SelectCommand="SELECT [id], [name], [address], [mobile], [email], [bus_no], [fees_paid], [total_fees], [pending_fees], [college], [year], [dept], [stop], status, bus_no FROM [student]" DeleteCommand="delete from student where id=@id">
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

