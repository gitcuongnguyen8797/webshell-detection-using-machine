<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.master" CodeBehind="biennhan.aspx.vb" Inherits="DauNoi.biennhan" Culture="vi-VN" %>

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
			<div class="pagetitle icon-48-article"><h2>Quản lý biên nhận</h2></div>
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
                            <telerik:GridBoundColumn DataField="SOYEUCAU" HeaderText="Số biên nhận" SortExpression="SOYEUCAU"
                                UniqueName="SOYEUCAU" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn> 
                            <telerik:GridDateTimeColumn DataField="NGAYNHAN" HeaderText="Ngày nhận" UniqueName="NGAYNHAN" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridBoundColumn DataField="HOTEN_KHANG" HeaderText="Tên khách hàng" UniqueName="HOTEN_KHANG" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DIACHI" HeaderText="Địa chỉ" UniqueName="DIACHI" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DIENTHOAI" HeaderText="Điện thoại" UniqueName="DIENTHOAI" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>  
                            <telerik:GridTemplateColumn DataField="LYDO" UniqueName="LYDO" HeaderText="Lý do" SortExpression="LYDO" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl12" Text='<%#Bind("LYDO")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <asp:TextBox ID="LYDO" CssClass="stext" Text='<%#Bind("LYDO")%>' runat="server"></asp:TextBox>                                   
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            <telerik:GridDateTimeColumn DataField="NGAYHEN_KHAOSAT" HeaderText="Ngày hẹn khảo sát" UniqueName="NGAYHEN_KHAOSAT" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn> 
                            <telerik:GridBoundColumn DataField="DIACHI_CAPDIEN" HeaderText="Địa chỉ cấp điện" UniqueName="DIACHI_CAPDIEN" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>                            
                            <telerik:GridBoundColumn DataField="NGUOIDAIDIEN" HeaderText="Người đại diện" UniqueName="NGUOIDAIDIEN" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CHUCVU" HeaderText="Chức vụ" UniqueName="CHUCVU" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HOSO_PHAPLY" HeaderText="Hồ sơ pháp lý" UniqueName="HOSO_PHAPLY" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TAIKHOAN_NGH" HeaderText="Tài khoản NH" UniqueName="TAIKHOAN_NGH" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CHINHANH_NGH" HeaderText="Chi nhánh NH" UniqueName="CHINHANH_NGH" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MASO_THUE" HeaderText="Mã số thuế" UniqueName="MASO_THUE" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="TAPTIN" HeaderText="Tập tin upload" UniqueName="TAPTIN">
                                <ItemTemplate>                                   
                                   <asp:HyperLink ID="hpTapTin" Text='<%#Bind("TAPTIN")%>' NavigateUrl='<%#Bind("TAPTIN")%>' runat="server"></asp:HyperLink>
                                   <asp:HiddenField ID="hdTapTin" Value='<%#Bind("TAPTIN")%>' runat="server" />  
                                   <asp:HiddenField ID="hdSYC" Value='<%#Bind("SOYEUCAU")%>' runat="server" />
                                                                    
                                </ItemTemplate>
                                <EditItemTemplate>             
                                    <asp:TextBox ID="TextBox12" CssClass="stext" ReadOnly="true" Text='<%# Bind("TAPTIN") %>' runat="server">
                                    </asp:TextBox>
                                    <br />
                                    <asp:FileUpload ID="txtFile" runat="server" />                                  
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
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
                    EntitySetName="TTDN_BIENNHAN" Where="it.[MADONVI]=@MADONVI" OrderBy="it.[NGAYNHAN] desc" EntityTypeFilter="TTDN_BIENNHAN"> 
                    <WhereParameters>
                        <asp:SessionParameter SessionField="MADONVI" DbType="String" DefaultValue="0" Name="MADONVI" /> 
                    </WhereParameters>
                </asp:EntityDataSource>              
                        
            <%--</ContentTemplate>
        </asp:UpdatePanel--%>
        
        
    </div>
</div>

</asp:Content>
