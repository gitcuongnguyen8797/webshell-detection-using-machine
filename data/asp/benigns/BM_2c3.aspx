<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2c3.aspx.vb" Inherits="niengiam.BM2c3" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        div.RadGrid .rgPager .rgAdvPart     
        {     
            display:none;        
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
        Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN" FocusedDate="2014-07-01">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày : 
        <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN" FocusedDate="2014-07-01">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
        Đơn vị :   
        <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2007" 
                       Width="200px">
                   </telerik:RadComboBox>  
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Office2007" Text="Tìm kiếm" 
         Width="100px" >
     </telerik:RadButton>
        <telerik:RadButton ID="BtXuat_Excel" runat="server" Skin="Office2007"  Width="100px"
            Text="Xuất excel">
        </telerik:RadButton>
    </div>
    <br />

    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                   AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            PageSize="20"  >


                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                  
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="Id" 
                        Caption="BÁO CÁO ĐĂNG KÝ THỰC HIỆN ĐÓNG KẾT MẠCH VÒNG">
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>

        <Columns>
               <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" 
                 Text="Cập nhật" UniqueName="GridButtonColumn1"   ImageUrl="/images/Edit.gif">                
            </telerik:GridButtonColumn>

             <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" HeaderStyle-Width="50px" 
                 Text="X" UniqueName="BtXoa"  ConfirmText="Bạn có muốn xóa dữ liệu không?">                
            <HeaderStyle Width="50px"></HeaderStyle>
               </telerik:GridButtonColumn>
           <telerik:GridBoundColumn DataField="tendonvi" HeaderText="Công ty Điện lực"
            SortExpression="tendonvi" UniqueName="tendonvi">
            </telerik:GridBoundColumn>
            <telerik:GridCalculatedColumn UniqueName="day1" HeaderText="Tuyến Dây 1" DataType="System.String" HeaderStyle-Width="120px"
                                 DataFields="tentuyenday1,tuyenday1" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
           
           <telerik:GridCalculatedColumn UniqueName="day2" HeaderText="Tuyến Dây 2" DataType="System.String" HeaderStyle-Width="120px"
                                 DataFields="tentuyenday2,tuyenday2" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>                       
            <telerik:GridBoundColumn DataField="NgayDangKy" HeaderText="Ngày đăng ký"
            SortExpression="NgayDangKy" UniqueName="NgayDangKy">
            </telerik:GridBoundColumn> 

            <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày thực hiện"
            SortExpression="NoiDungCT" UniqueName="NgayThucHien">
            </telerik:GridBoundColumn> 
            
            <telerik:GridHyperLinkColumn  HeaderButtonType="TextButton"  DataTextField="FileVanBan" DataNavigateUrlFields="FileVanBan" 
            HeaderText="File Văn bản" SortExpression="FileVanBan" UniqueName="FileVanBan" DataNavigateUrlFormatString="~/Upload/{0}"  >
            </telerik:GridHyperLinkColumn>

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
    
    <br />    
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="550px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" Title="Cập nhật Kế hoạch cắt điện">
	<ContentTemplate>
	 <br />        
        <table align="center">
            <tr>
                <td align="left"">Tuyến dây 1 :</td>
                <td>
                    <telerik:RadComboBox ID="cboTuyenDay1" Runat="server" Width="220">
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td align="left"">Tuyến dây 2:</td>
                <td>
                    <telerik:RadComboBox ID="cboTuyenDay2" Runat="server" Width="220">
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>             
            <tr>
                <td>Ngày đăng ký :</td>
                <td>
                    <telerik:raddatepicker ID="dtNgayDK" Runat="server" 
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
                <td>Ngày thực hiện :</td>
                <td>
                    <telerik:raddatepicker ID="dtNgayTH" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar4" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput4" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
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
                 <td>File Văn Bản :</td>
                <td><asp:FileUpload ID="FileUploadControl" runat="server" Width="220" /></td>
            </tr>
              <tr>
            <td></td>
            </tr>

            <tr>
                <td></td>
            </tr>
           <tr>
            <td align="right">
                    <telerik:RadButton ID="BOK" runat="server" Text="OK"   Width="100px" 
                       Skin="Office2007" OnClick="BOK_Click">
                    </telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"   Width="100px" 
                       Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
                </td>
            </tr>           
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>
     <br />
    <div align="center">
    &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" Visible="False" /> 
        <telerik:radbutton ID="Radbutton1" runat="server" 
            Skin="WebBlue" Text="Xem trên lưới" 
         Width="100px" Visible="False" >
     </telerik:radbutton>        
     <telerik:radbutton ID="Radbutton2" runat="server" Skin="WebBlue" Text="Lưu" 
         Width="100px" Visible="False" >
     </telerik:radbutton>
     <br />
     <br />
     <telerik:radgrid ID="GridFile" runat="server" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" 
        PageSize="15"  >
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   Caption="THỐNG KÊ DANH SÁCH CHỈ BÁO SỰ CỐ">
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>
                        <EditFormSettings  EditFormType="Template">
                            <EditColumn UniqueName="EditCommandColumn1" >
                            </EditColumn>
                        </EditFormSettings>
                        <AlternatingItemStyle Font-Bold="False" Font-Italic="False" />

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>

                        <HeaderStyle Font-Bold="False" Font-Italic="False" />
                        <FooterStyle Font-Bold="True" Font-Italic="True" />

               
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>
     
    </div>
   
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
