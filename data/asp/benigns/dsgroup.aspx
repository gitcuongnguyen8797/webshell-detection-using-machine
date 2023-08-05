<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" EnableEventValidation="true" CodeBehind="dsgroup.aspx.vb" Inherits="hcmpc.dsgroup" %>

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
                <li id="toolbar-new" class="button">
                    <a class="toolbar" href="nhapgroup.aspx">
                    <span class="icon-32-new">
                    </span>
                    Thêm mới
                    </a>
                </li>
                <li id="toolbar-edit" class="button">
                    <a class="toolbar" onclick="if (!isBoxChecked()){alert('Vui lòng chọn dữ liệu cần sửa');}else{ __doPostBack('<%= btnEdit.UniqueID %>','')}" href="#">
                    <span class="icon-32-edit">
                    </span>
                    Sửa
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
			<div class="pagetitle icon-48-groups"><h2>Quản lý người dùng: Nhóm người dùng</h2></div>
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
			    <button class="btn" type="button" onclick="this.form.submit()">Tìm kiếm</button>
			    <button type="button" onclick="if (!isBoxChecked()){alert('Vui lòng chọn dữ liệu cần xóa!');}else{ if(confirm('Xóa dữ liệu?')) __doPostBack('<%= btnDelete.UniqueID %>','')}">Xóa</button>
		    </div>
            <div class="filter-select fltrt">			      
                <select onchange="this.form.submit()" class="inputbox" id="filter_acc_id" runat="Server">				                 
			    </select>              
		    </div>		    
	    </fieldset>
        <link rel="stylesheet" href="css/grid.css" type="text/css" /> 
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="mygrid" runat="server" AutoGenerateColumns="False" GridLines="None"
                    AllowPaging="True" AllowSorting="True" PageSize="20" AllowMultiRowSelection="true">
                    <MasterTableView DataKeyNames="Group_ID">     
                        <Columns>            
                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                               <HeaderStyle Width="50px" HorizontalAlign="Center" />
                               <ItemStyle HorizontalAlign="Center" />
                           </telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn DataField="Group_ID" HeaderText="Group_ID" UniqueName="Group_ID"
                                Visible="false">
                            </telerik:GridBoundColumn>    
                            <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="nhapgroup.aspx?ID={0}"
                                DataNavigateUrlFields="Group_ID" SortExpression="Group_ID" UniqueName="EditSection" DataTextField="Name" HeaderText="Tên nhóm">
                                <HeaderStyle Font-Bold="true" />                  
                            </telerik:GridHyperLinkColumn>
                            <telerik:GridBoundColumn DataField="Description" HeaderText="Mô tả">    
                                <HeaderStyle Font-Bold="true" />                                                           
                            </telerik:GridBoundColumn>                                                    
                             <telerik:GridBoundColumn DataField="Group_ID" HeaderText="ID" UniqueName="Group_ID">    
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
    <asp:Button ID="btnDelete" runat="server" Text="delete" /> 
    <asp:Button ID="btnFilter" runat="server" Text="filter" />   
</div>

</asp:Content>