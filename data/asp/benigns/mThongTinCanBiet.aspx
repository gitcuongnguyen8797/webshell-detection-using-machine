<%@ Page Title="Thông tin cần biết" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/shared/mMain.Master" CodeBehind="mThongTinCanBiet.aspx.vb" Inherits="hcmpc.mThongTinCanBiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        a {
            text-decoration: none;
            color: #024fa4;
            font-size:large;
          }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_page">
    <div id="divTopNews" class="padding_bottom_5">
        <ul class="list_news_image_100">
            <li class="end">
                <div class="main_news">
                    <div class="div_title_block_tin">
			            <a href="#" class="title_block_tin">
				            <span class="pLinkObj">
				                Thông Tin cần Biết
				            </span>
                            <span class="arrow"></span>
			            </a>
		            </div>
                </div>
            </li>
        </ul>
        <table border="0" cellpadding="10" cellspacing="20" style="margin:auto; width:100%;">
            <tbody>
                <tr>            
                    <td valign="top" align="center">
                        <a href="http://cskh.hcmpc.com.vn/ttchung/lichcatdien.html">
                            <img class="item-image" src="./images/icons/calendar.png" />
                            <div style="margin-top:10px;">Lịch Ghi Điện</div></a>
                    </td>
                    <td valign="top" align="center">
                        <a href="../m/mAnToanDien.aspx?ID=2">
                            <img class="item-image" src="./images/icons/calendar.png" />
                            <div style="margin-top:10px;">An toàn điện</div></a>
                    </td>            
                </tr>
                <tr>            
                    <td valign="top" align="center" >
                        <a href="../m/mLichCatDien.aspx">
                            <img class="item-image" src="./images/icons/calendar.png" />
                            <div style="margin-top:10px;">Lịch cắt điện</div></a>
                    </td>
                    <td valign="top" align="center">
                        <a href="../m/mGiaDien.aspx">
                            <img class="item-image" src="./images/icons/calendar.png" />
                            <div style="margin-top:10px;">Giá điện</div></a>
                    </td>            
                </tr>
            </tbody>
        </table>
    </div>
    </div>
</asp:Content>
