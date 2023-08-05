<%@ page Title="" Language="vb" AutoEventWireup="false" MasterpageFile="~/Layout/baithiLayout.Master" CodeBehind="XacNhanNopBai.aspx.vb" Inherits="QuanLyThi.XacNhanNopBai" %>
<asp:Content ID="Content3" ContentplaceHolderID="mainContent" runat="server">
<style type="text/css">
    #tblKetQua
    {
        width:550px;padding:5px 10px 5px 10px;border:1px solid #cccdce;
        font-family: Verdana Tahoma Arial;
        font-size: 12pt;
    }
    .label
    {
        width:250px;
        padding-left:10px;
        font-size: 14pt;
        font-weight:bold;
    }
    h2
    { 
        text-align:center;
    }
    tr
    {
        line-height:2.5em;
    }
    </style>
<div id="confirmBox" style="width:650px;text-align:center;padding-top:10px;margin-bottom:20px;" runat="server">
<p><asp:label id="Label2" runat="server" ForeColor="#647DD7" Font-Size="Small" Font-Names="Courier New"
											Width="421px" Height="30px">Bạn đã chọn "Nộp bài". Nếu thực sự nộp bài, nhấn vào nút "Chấp nhận", nếu không nhấn nút "Thoát".</asp:label></p><br/><br/>
									<p><asp:button id="cmdStart" runat="server" ForeColor="White" 
                                            Font-Size="Small" Font-Names="Arial"
											Width="98px" Height="26px" BackColor="#003366" BorderStyle="Groove" Text="Chấp nhận"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<asp:button id="cmdExit" runat="server" ForeColor="MidnightBlue" 
                                            Font-Size="Small" Font-Names="Arial"
											Width="96px" Height="26px" BackColor="AliceBlue" BorderStyle="Groove" Text="Thoát"></asp:button></p>
</div>
<div id="kqBox" style="width:650px;padding-left:50px;text-align:justify;padding-top:5px;padding-bottom:10px;" runat="server">
<table id="tblKetQua">
<tr><td colspan="2"><h2 style="font-size:1.4em;font-weight:bold;">KẾT QUẢ THI</h2></td>
</tr>
<tr>
<td class="label">Họ tên thí sinh:</td>
<td><span style="FONT-FAMILY: 'Times New Roman'; FONT-SIZE: 15pt; mso-bidi-font-size: 12.0pt">
    <asp:Label ID="lblthisinh" runat="server" Width="344px"></asp:Label>
    </span></td>
</tr>
<tr>
<td class="label">Mã số NV:</td>
<td><span style="FONT-FAMILY: 'Times New Roman'; FONT-SIZE: 15pt; mso-bidi-font-size: 12.0pt">
    <asp:Label ID="lbldonvi" runat="server" Width="344px"></asp:Label>
    </span></td>
</tr>
<tr>
<td class="label">Chức vụ:</td>
<td><span style="FONT-FAMILY: 'Times New Roman'; FONT-SIZE: 15pt; mso-bidi-font-size: 12.0pt">
    <asp:Label ID="lblchucvu" runat="server" Width="344px"></asp:Label>
    </span></td>
</tr>
<tr>
<td class="label">Tổng số câu trả lời:</td>
<td><span style="FONT-FAMILY: 'Times New Roman'; FONT-SIZE: 15pt; mso-bidi-font-size: 12.0pt">
    <span style="mso-spacerun: yes">
    <asp:Label ID="lblsocautloi" runat="server" Width="50px"></asp:Label>
    /<asp:Label ID="lbltscauhoi" runat="server" Width="50px"></asp:Label>
    </span></span></td>
</tr>
<tr>
<td class="label">Số câu trả lời đúng:</td>
<td><span style="FONT-FAMILY: 'Times New Roman'; FONT-SIZE: 15pt; mso-bidi-font-size: 12.0pt">
    <span style="mso-spacerun: yes">
    <asp:Label ID="lbltloidung" runat="server" Width="113px"></asp:Label>
    </span></span></td>
</tr>
<tr>
<td class="label">Điểm số:</td>
<td><span style="FONT-FAMILY: 'Times New Roman'; FONT-SIZE: 15pt; mso-bidi-font-size: 12.0pt">
    <span style="mso-spacerun: yes">
    <asp:Label ID="lbltongdiem" runat="server" Width="113px"></asp:Label>
    </span></span></td>
</tr>
<tr>
<td class="label">Kết quả cuối cùng:</td>
<td><span style="FONT-FAMILY: 'Times New Roman'; FONT-SIZE: 15pt; mso-bidi-font-size: 12.0pt">
    <span style="mso-spacerun: yes">
    <asp:Label ID="lblketqua" runat="server" Width="113px"></asp:Label>
    </span></span></td>
</tr>
<tr>
<td class="label">&nbsp;</td>
<td><asp:button id="cmdViewCHSai" runat="server" ForeColor="White" 
                                            Font-Size="Small" Font-Names="Arial" 
        Height="26px" BackColor="#003366" BorderStyle="Groove" 
        Text="Xem lại câu hỏi trả lời sai"></asp:button></td>
</tr>
</table>
</div>
</asp:Content>
