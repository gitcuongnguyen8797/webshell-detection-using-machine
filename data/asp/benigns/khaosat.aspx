<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="khaosat.aspx.vb" Inherits="DauNoi.khaosat" Culture="vi-VN" %>
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
			<div class="pagetitle icon-48-article"><h2>Quản lý khảo sát</h2></div>
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
                            <telerik:GridTemplateColumn DataField="NHANVIEN" UniqueName="NHANVIEN" HeaderText="Nhân viên khảo sát" SortExpression="NHANVIEN">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl12" Text='<%#Bind("NHANVIEN")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <asp:TextBox ID="NHANVIEN" Text='<%#Bind("NHANVIEN")%>' CssClass="stext" runat="server"></asp:TextBox>                                   
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn DataField="SOYEUCAU" UniqueName="SOYEUCAU" HeaderText="Số biên nhận" SortExpression="SOYEUCAU">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl11" Text='<%#Bind("SOYEUCAU")%>' runat="server"></asp:Label>
                                    <asp:HiddenField ID="hdSoYeuCau" Value='<%#Bind("SOYEUCAU")%>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <telerik:RadComboBox runat="server" ID="cboBienNhan"
                                        DataTextField="SOYEUCAU" 
                                        DataValueField="SOYEUCAU" Width="355px" />
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                            <telerik:GridDateTimeColumn DataField="NGAYKHAOSAT" HeaderText="Ngày khảo sát" UniqueName="NGAYKHAOSAT" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                           
                            <telerik:GridTemplateColumn DataField="SO_MAYBA" UniqueName="SO_MAYBA" HeaderText="Số trạm" SortExpression="SO_MAYBA" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl1292" Text='<%#Bind("SO_MAYBA")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                       <telerik:RadComboBox runat="server" ID="SO_MAYBA" SelectedValue='<%#Bind("SO_MAYBA")%>' AutoPostBack="true" onselectedindexchanged="SO_MAYBA_SelectedIndexChanged" DataSourceID="XmlDataSource1"
                                        DataTextField="Text" 
                                        DataValueField="Value" Width="355px" /> 
                                        <asp:Panel ID="pnlNhomSMBA" BackColor="HighlightText" runat="server"> 
                                        </asp:Panel>                        
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                                                         
                            <telerik:GridTemplateColumn DataField="CONGSUATTONG" UniqueName="CONGSUATTONG" HeaderText="Công suất tổng" SortExpression="CONGSUATTONG" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl13" Text='<%#Bind("CONGSUATTONG")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>  
                                    <asp:TextBox ID="CONGSUATTONG" CssClass="stext" Text='<%#Bind("CONGSUATTONG")%>' Enabled="false" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>                            
                            <telerik:GridBoundColumn DataField="VITRITRAM" HeaderText="Vị trí đặt trạm" UniqueName="VITRITRAM" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="KETCAUTRAM" UniqueName="KETCAUTRAM" HeaderText="Kết cấu trạm" SortExpression="KETCAUTRAM">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl1441" Text='<%#Bind("KETCAUTRAM")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>                                    
                                    <telerik:RadComboBox runat="server" ID="KETCAUTRAM" SelectedValue='<%#Bind("KETCAUTRAM")%>' DataSourceID="EntityDataSourceLoaiTram"
                                        DataTextField="MOTA" 
                                        DataValueField="MOTA" Width="355px" />
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="VITRIDAUNOI" HeaderText="Vị trí đấu nối" UniqueName="VITRIDAUNOI" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TUYENDAY" HeaderText="Hướng tuyến, lưới trung thế" UniqueName="TUYENDAY" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="KIENNGHI" HeaderText="Kiến nghị" UniqueName="KIENNGHI" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn DataField="NGAYGIAO" HeaderText="Ngày giao" UniqueName="NGAYGIAO" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridDateTimeColumn DataField="KETTHUC" HeaderText="Biên bản kết thúc" UniqueName="KETTHUC" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridBoundColumn DataField="GHICHU" HeaderText="Ghi chú" UniqueName="GHICHU" Visible="false" ColumnEditorID="MyEditor">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="TAPTIN" HeaderText="Tập tin upload" UniqueName="TAPTIN">
                                <ItemTemplate>                                   
                                   <asp:HyperLink ID="hpTapTin" Text='<%#Bind("TAPTIN")%>' NavigateUrl='<%#Bind("TAPTIN")%>' runat="server"></asp:HyperLink>
                                   <asp:HiddenField ID="hdTapTin" Value='<%#Bind("TAPTIN")%>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>             
                                    <asp:TextBox ID="TextBox12" CssClass="stext" ReadOnly="true" Text='<%# Bind("TAPTIN") %>' runat="server">
                                    </asp:TextBox>
                                    <br />
                                    <asp:FileUpload ID="txtFile" CssClass="stext" runat="server" />                                  
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
                
                <asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                    ConnectionString="name=Entities" 
                    DefaultContainerName="Entities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="TTDN_KHAOSAT" Where="it.[MADONVI]=@MADONVI" OrderBy="it.[NGAYKHAOSAT] desc" EntityTypeFilter="TTDN_KHAOSAT"> 
                    <WhereParameters>
                        <asp:SessionParameter SessionField="MADONVI" DbType="String" DefaultValue="0" Name="MADONVI" /> 
                    </WhereParameters>                   
                </asp:EntityDataSource>
                <%--<asp:EntityDataSource ID="EntityDataSourceBienAp" runat="server" 
                    ConnectionString="name=Entities" 
                    DefaultContainerName="Entities"
                    EntitySetName="TTDN_MAYBIENAP" OrderBy="it.[MA_MBA]" EntityTypeFilter="TTDN_MAYBIENAP">                     
                </asp:EntityDataSource>--%>   
                <asp:EntityDataSource ID="EntityDataSourceLoaiTram" runat="server" 
                    ConnectionString="name=Entities" 
                    DefaultContainerName="Entities"
                    EntitySetName="TTDN_LOAITRAM" EntityTypeFilter="TTDN_LOAITRAM">                     
                </asp:EntityDataSource> 
                
                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLPosition.xml"></asp:XmlDataSource>             
                        
            <%--</ContentTemplate>
        </asp:UpdatePanel--%>
        
        
    </div>
</div>

</asp:Content>
