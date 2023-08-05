<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BangInKetQua.aspx.vb" Inherits="QuanLyThi.BangInKetQua" %>
<style type="text/css">
#tblBangKetQua
{
    width:960px;
    height:1024px;
    font-size:1.1em;
}
tr
{
    line-height:2em;
}
td
{
    vertical-align:middle;
    text-align:center;
}
.header
{
    line-height:1em;
    font-weight:bold;
    font-size: 1.3em;
}
.info
{
    text-align:left;
    font-weight:bold;
}
.result
{
    text-align:left;
    font-size:1.1em;
}
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bảng in kết qua thi trắc nghiệm</title>
</head>
<body>
<form id="form1" runat="server">
<table id="tblBangKetQua">
<tr>
<td></td>
<td >In kết quả thi lúc <asp:Label id=lblgio runat="server"></asp:Label> giờ <asp:Label id=lblphut runat="server"></asp:Label> phút</td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td><h3>TỔNG CÔNG TY ĐIỆN LỰC TP.HCM</h3></td>
<td><h3>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</h3></td>
</tr>
<tr>
<td><h4><asp:Label runat="server" ID="lblDV">CÔNG TY ĐIỆN LỰC SÀI GÒN</asp:Label></h4></td>
<td><h4>Độc lập - Tự do - Hạnh phúc</h4></td>
</tr>
<tr style="line-height:0.5em;">
<td valign="top">_______________________</td>
<td valign="top">____________________________</td>
</tr>
<tr>
<td colspan="2" class="header">BẢNG IN KẾT QUẢ</td>
</tr>
<tr>
<td colspan="2" class="header">THI QUY CHẾ DÂN CHỦ NĂM <asp:Label runat="server" ID="lblNam"></asp:Label></td>
</tr>
<tr>
<td colspan="2"><h4>(Phần thi trắc nghiệm trên máy tính)</h4></td>
</tr>
<tr>
<td colspan="2">______________________________________</td>
</tr>
<tr>
<td class="info">-Họ tên thí sinh:</td>
<td class="result"><asp:Label id=lblthisinh runat="server" Width="344px"></asp:Label></td>
</tr>
<tr>
<td class="info">-Đơn vị:</td>
<td class="result"><asp:Label id=lbldonvi runat="server" Width="336px"></asp:Label></td>
</tr>
<tr>
<td class="info">-Chức vụ:</td>
<td class="result"><asp:Label id=lblchucvu runat="server" Width="344px"></asp:Label></td>
</tr>
<tr>
<td class="info">-Ngày thi:</td>
<td class="result"><asp:Label id=lblngaythi runat="server" Width="336px"></asp:Label></td>
</tr>
<tr>
<td class="info">-Tổng số câu trả lời:</td>
<td class="result"><asp:Label id=lblsocautloi runat="server" Width="113px"></asp:Label>
    /<asp:Label ID="lbltscauhoi" runat="server" Width="50px"></asp:Label>
    </td>
</tr>
<tr>
<td class="info">-Số câu trả lời đúng:</td>
<td class="result"><asp:Label id=lblcaudung runat="server" Width="192px"></asp:Label></td>
</tr>
<tr>
<td class="info">-Số câu trả lời sai:</td>
<td class="result"><asp:Label id=lblcausai runat="server" Width="168px"></asp:Label></td>
</tr>
<tr>
<td class="info">-Tổng số điểm thi:</td>
<td class="result"><asp:Label id=lbltongdiem runat="server"></asp:Label></td>
</tr>
<tr>
<td class="info">-Kết quả thi trắc nghiệm</td>
<td class="result"><asp:Label id=lblketqua runat="server" Width="296px"></asp:Label></td>
</tr>
<tr>
<td><span style="font-weight:bold;">Ghi chú: </span> điểm đạt phần thi trắc nghiệm là 5 điểm trở lên</td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td><h4>THÍ SINH DỰ THI</h4></td>
<td><h4>BAN GIÁM KHẢO</h4></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>(Ký và ghi rõ họ tên)</td>
<td>(Ký và ghi rõ họ tên)</td>
</tr>
</table>
</form>
</body>
</html>
