<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminTemplate.Master"
    AutoEventWireup="true" CodeBehind="ManageArticle.aspx.cs" Inherits="hcmpc_admin.Administrator.ManageArticle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="CreateArticleUC" Src="~/Administrator/Controls/CreateNewArticle.ascx" %>
<%@ Register TagPrefix="uc" TagName="SearchArticleUC" Src="~/Administrator/Controls/SearchArticle.ascx" %>
<%@ Register TagPrefix="uc" TagName="EditArticleUC" Src="~/Administrator/Controls/EditArticle.ascx" %>
<%@ Register TagPrefix="uc" TagName="PreviewArticleUC" Src="~/Administrator/Controls/PreviewArticle.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       

    <div id="tabManager" class="box round first">
        <h2>
            Articles</h2>
        <div class="clear">
        </div>
        <div id="sectionSearch" class="block">               
            
            <uc:SearchArticleUC ID="SearchArticle_UC" runat="server"/>

            <div class="clear" style="margin-bottom: 30px">
            </div>

            <div style="display: inline; width: 100%; height: auto;">
                <div style="height: auto; width: 20%; display: inline ">
                    <uc:CreateArticleUC ID="CreateArticle_UC" runat="server" Visible="false"/>
                </div>

                <div style="height: 40px; width: 65%; display: inline; text-align: center; padding-left: 130px">
                    <asp:LinkButton ID="lkFeatured" runat="server" style="padding-left: 30px; color: #808080;" 
                        onclick="lkFeatured_Click">Featured</asp:LinkButton>
                    <asp:LinkButton ID="lkVerified" runat="server" style="padding-left: 30px; color: #808080" 
                        onclick="lkVerified_Click">Verified</asp:LinkButton>
                    <asp:LinkButton ID="lkPublish" runat="server" style="padding-left: 30px; color: #808080" 
                        onclick="lkPublish_Click">Published</asp:LinkButton>
                    <asp:LinkButton ID="lkAll" runat="server" style="padding-left: 30px; color: #808080" 
                        onclick="lkAll_Click">All</asp:LinkButton>
                    <asp:LinkButton ID="lkHidden" runat="server" style="padding-left: 30px; color: #808080" 
                        onclick="lkHidden_Click">Removed</asp:LinkButton>
                </div>

                <div style="height: auto; width: 15%; float: right; display: inline;">
                    <asp:Label ID="lbRPP" runat="server" Text="Items Per Page" Font-Bold="true" Font-Size="Small" ForeColor="ButtonShadow"></asp:Label>                     
                    <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="true" Width="50px" Height="25px"
                        OnSelectedIndexChanged="ddlSize_SelectedIndexChanged">
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="15">20</asp:ListItem>
                        <asp:ListItem Value="15">30</asp:ListItem>
                        <asp:ListItem Value="15">40</asp:ListItem>
                        <asp:ListItem Value="15">50</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="clear" style="margin-bottom: 10px">
            </div>
                        
            <asp:DataList CssClass="table2" ID="dlArticle" runat="server"
                DataKeyField="Article_ID" OnItemCommand="dlArticle_ItemCommand" 
                OnItemDataBound="dlArticle_ItemDataBound">                
		        <%--<AlternatingItemStyle BackColor="#dddddd"/>--%>
                <HeaderTemplate>                   
                    <th></th>
                    <th>
                        ID
                    </th>
                    <th >
                        Author
                    </th>
                    <th>
                        Title
                    </th>
                    <th>
                        Featured
                    </th>                    
                    <th>
                        View
                    </th>
                    <th>
                        Verified
                    </th>
                    <th>
                        Publish
                    </th>
                    <th>
                        Publish Date
                    </th>
                    <th>
                        <asp:CheckBox ID="cbAll" runat="server" />
                    </th>
                </HeaderTemplate>                
                <ItemTemplate>                                      
                    <td class="center" style="width: 90px;">
                        <asp:ImageButton runat="server" ID="btnEdit" ImageUrl="~/Administrator/img/button-edit.png" Visible="false" PostBackUrl="javascript:$find('mpeEditBehavior').show();"
                            Width="20" Height="20" CommandName="commandEdit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Article_ID")%>'
                            ToolTip="Edit Article" />

                        <asp:ImageButton runat="server" ID="btnCheck" ImageUrl="~/Administrator/img/button-check.png" Visible="false"
                            Width="20" Height="20" CommandName="commandPreview" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Article_ID")%>'
                            ToolTip="Preview Article" />

                        <asp:ImageButton runat="server" ID="btnRemove" ImageUrl="" Width="20" Height="20" Visible="false"
                            CommandName="commandRemove" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Article_ID")%>'
                            ToolTip="Remove / Restore Article" />
                    
                        <asp:ConfirmButtonExtender ID="cbeDelete" runat="server" TargetControlID="btnRemove"
                            ConfirmText="Are you sure about this decision?">
                        </asp:ConfirmButtonExtender>
                       
                    </td>
                    <td class="center">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Article_ID") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("user.UserName") %>'></asp:Label>
                    </td>
                    <td class="center" style="width: 400px">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:ImageButton runat="server" ID="btnFeatured" ImageUrl="" Width="16" Height="16" Enabled="false"
                            CommandName="commandFeatured" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Article_ID")%>'
                            ToolTip="Feature Article" />
                    </td>
                    <td class="center">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("NumberOfView") %>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:ImageButton runat="server" ID="btnVerify" ImageUrl="" Width="16" Height="16" Enabled="false"
                            CommandName="commandVerify" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Article_ID")%>'
                            ToolTip="Verify Article" />
                    </td>
                    <td class="center">
                        <asp:ImageButton runat="server" ID="btnPublish" ImageUrl="" Width="16" Height="16" Enabled="false"
                            CommandName="commandPublish" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Article_ID")%>'
                            ToolTip="Publish Article" />
                    </td>
                    <td class="center">
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("PublishDate") %>'></asp:Label>
                    </td>
                     <td class="center" style="width: 20px">
                        <asp:CheckBox ID="cbItems" runat="server" />
                    </td> 
                </ItemTemplate>
            </asp:DataList>



            <asp:Panel runat="server" ID="pnlError" DefaultButton="btOK" style="text-align:center">
                <div style="width: 200px; height: 50px; background-color: White">
                    <asp:Label ID="lbError" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="#F06464"></asp:Label>
                    <br />
                    <asp:Button ID="btOK" runat="server" Text="OK" />
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeError" BehaviorID="mpeError" runat="server" TargetControlID="hltest" 
                BackgroundCssClass="modalBackground" PopupControlID="pnlError">
            </asp:ModalPopupExtender>
            <asp:HyperLink ID="hltest" runat="server" style="display: none;" /> 




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

            
            
            <div class="clear">
            </div>
        </div>
    </div>


    <!-- ******************************************************************************************************* -->
    <!-- Panel Popup Edit  -->
        <uc:EditArticleUC ID="editArticleUC" runat="server" /> 
    <!-- Panel Popup Edit  -->


    <!-- Panel Popup Preview  -->
        <uc:PreviewArticleUC ID="previewArticleUC" runat="server" /> 
    <!-- Panel Popup Preview  -->
                    
             
    <asp:Label ID="lbTest" runat="server" Text=""></asp:Label>


    


<%--<script type="text/javascript">

    Sys.Application.add_load(pageLoad);

    function pageLoad() {
        var popup = $find('mpeEdit');
        popup.add_shown(SetFocus);
    }

    function SetFocus() {
        $get('pnlEdit_txtContent2').focus();
    }

//    function showPopUp() {
//        document.getElementById('<%=editArticleUC.ClientID%>' + '_' + 'mpeEdit').show();
//        document.getElementById('<%=editArticleUC.ClientID%>' + '_' + 'pnlEdit').style.display = 'none';
//    }


</script>--%>
             

</asp:Content>