<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="dsuser.aspx.vb" Inherits="VANPHONG.WebForm8" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ucMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-article"><h2>Quản lý người dùng</h2></div>
		</div>
</div>
<div>
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" 
                   AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
        PageSize="50" Skin="Office2007">
    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                   <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevNumericAndAdvanced" Position="TopAndBottom" AlwaysVisible="true" />

                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="Id" 
                        Caption="QUẢN LÝ NGƯỜI DÙNG">
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>

                         <Columns>
               <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" 
                 Text="Cập nhật" UniqueName="GridButtonColumn1"   ImageUrl="\Images\Edit.gif">                
<HeaderStyle Width="50px"></HeaderStyle>
            </telerik:GridButtonColumn>

             <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" HeaderStyle-Width="50px" 
                 Text="X" UniqueName="BtXoa"  ConfirmText="Bạn có muốn xóa dữ liệu không?">                
            <HeaderStyle Width="50px"></HeaderStyle>
               </telerik:GridButtonColumn>
           <telerik:GridBoundColumn DataField="NguoiDung" HeaderText="Tên đăng nhập"
            SortExpression="NguoiDung" UniqueName="NguoiDung">
            </telerik:GridBoundColumn>               
            <telerik:GridBoundColumn DataField="TenNguoiDung" HeaderText="Họ Tên"
            SortExpression="TenNguoiDung" UniqueName="TenNguoiDung">
            </telerik:GridBoundColumn> 

            <telerik:GridBoundColumn DataField="diachiip" HeaderText="IP"
            SortExpression="diachiip" UniqueName="diachiip">
            </telerik:GridBoundColumn> 
            
            <telerik:GridBoundColumn DataField="cosodulieu" HeaderText="DATABASE"
            SortExpression="cosodulieu" UniqueName="cosodulieu">
            </telerik:GridBoundColumn> 

            <telerik:GridBoundColumn DataField="Ten_DonVi" HeaderText="Đơn vị"
            SortExpression="Ten_DonVi" UniqueName="Ten_DonVi">
            </telerik:GridBoundColumn> 

             <telerik:GridBoundColumn DataField="Quantri" HeaderText="Quản Trị" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
            SortExpression="Quantri" UniqueName="Quantri">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </telerik:GridBoundColumn> 
                       
            </Columns>
           <EditFormSettings  EditFormType="Template">
            <EditColumn UniqueName="EditCommandColumn1" >
            </EditColumn>
        </EditFormSettings>
        <AlternatingItemStyle Font-Bold="False" Font-Italic="False" />

<PagerStyle AlwaysVisible="True" PageSizeControlType="RadComboBox"></PagerStyle>

        <HeaderStyle Font-Bold="False" Font-Italic="False" />
        <FooterStyle Font-Bold="True" Font-Italic="True" />
        </MasterTableView>
        <SelectedItemStyle Font-Bold="False" />
        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
        <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
        </HeaderContextMenu>
    </telerik:RadGrid>
</div>

 <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="300px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" 
            Title="Cập nhật thông tin người dùng" Skin="Vista">
	<ContentTemplate>
	 <br />        
        <table align="center">
            <tr>
                <td align="left"">Đơn vị :</td>
                <td>
                    <telerik:RadComboBox ID="cbodonvi" Runat="server" Width="220" autopostback="True" ontextchanged="cbodonvi_TextChanged">
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td>
            </td>
            </tr>
                   
            <tr>
                <td>Tên đăng nhập :</td>
                <td>
                    <telerik:RadTextBox ID="txtusernam" Runat="server" Width="220">
                    </telerik:RadTextBox></td>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
                <tr>
                <td>Mật khẩu :</td>
                <td>
                    <telerik:RadTextBox ID="txtpassword" Runat="server" Width="220">
                    </telerik:RadTextBox></td>
                </td>
            </tr>
            <tr>
            <td>
            </td>
            </tr>
                  <tr>
                <td>Tên người dùng :</td>
                <td>
                    <telerik:RadTextBox ID="txtfullname" Runat="server" Width="220">
                    </telerik:RadTextBox></td>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td align="left"">IP :</td>
                <td>
                    <telerik:RadTextBox ID="txtip" Runat="server" Enabled="false" Width="220">
                    </telerik:RadTextBox></td>
                   <%-- <telerik:RadComboBox ID="Cboip" Runat="server" Enabled="false" Width="220">
                   </telerik:RadComboBox>--%>
                </td>
            </tr>
            <tr>
            <td>
            </td>
            </tr>
            <tr>
                <td align="left"">DATABASE :</td>
                <td>
                <telerik:RadTextBox ID="txtdb" Runat="server" Enabled="false" Width="220">
                    </telerik:RadTextBox></td>
                  <%--  <telerik:RadComboBox ID="Cbodatabase" Enabled="false" Runat="server" Width="220">
                   </telerik:RadComboBox>--%>
                </td>
            </tr>
             <tr>
                <td></td>
            </tr>

            <tr>
                <td>ISADMIN</td>
                <td>
                    <asp:CheckBox ID="ISADMIN" runat="server" />
                </td>
            </tr>
            <tr>
            <td>
            </td>
            </tr>
           <tr>
            <td align="right">
                    <telerik:RadButton ID="BOK" runat="server" Text="OK"   Width="100px"  OnClick="BOK_Click"></telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"   Width="100px" OnClick="BThoat_Click"></telerik:RadButton>
                </td>
            </tr>           
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>

<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>

</asp:Content>
