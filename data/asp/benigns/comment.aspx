<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="comment.aspx.vb" Inherits="hcmpc.comment" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function isBoxChecked() {
            var checking = false;
            //debugger;       
            var inputs = document.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == true) {
                    if (inputs[i].id != '<%=mygrid.Columns(0).OwnerID%>_ctl02_ctl01_ClientSelectColumnSelectCheckBox') {
                        checking = true;
                        break;
                    }
                }
            }
            if (!checking) {
                return false;
            }
            return true;
        }

        $(window).load(function () {
            $("#<%=filter_search.ClientID%>").keypress(function (event) {
                if (event.keyCode == 13) {
                    document.forms[0].submit();
                    return false;
                }
            });
        });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            <ul>
                <li id="toolbar-edit" class="button">
                        <a class="toolbar" onclick="if (!isBoxChecked()){alert('Vui lòng chọn dữ liệu cần sửa');}else{ __doPostBack('<%= btnEdit.UniqueID %>','')}" href="#">
                        <span class="icon-32-edit">
                        </span>
                        Sửa
                        </a>
                    </li>

                <li class="divider">
                </li>
                <li id="toolbar-publish" class="button">
                <a class="toolbar" onclick="if (!isBoxChecked()){alert('Vui lòng chọn dữ liệu muốn xuất bản');}else{ __doPostBack('<%= btnPublish.UniqueID %>','')}" href="#">
                <span class="icon-32-publish">
                </span>
                Xuất bản
                </a>
                </li>

                <li id="toolbar-unpublish" class="button">
                <a class="toolbar" onclick="if (!isBoxChecked()){alert('Vui lòng chọn dữ liệu không muốn xuất bản');}else{ __doPostBack('<%= btnUnPublish.UniqueID %>','')}" href="#">
                <span class="icon-32-unpublish">
                </span>
                không xuất bản
                </a>
                </li>

                <li class="divider">
                </li>

                <li id="toolbar-trash" class="button">
                <a class="toolbar" onclick="if (!isBoxChecked()){alert('Vui lòng chọn dữ liệu cần xóa!');}else{ if(confirm('Xóa dữ liệu?')) __doPostBack('<%= btnDelete.UniqueID %>','')}" href="#">
                <span class="icon-32-trash">
                </span>
                Thùng rác
                </a>
                </li>

                <li class="divider">
                </li>

                <li id="toolbar-help" class="button">
                <a class="toolbar" rel="help" href="#">
                <span class="icon-32-help">
                </span>
                Trợ giúp
                </a>
                </li>
            </ul>
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-article"><h2>Quản lý Comment</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">
        <fieldset id="filter-bar">
		    <div class="filter-search fltlft">
			    <label for="filter_search" class="filter-search-lbl">Lọc:</label>
			    <input type="text" value="" id="filter_search" runat="Server">
			    <button class="btn" type="submit">Tìm kiếm</button>
			    <button type="button" onclick="if (!isBoxChecked()){alert('Vui lòng chọn dữ liệu cần xóa!');}else{ if(confirm('Xóa dữ liệu?')) __doPostBack('<%= btnDelete.UniqueID %>','')}">Xóa</button>
		    </div>
		    <div class="filter-select fltrt">
			    <select onchange="this.form.submit()" class="inputbox" id="filter_published" runat="Server">
				    <option value="">- Chọn trạng thái -</option>
				    <option value="1">Xuất bản</option>
                    <option value="0">Chưa được công bố</option>                    
                    <option value="*">Tất cả</option>
			    </select>			    
		    </div>
	    </fieldset>
        <link rel="stylesheet" href="css/grid.css" type="text/css" />
         <style>
        span.gi {            
            float: left;
        }
        </style>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="mygrid" runat="server" AutoGenerateColumns="False" GridLines="None"
                    AllowPaging="True" AllowSorting="True" PageSize="20" AllowMultiRowSelection="true">
                    <MasterTableView DataKeyNames="ID">                
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                               <HeaderStyle Width="50px" HorizontalAlign="Center" />
                               <ItemStyle HorizontalAlign="Center" />
                           </telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn DataField="ID" HeaderText="ID" UniqueName="ID"
                                Visible="false">
                            </telerik:GridBoundColumn> 
                             <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="suacomment.aspx?ID={0}"
                                DataNavigateUrlFields="ID" SortExpression="ID" UniqueName="Title" DataTextField="Title" HeaderText="Tiêu Đề">
                                <HeaderStyle Font-Bold="true" />                  
                            </telerik:GridHyperLinkColumn>               
                            <telerik:GridButtonColumn CommandName="DuyetArticle" DataTextField="HienThi" Text="DuyetArticle"
                                UniqueName="DuyetArticle" HeaderText="Xuất bản">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100" />
                            </telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="Cap" HeaderText="Cấp">    
                                <HeaderStyle Font-Bold="true" Width="50" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="Loai" HeaderText="Loại">    
                                <HeaderStyle Font-Bold="true" Width="50" />                                                   
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ngaydang" DataType="System.DateTime" HeaderText="Ngày"
                                SortExpression="ngaydang" DataFormatString="{0:dd/MM/yyyy}" UniqueName="ngaydang">
                                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" Width="100" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ID" HeaderText="ID" UniqueName="ID">    
                                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" Width="100" />                           
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</div>
 <div style="display:none">
    <asp:Button ID="btnEdit" runat="server" Text="edit" />
    <asp:Button ID="btnPublish" runat="server" Text="public" />
    <asp:Button ID="btnUnPublish" runat="server" Text="unpublic" />
    <asp:Button ID="btnFeature" runat="server" Text="feature" />
    <asp:Button ID="btnDelete" runat="server" Text="delete" />    
</div>

</asp:Content>
