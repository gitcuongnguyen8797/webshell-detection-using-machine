﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_Thietbi_Trungthe.aspx.vb" Inherits="niengiam.BM_Thietbi_Trungthe" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            height: 20px;
        }
        div.RadGrid .rgPager .rgAdvPart     
        {     
            display:none;        
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
        Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày : 
        <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
        Đơn vị :   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Web20" 
                       Width="200">
                   </telerik:RadComboBox>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Web20" Text="Tìm kiếm" 
         Width="150px">
     </telerik:RadButton>
    </div>
    <br />

    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Vista" 
                    style="margin-top: 0px" CellSpacing="0" AllowPaging="True">
        <FooterStyle Font-Bold="False" Font-Italic="False" />
        <HeaderStyle Font-Bold="True" Font-Italic="False" />
        <CommandItemStyle Font-Bold="False" Font-Italic="False" />
        <ItemStyle Font-Bold="False" Font-Italic="False" />
        <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
        <ClientSettings>
            <Selecting AllowRowSelect="true" />
            <Scrolling AllowScroll="true" UseStaticHeaders="true"></Scrolling>
        </ClientSettings>                  
        <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
        <MasterTableView AllowMultiColumnSorting="True" Font-Bold="False" 
            Font-Italic="False" DataKeyNames="Id">
        <CommandItemSettings AddNewRecordText=""   />
        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
        </RowIndicatorColumn>
        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
        </ExpandCollapseColumn>
        <Columns>
            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" 
                 Text="Cập nhật" UniqueName="GridButtonColumn1"   ImageUrl="Images\Edit.gif" >                
<HeaderStyle Width="50px"></HeaderStyle>
            </telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="Id" HeaderText="ID" HeaderButtonType="TextButton"
            SortExpression="Id" UniqueName="Id" Visible="false">
            </telerik:GridBoundColumn>

           <telerik:GridBoundColumn DataField="TenTuyenday" HeaderText="Tuyến dây"
            SortExpression="TenTuyenday" UniqueName="TenTuyenday">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Soluoinoi" HeaderText="Số Lưới Nổi"
            SortExpression="Soluoinoi" UniqueName="Soluoinoi">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Soluoingam" HeaderText="Số Lưới Ngầm"
            SortExpression="Soluoingam" UniqueName="Soluoingam">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Soluongbinhthuong" HeaderText="Số Lượng Bình Thường"
            SortExpression="Soluongbinhthuong" UniqueName="Soluongbinhthuong">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Soluonghuhong" HeaderText="Số Lượng Hư Hỏng"
            SortExpression="Soluonghuhong" UniqueName="Soluonghuhong">
            </telerik:GridBoundColumn>
           <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày thực hiện"
            SortExpression="NgayThucHien" UniqueName="NgayThucHien">
            </telerik:GridBoundColumn>  
            <telerik:GridBoundColumn DataField="GhiChu" HeaderText="Ghi chú"
            SortExpression="GhiChu" UniqueName="GhiChu">
            </telerik:GridBoundColumn> 

            <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderStyle-Width="50px">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Xóa" CommandName="Delete1" 
                OnClientClick="javascript:if(!confirm('Bạn có muốn xóa nội dung này không?')){return false;}"
                ImageUrl="~/images/delete.png" />
            </ItemTemplate>

<HeaderStyle Width="50px"></HeaderStyle>
            </telerik:GridTemplateColumn>
        </Columns>
        <EditFormSettings  EditFormType="Template">
            <EditColumn UniqueName="EditCommandColumn1" >
            </EditColumn>
        </EditFormSettings>
        <AlternatingItemStyle Font-Bold="False" Font-Italic="False" />
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
    <br /> 
    <div style="text-align:right;">
        <telerik:RadButton ID="btnNew" runat="server" Text="Thêm mới"  Width="150px" 
             style="height: 26px" Skin="Office2007" OnClick="ADD_Click">
        </telerik:RadButton>
    </div>
    <br />    
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="550px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" Title="BÁO CÁO CÔNG TÁC THI CÔNG HOTLINE">
	<ContentTemplate>
	 <br />        
        <table align="center">
            <tr>
                <td align="left"">Tuyến dây :</td>
                <td>
                    <telerik:RadComboBox ID="cboTuyenDay" Runat="server" Width="220">
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Số Lưới Nổi:</td>
                <td>
                    <telerik:RadTextBox ID="txtSoluoinoi" Runat="server" Width="220">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Số Lưới Ngầm :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSoluoingam" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Số Lượng Bình Thường :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSobinhthuong" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>              
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Số Lượng Hư Hỏng :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSohuhong" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
          
            <tr>
                <td>Ngày thực hiện :</td>
                <td>
                    <telerik:raddatepicker ID="dtNgayTH" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar3" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput3" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Ghi chú:</td>
                <td><telerik:RadTextBox ID="txtGhiChu" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
                </telerik:RadTextBox></td>
           </tr>
           <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
           <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="150px" 
                       style="height: 26px" Skin="Office2007" OnClick="BOK_Click">
                    </telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="150px" 
                       style="height: 26px" Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
                </td>
            </tr>           
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>