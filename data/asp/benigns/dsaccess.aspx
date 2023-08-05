<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" EnableEventValidation="true" CodeBehind="dsaccess.aspx.vb" Inherits="hcmpc.dsaccess" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-levels"><h2>Quản lý người dùng: Cấp độ truy cập</h2></div>
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
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <table id="tbl" width="100%">                    
                    <tr>
                        <td colspan="3" class="bor2">                            
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
                                <telerik:RadComboBox ID="cboUser" Filter="Contains" AutoPostBack="true" Runat="server" Width="300"></telerik:RadComboBox> 
                            </div>
                            <div class="tit">Nhóm quyền chưa gán &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nhóm quyền đã được gán</div>
                            <div>
                                <telerik:RadListBox ID="rlbChuaGan" runat="server" TransferToID="rlbDaGan"
                                    AllowTransfer="true" SelectionMode="Multiple" 
                                    AutoPostBackOnTransfer="true" Width="51%" Height="350">
                                    <Items>
                                        <telerik:RadListBoxItem runat="server" Text="Item1" />
                                        <telerik:RadListBoxItem runat="server" Text="Item2" />
                                        <telerik:RadListBoxItem runat="server" Text="Item3" />
                                        <telerik:RadListBoxItem runat="server" Text="Item4" />
                                    </Items>
                                </telerik:RadListBox>
                                <telerik:RadListBox ID="rlbDaGan" Width="48%" Height="350" runat="server">
                                </telerik:RadListBox>                                
                            </div>
                            <br />
                            <div class="tit">Thể loại bài viết chưa gán &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thể loại bài viết đã được gán</div>
                            <div>
                                <telerik:RadListBox ID="rlbTLChuaGan" runat="server" TransferToID="rlbTLDaGan"
                                    AllowTransfer="true" SelectionMode="Multiple" 
                                    AutoPostBackOnTransfer="true" Width="51%" Height="350">                                    
                                </telerik:RadListBox>
                                <telerik:RadListBox ID="rlbTLDaGan" Width="48%" runat="server" Height="350">
                                </telerik:RadListBox>                                
                            </div> 

                            <br />
                            <div class="tit">Thể loại ấn phẩm chưa gán &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thể loại ấn phẩm đã được gán</div>
                            <div>
                                <telerik:RadListBox ID="rlbTLAPChuaGan" runat="server" TransferToID="rlbTLAPDaGan"
                                    AllowTransfer="true" SelectionMode="Multiple" 
                                    AutoPostBackOnTransfer="true" Width="51%" Height="200">                                    
                                </telerik:RadListBox>
                                <telerik:RadListBox ID="rlbTLAPDaGan" Width="48%" runat="server" Height="200">
                                </telerik:RadListBox>
                            </div>
                                                        
                        </td>
                    </tr>
                </table>
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
        
    </div>
</div>
</asp:Content>
