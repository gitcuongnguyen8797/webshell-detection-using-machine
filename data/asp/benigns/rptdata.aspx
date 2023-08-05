<%@ Page Language="vb" MasterPageFile="~/ASite.Master" AutoEventWireup="false" CodeBehind="rptdata.aspx.vb" Inherits="serCheckData.rptdata" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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
			<div class="pagetitle icon-48-article"><h2>Báo Cáo Chi Tiết Số Liệu Đo Xa</h2></div>
		</div>
    </div>
    <div id="system-message-container">            
        <asp:PlaceHolder ID="msg" runat="server">                
        </asp:PlaceHolder> 
    </div>
    <div id="element-box">
        <div class="m">



        <table width="90%" align="center">
            <tr>
                <td align="center">
                    <font color="green"><h1>DANH SÁCH KHÁCH HÀNG ICDREC THEO NGÀY</h1></font>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table>
                         <tr>
                            <td>Ngày:</td>
                            <td style=" width:20">&nbsp;</td>
                            <td>
                                <telerik:RadDatePicker ID="dpTuNgay" Calendar-CultureInfo="vi-VN" AutoPostBack="true" ToolTip="Xem dữ liệu" runat="server">
                                    <DateInput DateFormat="dd/MM/yyyy"> 
                                    </DateInput>
                                </telerik:RadDatePicker>
                            </td>
                        </tr>                        
                        <tr>
                            <td>Điện lực:</td>
                            <td></td>
                            <td><asp:DropDownList ID="lstDienLuc" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                        </tr>       
                        <tr>
                            <td>Filter:</td>
                            <td></td>
                            <td><asp:DropDownList ID="lstDieuKien" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                        </tr>       
                    </table>
                     
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                   <font color="blue"><asp:Label ID="lbMessageTotal" runat="server"></asp:Label></font>
                </td>
            </tr>            
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <asp:Label ID="lbMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>


        
    
   </div>
    </div>
</asp:Content>