<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="hosotk.aspx.vb" Inherits="DauNoi.hosotk" Culture="vi-VN" %>
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
			<div class="pagetitle icon-48-article"><h2>Quản lý hồ sơ thiết kế</h2></div>
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
          
       <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <asp:HiddenField ID="hdUserID" Value="0" runat="server" />
                <telerik:GridTextBoxColumnEditor runat="server" ID="MyEditor">  
                  <TextBoxStyle Width="350px" /> 
                </telerik:GridTextBoxColumnEditor>
                <telerik:GridNumericColumnEditor runat="server" ID="MyEditor1" NumericTextBox-MaxValue="999999999">  
                  <NumericTextBox Width="350" DataType="System.Int32" >
                    <NumberFormat AllowRounding="true" DecimalDigits="0" GroupSeparator="" />
                  </NumericTextBox>
                </telerik:GridNumericColumnEditor>
                <telerik:RadGrid ID="grdData" runat="server" DataSourceID="EntityDataSourceData"
                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                    AllowAutomaticDeletes="true" AllowSorting="true">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView DataSourceID="EntityDataSourceData" AutoGenerateColumns="False"
                        DataKeyNames="SOYEUCAU" CommandItemDisplay="Top">
                        <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                            </telerik:GridEditCommandColumn>                            
                            
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

                             <telerik:GridNumericColumn DataType="System.Int32" DataField="KEHOACHTKKT_KHANG" HeaderText="Số ngày KH lập hồ sơ TKKT" UniqueName="KEHOACHTKKT_KHANG" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn >                             
                            <telerik:GridDateTimeColumn DataField="NGAYNHANHSTK" HeaderText="Ngày nhận HSTK" UniqueName="NGAYNHANHSTK" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridDateTimeColumn DataField="NGAYTHOAHIEPHSTK" HeaderText="Ngày thỏa hiệp HSTK" UniqueName="NGAYTHOAHIEPHSTK" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" Visible="false">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridDateTimeColumn DataField="NGAYSCTTHAMTRAHSTK" HeaderText="Ngày SCT thẩm tra HSTK" UniqueName="NGAYSCTTHAMTRAHSTK" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" Visible="false">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridNumericColumn DataType="System.Int32" DataField="SONGAYSCTTHAMTRA" HeaderText="Số ngày SCT thẩm tra" UniqueName="SONGAYSCTTHAMTRA" Visible="false" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>
                            
                            <telerik:GridDateTimeColumn DataField="NGAYTHOATHUAN_DAODUONG" HeaderText="Ngày thỏa thuận đào đường" UniqueName="NGAYTHOATHUAN_DAODUONG" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridDateTimeColumn DataField="NGAYCAPPHEP_DAODUONG" HeaderText="Ngày cấp phép đào đường" UniqueName="NGAYCAPPHEP_DAODUONG" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" Visible="false">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridNumericColumn DataType="System.Int32" DataField="SONGAYCAPPHEP_DAODUONG" HeaderText="Số ngày cấp phép đào đường" UniqueName="SONGAYCAPPHEP_DAODUONG" Visible="false" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>
                            <telerik:GridNumericColumn DataType="System.Int32" DataField="SONGAY_THICONG" HeaderText="Số ngày thi công" UniqueName="SONGAY_THICONG" Visible="false" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>

                            <telerik:GridDateTimeColumn DataField="NGAY_SCT_NGHIEMTHU" HeaderText="Ngày SCT nghiệm thu" UniqueName="NGAY_SCT_NGHIEMTHU" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridNumericColumn DataType="System.Int32" DataField="SONGAY_SCT_NGHIEMTHU" HeaderText="Số ngày SCT nghiệm thu" UniqueName="SONGAY_SCT_NGHIEMTHU" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>
                            <telerik:GridDateTimeColumn DataField="NGAY_DONGDIEN_KHDENGHI" HeaderText="Ngày KH đề nghị đóng điện" UniqueName="NGAY_DONGDIEN_KHDENGHI" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridDateTimeColumn DataField="NGAY_DONGDIEN" HeaderText="Ngày nghiệm thu đóng điện" UniqueName="NGAY_DONGDIEN" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridNumericColumn DataType="System.Int32" DataField="SONGAY_DONGDIEN" HeaderText="Số ngày nghiệm thu đóng điện" UniqueName="SONGAY_DONGDIEN" Visible="false" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>
                            <telerik:GridNumericColumn DataType="System.Int32" DataField="KEHOACHTKKT_DIENLUC" HeaderText="Số ngày điện lực lập hồ sơ" UniqueName="KEHOACHTKKT_DIENLUC" Visible="false" ColumnEditorID="MyEditor1">
                            </telerik:GridNumericColumn>

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
                
                <%--<asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                    ConnectionString="name=Entities" 
                    DefaultContainerName="Entities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="TTDN_BIENNHAN" Where="it.[TENDANGNHAP]=@TENDANGNHAP" OrderBy="it.[SOYEUCAU]" EntityTypeFilter="TTDN_BIENNHAN">                    
                     <WhereParameters>                        
                        <asp:ControlParameter ControlID="hdUserID" DbType="String" DefaultValue="0" Name="TENDANGNHAP" />
                    </WhereParameters>
                </asp:EntityDataSource>--%>  
                <asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                    ConnectionString="name=Entities" 
                    DefaultContainerName="Entities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="TTDN_HS_TK" Where="it.[MADONVI]=@MADONVI" OrderBy="it.[NGAYNHANHSTK] desc" EntityTypeFilter="TTDN_HS_TK"> 
                    <WhereParameters>
                        <asp:SessionParameter SessionField="MADONVI" DbType="String" DefaultValue="0" Name="MADONVI" /> 
                    </WhereParameters>
                </asp:EntityDataSource>              
                        
            <%--</ContentTemplate>
        </asp:UpdatePanel--%>
        
        
    </div>
</div>

</asp:Content>
