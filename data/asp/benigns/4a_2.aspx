<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="4a_2.aspx.vb" Inherits="niengiam.WebForm16" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
  <br />
    Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-01-01" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày : <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                 
                Đơn vị :   
           <telerik:radcombobox ID="CbodonVi" Runat="server" 
                       Skin="Hay" 
                       Width="200">
                   </telerik:radcombobox>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <telerik:radbutton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="120px">
     </telerik:radbutton>
      <telerik:radbutton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="120px">
     </telerik:radbutton>
    
     </div> 
     <br />
         <br />
      <telerik:radgrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
        PageSize="20" AutoGenerateColumns="False"  >
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  DataKeyNames="ID" 
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC GIA CỐ TRẠM PHÒNG">
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="True" 
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
                 <Columns>
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>
                               
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>
                          
                         
                         <telerik:GridBoundColumn DataField="ID" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="ID" UniqueName="ID" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>
                        <telerik:GridCalculatedColumn UniqueName="tram" HeaderText="Tên trạm"
                                 DataFields="ten_Trampp, trampp" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
                         
                        <telerik:GridCalculatedColumn UniqueName="duongday" HeaderText="Thuộc tuyến dây"
                                 DataFields="ten_tuyenday, tuyenday" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
                           

                        <telerik:GridBoundColumn DataField="noidung" HeaderButtonType="TextButton"  
                                HeaderText="Nội dung thực hiện (gia cố hệ thống thông gió, cửa trạm…)" SortExpression="noidung" UniqueName="noidung" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

      <telerik:GridBoundColumn DataField="NgayKT" HeaderButtonType="TextButton"  DataFormatString="{0:dd/MM/yyyy}"
                                HeaderText="Ngày thực hiện" SortExpression="NgayKT" UniqueName="NgayKT" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>
                       
                        <telerik:GridBoundColumn DataField="MaDonVi" HeaderButtonType="TextButton"  
                                HeaderText="Mã đơn vị" SortExpression="MaDonVi" UniqueName="MaDonVi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                  

                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>

                <telerik:RadWindow ID="radwindowPopup" runat="server" VisibleOnPageLoad="false" Height="250px"
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="BÁO CÁO CÔNG TÁC GIA CỐ TRẠM PHÒNG !!">
	<ContentTemplate>
	 <br />
        
          <table align="center">

            <tr>
                <td align="left"">ID :</td>
                <td><telerik:RadTextBox ID="txtID" Runat="server" Width="220">
        </telerik:RadTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>

              <tr>
                <td align="left"">Tuyến dây :</td>
                <td><telerik:RadComboBox ID="cboTuyenDay" Runat="server"  Width="225"  Skin="Vista" AutoPostBack="True" >
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>


            <tr>
                <td>Trạm :</td>
                <td><telerik:RadComboBox ID="cboTram" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
            
            <tr>
                <td align="left"">Nội dung :</td>
                <td><telerik:RadTextBox ID="txtNoiDung" Runat="server"  Width="220">
        </telerik:RadTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>

          
            <tr>
                <td>Ngày kiểm tra :</td>
                <td> <telerik:RadDatePicker ID="dateNgayKT" Runat="server" Culture="vi-VN"  
                       MinDate="1960-01-01" Width="225">
<Calendar ID="Calendar4" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" runat="server"></Calendar>

<DateInput ID="DateInput4" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" runat="server"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                   </telerik:RadDatePicker></td>
            </tr>
              <tr>
            <td></td>
            </tr>
      
          </table>
    <div align="center">
        <telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="120px" 
                       Skin="Office2007"  OnClick="BOK_Click1">
                   </telerik:RadButton><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="120px" 
                   Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
    </div>
	</ContentTemplate>
	</telerik:RadWindow>
          
           <div align="center">  Chọn file :<asp:FileUpload ID="FileUpload1" runat="server" /><telerik:radbutton ID="Radbutton1" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
         Width="120px" >
     </telerik:radbutton>        
           
      <telerik:radbutton ID="Radbutton2" runat="server" Skin="WebBlue" Text="Lưu" 
         Width="120px" >
     </telerik:radbutton>
     <br />
    
        <div align="center">  <asp:Label ID="LabelCapNhat" runat="server"
                    ForeColor="#CC0000"></asp:Label></div>
       
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
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC GIA CỐ TRẠM PHÒNG">
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


       <telerik:radscriptmanager ID="RadScriptManager1" Runat="server">
        </telerik:radscriptmanager>
        <telerik:radstylesheetmanager ID="RadStyleSheetManager1" Runat="server">
        </telerik:radstylesheetmanager>
</asp:Content>
