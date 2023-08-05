<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminTemplate.Master"
    AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="hcmpc_admin.Administrator.ManageUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="SearchUserUC" Src="~/Administrator/Controls/SearchUserAcc.ascx" %>
<%@ Register TagPrefix="uc" TagName="EditUserUC" Src="~/Administrator/Controls/EditUserAcc.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="tabManager" class="box round first">
        <h2>
            User Accounts</h2>
        <div class="clear">
        </div>
        <div id="sectionSearch" class="block">
            <uc:SearchUserUC ID="SearchUser_UC" runat="server"/>
            <div class="clear">
            </div>
            <div style="height: auto">
                <asp:Label ID="lbRPP" runat="server" Text="Items Per Page" ForeColor="#cccccc" Font-Bold="true"
                    Font-Size="Medium"></asp:Label>
                <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="true" Width="60px" Height="25px"
                    OnSelectedIndexChanged="ddlSize_SelectedIndexChanged">
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="15">20</asp:ListItem>
                        <asp:ListItem Value="15">30</asp:ListItem>
                        <asp:ListItem Value="15">40</asp:ListItem>
                        <asp:ListItem Value="15">50</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:DataList CssClass="table table-bordered table-form" ID="dlUser" runat="server"
                DataKeyField="User_ID" OnItemCommand="dlUser_ItemCommand" OnItemDataBound="dlUser_ItemDataBound">
                <HeaderTemplate>
                    <th>
                    </th>
                    <th>
                        Username
                    </th>
                    <th>
                        RoleName
                    </th>
                    <th>
                        Email
                    </th>
                    <th>
                        Fullname
                    </th>
                    <th>
                        CreatedDate
                    </th>
                    <th>
                        LastModifiedDate
                    </th>
                    <th>
                        Online
                    </th>
                </HeaderTemplate>
                <ItemTemplate>
                    <td class="center">
                        
                        <asp:ImageButton runat="server" ID="btnEdit" ImageUrl="~/Administrator/img/button-check.png"
                            Width="20" Height="20" CommandName="commandEdit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"User_ID")%>'
                            ToolTip="Edit Account" />
                        <asp:ImageButton runat="server" ID="btnRemove" ImageUrl="" Width="20" Height="20"
                            CommandName="commandRemove" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"User_ID")%>'
                            ToolTip="Remove / Restore Accounts" />
                      

                        <asp:ConfirmButtonExtender ID="cbeDelete" runat="server" TargetControlID="btnRemove"
                            ConfirmText="Are you sure about this decision?">
                        </asp:ConfirmButtonExtender>
                       
                    </td>
                    <td class="center">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("userRoleType.RoleName") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("LastModifiedDate") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:Image ID="Image7" runat="server" Width="20px" Height="20px" />
                        <%--<asp:Label ID="Label7" runat="server" Text='<%# Eval("IsOnline") %>'></asp:Label>--%>
                    </td>
                </ItemTemplate>
            </asp:DataList>


            <!-- Pagination  -->
            <div class="pagination pagination-centered">
                <ul>
                    <li>
                        <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>
                    </li>
                    <li>
                        <asp:DataList ID="dlPaging" runat="server" OnItemCommand="dlPaging_ItemCommand" OnItemDataBound="dlPaging_ItemDataBound"
                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                    CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:DataList>
                    </li>
                    <li>
                        <asp:LinkButton ID="lbtnNext" runat="server" CausesValidation="false" OnClick="lbtnNext_Click">Next</asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="lbtnLast" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton>
                    </li>
                </ul>
            </div>
            <!-- Pagination  -->
        </div>
    </div>


    <div class="clear">
    </div>


   <!-- Panel Popup Edit  -->
        <uc:EditUserUC ID="editUserUC" runat="server" /> 
   <!-- Panel Popup Edit  -->


</asp:Content>
