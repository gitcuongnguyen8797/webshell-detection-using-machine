<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="thoathuan.aspx.vb" Inherits="DauNoi.thoathuan" Culture="vi-VN" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-article"><h2>Quản lý thỏa thuận</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder> 
</div>
<div id="element-box">
    <div class="m">        
        
        <style>
           
            #<%=grdData.ClientID%> input[type=image] {
                background: none;
                border: none;
                font-size: 13px;
                height: auto;
                line-height: auto;
            }
            
            #<%=grdData.ClientID%> input[type=text], select 
            {
                /*width:350px;*/
                
            }
            
                   
        </style>
          <script>

              function keyPress(sender, args) {
                  var k = eventArgs.get_keyCode()
                  if (!(k >= 48 && k <= 57)) {
                      eventArgs.set_cancel(true);
                  }
              }

          </script>
       <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <asp:HiddenField ID="hdDonViID" Value="0" runat="server" />
                <telerik:GridTextBoxColumnEditor runat="server" ID="MyEditor">  
                  <TextBoxStyle Width="350px" /> 
                </telerik:GridTextBoxColumnEditor>
                <telerik:GridNumericColumnEditor runat="server" ID="MyEditor1" NumericTextBox-MaxValue="999999999">  
                  <NumericTextBox Width="350" DataType="System.Int32" >
                    <NumberFormat AllowRounding="true" DecimalDigits="0" GroupSeparator="" />
                  </NumericTextBox>
                </telerik:GridNumericColumnEditor>
                <telerik:GridNumericColumnEditor runat="server" ID="MyEditor2" NumericTextBox-MaxValue="999999999">
                    <NumericTextBox Width="350" />
                </telerik:GridNumericColumnEditor>
                
                <telerik:RadGrid ID="grdData" runat="server" DataSourceID="EntityDataSourceData"
                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                    AllowAutomaticDeletes="true" AllowSorting="true">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView DataSourceID="EntityDataSourceData" AutoGenerateColumns="False"
                        DataKeyNames="SOTHOATHUAN" CommandItemDisplay="Top">
                        <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                            </telerik:GridEditCommandColumn>
                                                       
                            <telerik:GridTemplateColumn DataField="SOTHOATHUAN" UniqueName="SOTHOATHUAN" HeaderText="Số thỏa thuận" SortExpression="SOTHOATHUAN">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl15" Text='<%#Bind("SOTHOATHUAN")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <asp:TextBox ID="SOTHOATHUAN" Text='<%#Bind("SOTHOATHUAN")%>' CssClass="stext" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>                                   
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn DataField="SOYEUCAU" UniqueName="SOYEUCAU" HeaderText="Số biên nhận" SortExpression="SOYEUCAU">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl11" Text='<%#Bind("SOYEUCAU")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>                                    
                                    <telerik:RadComboBox runat="server" ID="cboBienNhan"
                                        DataTextField="SOYEUCAU" 
                                        DataValueField="SOYEUCAU" Width="355px" />
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                            <telerik:GridDateTimeColumn DataField="NGAYTHOATHUAN" HeaderText="Ngày thỏa thuận" UniqueName="NGAYTHOATHUAN" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>     
                            
                            <telerik:GridTemplateColumn DataField="DK_KYTHUAT" UniqueName="DK_KYTHUAT" HeaderText="Điều kiện kỹ thuật" SortExpression="DK_KYTHUAT">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl12" Text='<%#Bind("DK_KYTHUAT")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="cboKT11" SelectedValue='<%#Bind("DK_KYTHUAT")%>' DataSourceID="XmlDataSource1"
                                        DataTextField="Text" 
                                        DataValueField="Value" Width="355px" />                         
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>                        
                            <telerik:GridBoundColumn DataField="DIEN_TT_NOI" HeaderText="Km TT nổi 3 pha(Quốc gia)" UniqueName="DIEN_TT_NOI" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DIEN_TT_NGAM" HeaderText="Km TT ngầm 3 pha(Quốc gia)" UniqueName="DIEN_TT_NGAM" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="KHANG_TT_NOI" HeaderText="Km TT nổi 3 pha(Khách hàng)" UniqueName="KHANG_TT_NOI" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="KHANG_TT_NGAM" HeaderText="Km TT ngầm 3 pha(Khách hàng)" UniqueName="KHANG_TT_NGAM" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn DataField="MATMABA_HIENHUU" UniqueName="MATMABA_HIENHUU" HeaderText="Trạm hiện hữu" SortExpression="MATMABA_HIENHUU" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl131" Text='<%#Bind("MATMABA_HIENHUU")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <telerik:RadComboBox runat="server" ID="cboMBA" SelectedValue='<%#Bind("MATMABA_HIENHUU")%>' DataSourceID="ObjectDataSource1"
                                        DataTextField="CS" 
                                        DataValueField="MA_MBA" Width="355px" />
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                              <telerik:GridTemplateColumn DataField="CAP_HIENHUU" UniqueName="CAP_HIENHUU" HeaderText="Cấp điện áp" SortExpression="CAP_HIENHUU" Visible="false"> 
                                <ItemTemplate>-</ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="CAP_HIENHUU" SelectedValue='<%#Bind("CAP_HIENHUU")%>' DataSourceID="ObjectDataSource2"
                                        DataTextField="TENDAI" 
                                        DataValueField="ID" Width="355px" />                         
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            <telerik:GridNumericColumn DataField="SOMAY_HIENHUU" HeaderText="Số máy hiện hữu" UniqueName="SOMAY_HIENHUU" Visible="false" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>
                            
                            <telerik:GridTemplateColumn DataField="MATMAYBA_MOI" UniqueName="MATMAYBA_MOI" HeaderText="Trạm mới" SortExpression="MATMAYBA_MOI" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl1311" Text='<%#Bind("MATMAYBA_MOI")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <telerik:RadComboBox runat="server" ID="cboMBA1" SelectedValue='<%#Bind("MATMAYBA_MOI")%>' DataSourceID="ObjectDataSource1"
                                        DataTextField="CS" 
                                        DataValueField="MA_MBA" Width="355px" />
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                              <telerik:GridTemplateColumn DataField="CAP_MOI" UniqueName="CAP_MOI" HeaderText="Cấp điện áp" SortExpression="CAP_MOI" Visible="false">
                                <ItemTemplate>-</ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="CAP_MOI" SelectedValue='<%#Bind("CAP_MOI")%>' DataSourceID="ObjectDataSource2"
                                        DataTextField="TENDAI" 
                                        DataValueField="ID" Width="355px" />                         
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            <telerik:GridNumericColumn DataField="SOMAY_MOI" HeaderText="Số máy mới" UniqueName="SOMAY_MOI" Visible="false" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>
                            <telerik:GridTemplateColumn DataField="PA_DAUNOI" UniqueName="PA_DAUNOI" HeaderText="Phương án đấu nối" SortExpression="PA_DAUNOI" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl122" Text='<%#Bind("PA_DAUNOI")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="cboKT112" SelectedValue='<%#Bind("PA_DAUNOI")%>' DataSourceID="XmlDataSource2"
                                        DataTextField="Text" 
                                        DataValueField="Value" Width="355px" />                         
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                              <telerik:GridBoundColumn DataField="MA_NHANHRE" HeaderText="Nhánh rẽ" UniqueName="MA_NHANHRE" ColumnEditorID="MyEditor" Visible="false">
                                </telerik:GridBoundColumn> 
                                 <telerik:GridBoundColumn DataField="TIETDIEN_DAY" HeaderText="Tiết diện dây" UniqueName="TIETDIEN_DAY" ColumnEditorID="MyEditor" Visible="false">
                                </telerik:GridBoundColumn>

                              <telerik:GridTemplateColumn DataField="MATRAM_TRUNGGIAN" UniqueName="MATRAM_TRUNGGIAN" HeaderText="Trạm trung gian" SortExpression="MATRAM_TRUNGGIAN" Visible="false">                               
                                <ItemTemplate>-</ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="MATRAM_TRUNGGIAN" 
                                        DataTextField="TENTRAMTG" 
                                        DataValueField="MATRAMTG" Width="355px" AutoPostBack="true" onselectedindexchanged="TramTG_SelectedIndexChanged" />                         
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                              <telerik:GridTemplateColumn DataField="MA_TUYENDAY" UniqueName="MA_TUYENDAY" HeaderText="Tuyến dây" SortExpression="MA_TUYENDAY" Visible="false">                               
                                <ItemTemplate>-</ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="MA_TUYENDAY" 
                                        DataTextField="TENTUYENDAY" 
                                        DataValueField="MAYCAT" Width="355px" AutoPostBack="true" onselectedindexchanged="TuyenDay_SelectedIndexChanged" /> 
                                        <asp:Label ID="lblDongMax" Text="" ForeColor="Red" BackColor="Yellow" runat="server" style=" position:relative; font-weight:bold; left:140px; padding:3px;"></asp:Label>
                                        <asp:Label ID="lblDongHienTai" Text="" ForeColor="Red" BackColor="Yellow" runat="server" style=" position:relative; font-weight:bold; left:200px; padding:3px;"></asp:Label>
                                        <asp:Label ID="lblDongDinhMuc" Text="" ForeColor="Red" BackColor="Yellow" runat="server" style=" position:relative; font-weight:bold; left:260px; padding:3px;"></asp:Label>  
                                        <asp:Button ID="btnXemKH" Text="Xem KH" runat="server" OnClick="btnXemKHClick" style=" position:relative; left:-310px;top:1px" />
                                        <asp:UpdatePanel ID="upDSKH" UpdateMode="Conditional" runat="server">
                                            <ContentTemplate>
                                                <asp:ListBox ID="lsKHs" DataTextField="ten" DataValueField="ten" Width="355" Height="200" Visible="false" runat="server"></asp:ListBox>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnXemKH" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>                   
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                              <telerik:GridTemplateColumn DataField="DONGDAUNOI" UniqueName="DONGDAUNOI" SortExpression="DONGDAUNOI" HeaderText="Dòng đấu nối" Visible="false">                               
                                <ItemTemplate>-</ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadNumericTextBox ID="txtDongDauNoi" DbValue='<%#Bind("DONGDAUNOI")%>' runat="server" MinValue="0" DataType="System.Integer"
                                           MaxValue="1000000000" Width="335">
                                           <NumberFormat DecimalDigits="0" />
                                       </telerik:RadNumericTextBox>
                                       <asp:CheckBox ID="chkIsUpdated" Checked="true" runat="server" style=" position:absolute; left:565px;" tooltip="Cập nhật dòng hiện tại" />
                                       <asp:HiddenField ID="hdDongDauNoi" Value="0" runat="server" />
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            
                            <telerik:GridTemplateColumn DataField="VONTUCO" UniqueName="VONTUCO" HeaderText="Vốn tự có" SortExpression="VONTUCO" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl1255" Text='<%#Bind("VONTUCO")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="cboVonTuCo" SelectedValue='<%#Bind("VONTUCO")%>' DataSourceID="XmlDataSource1"
                                        DataTextField="Text" 
                                        DataValueField="Value" Width="355px" />                         
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn> 
                              <telerik:GridTemplateColumn DataField="NOIDUNGKHAC" UniqueName="NOIDUNGKHAC" HeaderText="Nội dung khác" SortExpression="NOIDUNGKHAC" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl15444" Text='<%#Bind("NOIDUNGKHAC")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <asp:TextBox ID="NOIDUNGKHAC" Text='<%#Bind("NOIDUNGKHAC")%>' TextMode="MultiLine" Width="350" Height="100" runat="server"></asp:TextBox>                                   
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            
                            <telerik:GridBoundColumn DataField="QUYMOCONGTIRNH" HeaderText="Quy mô công trình" UniqueName="QUYMOCONGTIRNH" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn DataField="NGAYDAUNOI" HeaderText="Ngày đấu nối" UniqueName="NGAYDAUNOI" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            
                            <telerik:GridBoundColumn DataField="THOATHUANKHAC" HeaderText="Thỏa thuận khác" UniqueName="THOATHUANKHAC" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="YEUCAU_CAPDIEN" HeaderText="Yêu cầu cấp điện" UniqueName="YEUCAU_CAPDIEN" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MUCDICH_SUDUNG" HeaderText="Mục đích sử dụng" UniqueName="MUCDICH_SUDUNG" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridNumericColumn DataField="CONGSUAT_SUDUNG" HeaderText="Công suất sử dụng" UniqueName="CONGSUAT_SUDUNG" ColumnEditorID="MyEditor2" Visible="false">
                            </telerik:GridNumericColumn>
                            
                            <telerik:GridBoundColumn DataField="TIENDO_SUDUNG" HeaderText="Tiến độ sử dụng" UniqueName="TIENDO_SUDUNG" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn DataField="DIENTHE_SUDUNG" UniqueName="DIENTHE_SUDUNG" HeaderText="Điện thế sử dụng" SortExpression="DIENTHE_SUDUNG" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl12554" Text='<%#Bind("DIENTHE_SUDUNG")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="DIENTHE_SUDUNG" SelectedValue='<%#Bind("DIENTHE_SUDUNG")%>' DataSourceID="XmlDataSource3"
                                        DataTextField="Text" 
                                        DataValueField="Value" Width="355px" />
                                        <asp:HiddenField ID="hdIsQDCD" Value="0" runat="server" />  
                                        <asp:HiddenField ID="hdDongDauNoiTemp" Value="0" runat="server" />                     
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                         
                            <telerik:GridDateTimeColumn DataField="NGAYNHAN_THOATUAN" HeaderText="Ngày nhận thỏa thuận" UniqueName="NGAYNHAN_THOATUAN" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                           
                            <telerik:GridBoundColumn DataField="TEN_CONGTRINH" HeaderText="Tên công trình" UniqueName="TEN_CONGTRINH" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SO_QD_CAPDIEN" HeaderText="Số quyết định cấp điện" UniqueName="SO_QD_CAPDIEN" ColumnEditorID="MyEditor" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn DataField="NGAY_QD_CAPDIEN" HeaderText="Ngày quyết định cấp điện" UniqueName="NGAY_QD_CAPDIEN" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                                                                                  
                            <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />
                        </Columns>
                         <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                        <EditFormSettings>
                            <EditColumn ButtonType="ImageButton" />
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>                
                
                <asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                    ConnectionString="name=Entities" 
                    DefaultContainerName="Entities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="TTDN_THOATHUAN" Where="it.[MADONVI]=@MADONVI" OrderBy="it.[SOTHOATHUAN] desc" EntityTypeFilter="TTDN_THOATHUAN">    
                    <WhereParameters>
                        <asp:SessionParameter SessionField="MADONVI" DbType="String" DefaultValue="0" Name="MADONVI" /> 
                    </WhereParameters>                
                </asp:EntityDataSource>
                <%--<asp:EntityDataSource ID="EntityDataSourceBienNhan" runat="server" 
                    ConnectionString="name=Entities" 
                    DefaultContainerName="Entities"
                    EntitySetName="TTDN_BIENNHAN" Where="it.[MADONVI]=@MADONVI" OrderBy="it.[SOYEUCAU]" EntityTypeFilter="TTDN_BIENNHAN">     
                    <WhereParameters>
                        <asp:SessionParameter SessionField="MADONVI" DbType="String" DefaultValue="0" Name="MADONVI" /> 
                    </WhereParameters>                
                </asp:EntityDataSource>--%>    
                <asp:EntityDataSource ID="EntityDataSourceBienAp" runat="server" 
                    ConnectionString="name=Entities"
                    DefaultContainerName="Entities"
                    EntitySetName="TTDN_MAYBIENAP" OrderBy="it.[MA_MBA]" EntityTypeFilter="TTDN_MAYBIENAP">                     
                </asp:EntityDataSource>

                <asp:ObjectDataSource ID="ObjectDataSource1" TypeName="DauNoi.LoadData" SelectMethod="GetMBAList" runat="server">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" TypeName="DauNoi.LoadData" SelectMethod="GetCAPDAList" runat="server">
                </asp:ObjectDataSource>
                                                           
                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLTrangThai.xml"></asp:XmlDataSource>  
                <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/XMLPhuongAn.xml"></asp:XmlDataSource>
                <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/XMLDTSD.xml"></asp:XmlDataSource>  
                   
            <%--</ContentTemplate>
        </asp:UpdatePanel--%>
        
        
    </div>
</div>

</asp:Content>
