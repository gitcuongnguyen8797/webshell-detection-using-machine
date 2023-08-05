<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Video.aspx.cs" Inherits="Web_LichSinhHoat.Video" %>

<!DOCTYPE html>
<meta http-equiv="Refresh" content="85; url=default.aspx" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #objMediaPlayer {
            height: 423px;
            width: 457px;
        }
    </style>
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 174px;
        }
        .footer
        {
            position: fixed;
            bottom: 10px;
            color: #4e5766;
            padding: 8px 0px 0px 0px;
            margin: 0px auto;
            text-align: LEFT;
            line-height: normal;
        }

        


    </style>
</head>
<body>
    <form id="form1" runat="server">
         <p style="font-family: Arial, Helvetica, sans-serif; font-size: x-large; vertical-align: middle;
        text-align: center">
        <table class="style4">
            <tr>
                <%--<td class="style5" rowspan="3" width="20%">
                    <asp:Image ID="Image1" runat="server" Height="85px" ImageUrl="~/evnlogo.jpg" />
                </td>--%>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: 32px; font-weight: bold;
                    color: #0000FF; vertical-align: middle; text-align: center;">
                    CÔNG TY CÔNG NGHỆ THÔNG TIN
                </td>
            </tr>            
           <tr>
                <%--<td class="style5" rowspan="3" width="20%">
                    <asp:Image ID="Image1" runat="server" Height="85px" ImageUrl="~/evnlogo.jpg" />
                </td>--%>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: 32px; font-weight: bold;
                    color: #0000FF; vertical-align: middle; text-align: center;">
                    GIỜ TRÁI ĐẤT 2017
                </td>
            </tr>            
            
          
            <tr>
                <div id="wrapper" style="display: table-row; height: 100%; left: 0; padding-top: 70px; position: absolute; text-align: center; width: 100%; display: table">
        <p>

<video width="1280" height="720" controls autoplay>
  <source src="videos/GioTraiDat2017.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video> 

        </p>
            
                </div>

  

            </tr>
        </table>
    </p>
    
    
    
    </form>
</body>
</html>
