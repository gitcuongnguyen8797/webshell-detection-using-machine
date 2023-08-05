<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="servey.aspx.vb" Inherits="hcmpc.servey" %>
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
			<div class="pagetitle icon-48-article"><h2>Quản lý câu hỏi</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">        
        
        <style>
            .MyImageButton
            {
                cursor: hand;
            }
            .EditFormHeader td
            {
                font-size: 14px;
                padding: 4px !important;
                color: #0066cc;
            }
            #tbl input[type=text],input[type=image], select {
                background: none;
                border: none;
                font-size: 13px;
                height: auto;
                line-height: auto;
            }
            #ctl00_ContentPlaceHolder1_grdTraLoi_ctl00_ctl02_ctl03_mainTable input[type=text] , #ctl00_ContentPlaceHolder1_grdCauHoi_ctl00 input[type=text]{                
                border: solid 1px #DDD;    
                width:250px;                           
            }
            .RadGrid_Default .rgHeader, .RadGrid_Default .rgHeader a {
                 font-weight:bold;
            }
            .bor1{ border:solid 1px #DDD; width:49.4%; background-color:#fff; vertical-align:top;}
            .bor2{ border:solid 1px #DDD; background-color:#fff; vertical-align:top;}
            .tit{ background-color:#DDD; color:#146295; font-weight:bold; font-size:14px; text-align:center; padding:5px;}
        </style>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table id="tbl" width="100%">
                    <tr>
                        <td class="bor1">
                            <div class="tit">TRẢ LỜI</div>
                            <telerik:RadGrid ID="grdTraLoi" runat="server" DataSourceID="EntityDataSourceServeyList"
                                AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                                AllowAutomaticDeletes="true" AllowSorting="true">
                                <PagerStyle Mode="NextPrevAndNumeric" />
                                <MasterTableView DataSourceID="EntityDataSourceServeyList" AutoGenerateColumns="False"
                                    DataKeyNames="Question_No" CommandItemDisplay="Top">
                                    <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                                    <Columns>
                                        <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridBoundColumn DataField="Question_No" HeaderText="ID" SortExpression="Question_No"
                                            UniqueName="Question_No" Visible="false" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="QuestionText" HeaderText="Tiêu đề" SortExpression="QuestionText"
                                            UniqueName="QuestionText">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridNumericColumn DataField="Value" HeaderText="Giá trị" UniqueName="Value">
                                        </telerik:GridNumericColumn>                                       
                                        <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn ButtonType="ImageButton" />
                                    </EditFormSettings>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:EntityDataSource ID="EntityDataSourceServeyList" runat="server" 
                                ConnectionString="name=WEBHCMPCEntities" 
                                DefaultContainerName="WEBHCMPCEntities" EnableDelete="True" 
                                EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                                EntitySetName="A_Survey_List" OrderBy="it.[Question_No]" EntityTypeFilter="A_Survey_List">
                            </asp:EntityDataSource>

                        </td>
                        <td></td>
                        <td class="bor1">
                            <div class="tit">CÂU HỎI</div>
                            <style>
                            .bbbb{ line-height:1px; font-size:10px; cursor:pointer;}
                            </style>
                            <telerik:RadGrid ID="grdCauHoi" runat="server" DataSourceID="EntityDataSourceServey"
                                AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                                AllowAutomaticDeletes="true" AllowSorting="true">
                                <PagerStyle Mode="NextPrevAndNumeric" />
                                <MasterTableView DataSourceID="EntityDataSourceServey" AutoGenerateColumns="False"
                                    DataKeyNames="Question_ID" CommandItemDisplay="Top">
                                    <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                                    <Columns>
                                        <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridBoundColumn DataField="Question_ID" HeaderText="ID" SortExpression="Question_ID"
                                            UniqueName="Question_ID" Visible="false" ReadOnly="true">
                                        </telerik:GridBoundColumn> 
                                        
                                        <telerik:GridTemplateColumn>    
                                                 <ItemTemplate>    
                                                       <asp:LinkButton ID="btnChon" runat="server" CommandName="Chon" CommandArgument='<%#Eval("Question_ID") %>'>Chọn     
                                                       </asp:LinkButton>    
                                                 </ItemTemplate>    
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="QuestionText" HeaderText="Tiêu đề" SortExpression="QuestionText"
                                            UniqueName="QuestionText">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Notes" Visible="false" HeaderText="Ghi chú" SortExpression="Notes"
                                            UniqueName="Notes" />                                        
                                        <telerik:GridDateTimeColumn DataField="DateStart" HeaderText="Bắt đầu" UniqueName="DateStart" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" />
                                        <telerik:GridDateTimeColumn DataField="DateEnd" HeaderText="Kết thúc" UniqueName="DateEnd" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" />
                                        <telerik:GridCheckBoxColumn DataField="Is_Published" HeaderText="Trạng thái" UniqueName="Is_Published"></telerik:GridCheckBoxColumn>                                       
                                        <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn ButtonType="ImageButton" />
                                    </EditFormSettings>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:EntityDataSource ID="EntityDataSourceServey" runat="server" 
                                ConnectionString="name=WEBHCMPCEntities" 
                                DefaultContainerName="WEBHCMPCEntities" EnableDelete="True" 
                                EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                                EntitySetName="A_Survey" OrderBy="it.[Question_ID]" EntityTypeFilter="A_Survey">
                            </asp:EntityDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right">
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="bor2">
                            <div class="tit">TRẢ LỜI => CÂU HỎI</div>
                            <div align="right" style=" padding:5px;">
                                <script>
                                    function OnClientClicking() {
                                        var r = confirm("Cập nhật dữ liệu?");
                                        if (r == true)
                                            return true;
                                        return false;
                                    }
                                </script>
                                <asp:Button ID="btnCapNhat" style="height: 22px; line-height: 22px; vertical-align:middle; cursor:pointer;" OnClientClick="return OnClientClicking()" Text="Cập nhật" runat="server" />    
                                <telerik:RadComboBox ID="cboCauHoi" AutoPostBack="true" Runat="server" Width="300"></telerik:RadComboBox> 
                            </div>
                            <div>
                                <telerik:RadListBox ID="rlbTraLoi" runat="server" TransferToID="rlbCauHoi"
                                    AllowTransfer="true" SelectionMode="Multiple" AutoPostBack="true" 
                                    AutoPostBackOnTransfer="true" Width="51%">
                                    <Items>
                                        <telerik:RadListBoxItem runat="server" Text="Item1" />
                                        <telerik:RadListBoxItem runat="server" Text="Item2" />
                                        <telerik:RadListBoxItem runat="server" Text="Item3" />
                                        <telerik:RadListBoxItem runat="server" Text="Item4" />
                                    </Items>
                                </telerik:RadListBox>
                                <telerik:RadListBox ID="rlbCauHoi" Width="48%" runat="server">
                                </telerik:RadListBox>
                                <asp:Label ID="lblTransfer" runat="server"></asp:Label>
                            </div>                            
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</div>

</asp:Content>
