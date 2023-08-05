<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="3C1.aspx.vb" Inherits="niengiam.WebForm14" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
 <div align="center">
                      Ngày biến động : <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                     Đơn vị :   
           <telerik:radcombobox ID="CbodonVi" Runat="server" 
                       Skin="Hay" 
                       Width="200">
                   </telerik:radcombobox>  &nbsp;
            <telerik:radbutton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
     </telerik:radbutton>
     <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px" >
     </telerik:RadButton>

                    

</div>
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
                        Font-Italic="False"   Caption="THỐNG KÊ KẾT QUẢ THAY THẾ VTTB VẬN HÀNH LÂU NĂM TRÊN LƯỚI ĐIỆN TRUNG THẾ">
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
                         <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="FCO" Name="FCO" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="LBFCO" Name="LBFCO" HeaderStyle-HorizontalAlign="Center">
                               <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="LA" Name="LA" HeaderStyle-HorizontalAlign="Center">
                               <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="LBS" Name="LBS" HeaderStyle-HorizontalAlign="Center">
                               <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="REC" Name="REC" HeaderStyle-HorizontalAlign="Center">
                               <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="DS" Name="DS" HeaderStyle-HorizontalAlign="Center">
                               <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>

                        </ColumnGroups>


                        <Columns>
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>
                          <%--  <telerik:GridCheckBoxColumn UniqueName="ToiDa1LanNamTramGIS" HeaderText="Tối đa 1 lần/năm với trạm GIS" 
                DataField="ToiDa1LanNamTramGIS" AllowSorting="false">
            </telerik:GridCheckBoxColumn>--%>
            
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>
                              <telerik:GridBoundColumn DataField="ID" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="ID" UniqueName="ID" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                           
                             <telerik:GridCalculatedColumn UniqueName="duongday" HeaderText="Đường dây"
                                 DataFields="TENPT, MAPT" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
                             <telerik:GridBoundColumn DataField="DIENLUC" HeaderButtonType="TextButton" 
                                HeaderText="Điện lực" SortExpression="DIENLUC" UniqueName="DIENLUC" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FCO" HeaderButtonType="TextButton" ColumnGroupName="FCO"
                                HeaderText="Quản lý" SortExpression="FCO" UniqueName="FCO" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FCOKEHOACH" HeaderButtonType="TextButton"  ColumnGroupName="FCO"
                                HeaderText="Kế hoạch" SortExpression="FCOKEHOACH" UniqueName="FCOKEHOACH" HeaderStyle-HorizontalAlign="Center"> 
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FCOTRONGTHANG" HeaderButtonType="TextButton"  ColumnGroupName="FCO"
                                HeaderText="Trong tháng" SortExpression="FCOTRONGTHANG" UniqueName="FCOTRONGTHANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FCOLUYKE" HeaderButtonType="TextButton"  ColumnGroupName="FCO"
                                HeaderText="Lũy kế" SortExpression="FCOLUYKE" UniqueName="FCOLUYKE" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBFCO" HeaderButtonType="TextButton"  ColumnGroupName="LBFCO"
                                HeaderText="Quản lý" SortExpression="LBFCO" UniqueName="LBFCO" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBFCOKEHOACH" HeaderButtonType="TextButton" ColumnGroupName="LBFCO"
                                HeaderText="Kế hoạch" SortExpression="LBFCOKEHOACH" UniqueName="LBFCOKEHOACH" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBFCOTRONGTHANG" HeaderButtonType="TextButton" ColumnGroupName="LBFCO"
                                HeaderText="Trong tháng" SortExpression="LBFCOTRONGTHANG" UniqueName="LBFCOTRONGTHANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBFCOLUYKE" HeaderButtonType="TextButton" ColumnGroupName="LBFCO"
                                HeaderText="Lũy kế" SortExpression="LBFCOLUYKE" UniqueName="LBFCOLUYKE" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LA" HeaderButtonType="TextButton" ColumnGroupName="LA"
                                HeaderText="Quản lý" SortExpression="LA" UniqueName="LA" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LAKEHOACH" HeaderButtonType="TextButton"  ColumnGroupName="LA"
                                HeaderText="Kế hoạch" SortExpression="LAKEHOACH" UniqueName="LAKEHOACH" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LATRONGTHANG" HeaderButtonType="TextButton"  ColumnGroupName="LA"
                                HeaderText="Trong tháng" SortExpression="LATRONGTHANG" UniqueName="LATRONGTHANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LALUYKE" HeaderButtonType="TextButton"  ColumnGroupName="LA"
                                HeaderText="Lũy kế" SortExpression="LALUYKE" UniqueName="LALUYKE" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBS" HeaderButtonType="TextButton"  ColumnGroupName="LBS"
                                HeaderText="Quản lý" SortExpression="LBS" UniqueName="LBS" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBSKEHOACH" HeaderButtonType="TextButton"  ColumnGroupName="LBS"
                                HeaderText="Kế hoạch" SortExpression="LBSKEHOACH" UniqueName="LBSKEHOACH" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBSTRONGTHANG" HeaderButtonType="TextButton"  ColumnGroupName="LBS"
                                HeaderText="Trong tháng" SortExpression="LBSTRONGTHANG" UniqueName="LBSTRONGTHANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LBSLUYKE" HeaderButtonType="TextButton"  ColumnGroupName="LBS"
                                HeaderText="Lũy kế" SortExpression="LBSLUYKE" UniqueName="LBSLUYKE" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="REC" HeaderButtonType="TextButton"  ColumnGroupName="REC"
                                HeaderText="Quản lý" SortExpression="REC" UniqueName="REC" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="RECKEHOACH" HeaderButtonType="TextButton"  ColumnGroupName="REC"
                                HeaderText="Kế hoạch" SortExpression="RECKEHOACH" UniqueName="RECKEHOACH" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="RECTRONGTHANG" HeaderButtonType="TextButton"  ColumnGroupName="REC"
                                HeaderText="Trong tháng" SortExpression="RECTRONGTHANG" UniqueName="RECTRONGTHANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="RECLUYKE" HeaderButtonType="TextButton"  ColumnGroupName="REC"
                                HeaderText="Lũy kế" SortExpression="RECLUYKE" UniqueName="RECLUYKE" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="DS" HeaderButtonType="TextButton"  ColumnGroupName="DS"
                                HeaderText="Quản lý" SortExpression="DS" UniqueName="DS" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DSKEHOACH" HeaderButtonType="TextButton"   ColumnGroupName="DS"
                                HeaderText="Kế hoạch" SortExpression="DSKEHOACH" UniqueName="DSKEHOACH" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DSTRONGTHANG" HeaderButtonType="TextButton"   ColumnGroupName="DS"
                                HeaderText="Trong tháng" SortExpression="DSTRONGTHANG" UniqueName="DSTRONGTHANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DSLUYKE" HeaderButtonType="TextButton"   ColumnGroupName="DS"
                                HeaderText="Lũy kế" SortExpression="DSLUYKE" UniqueName="DSLUYKE" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                     
                      
                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>

     <telerik:RadWindow ID="radwindowPopup" runat="server" VisibleOnPageLoad="false" Height="550"
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="THỐNG KÊ KẾT QUẢ THAY THẾ VTTB VẬN HÀNH LÂU NĂM TRÊN LƯỚI ĐIỆN TRUNG THẾ !!">
	<ContentTemplate>
	 <br />
        
          <table align="center">

               <tr>
                <td align="left">ID :</td>
                <td><telerik:RadTextBox ID="txtID" Runat="server" Width="220"  >
        </telerik:RadTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>



            <tr>
                <td align="left">PHAP TUYEN ID :</td>
                <td><telerik:RadComboBox ID="CboPhapTuyen" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>

             <tr>
                <td></td>
                <td> Tháng:<telerik:RadComboBox ID="CboThang" Runat="server"  Width="50"  Skin="Vista">
                   </telerik:RadComboBox>Năm:<telerik:RadComboBox ID="CboNam" Runat="server"  Width="70"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

           
            <tr>
                <td>FCO kế hoạch:</td>
                <td><telerik:RadNumericTextBox ID="txtFCOKH" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>FCO trong tháng :</td>
                <td><telerik:RadNumericTextBox ID="txtFCO" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
          
           
       <tr>
                <td>LBFCO kế hoạch:</td>
                <td><telerik:RadNumericTextBox ID="txtLBFCOKH" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>LBFCO trong tháng :</td>
                <td><telerik:RadNumericTextBox ID="txtLBFCO" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                <td>LA kế hoạch:</td>
                <td><telerik:RadNumericTextBox ID="txtLAKH" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>LA trong tháng :</td>
                <td><telerik:RadNumericTextBox ID="txtLA" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
            
              <tr>
                <td>LBS kế hoạch:</td>
                <td><telerik:RadNumericTextBox ID="txtLBSKH" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>LBS trong tháng :</td>
                <td><telerik:RadNumericTextBox ID="txtLBS" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
             
                 <tr>
                <td>REC kế hoạch:</td>
                <td><telerik:RadNumericTextBox ID="txtRECKH" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>REC trong tháng :</td>
                <td><telerik:RadNumericTextBox ID="txtREC" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
             
                 <tr>
                <td>DS kế hoạch:</td>
                <td><telerik:RadNumericTextBox ID="txtDSKH" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>DS trong tháng :</td>
                <td><telerik:RadNumericTextBox ID="txtDS" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
             



            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="150px" 
                      Skin="Office2007"  OnClick="BOK_Click1">
                   </telerik:RadButton></td>
                <td><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="150px" 
                       Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton></td>
            </tr>
          </table>
    
	</ContentTemplate>
	</telerik:RadWindow>
          
           <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
<br />
</asp:Content>
