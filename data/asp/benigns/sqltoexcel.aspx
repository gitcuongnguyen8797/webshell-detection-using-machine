<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sqltoexcel.aspx.vb" Inherits="NCPT.sqltoexcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">

        .mydatagrid
{
	width: 80%;
	border: solid 2px black;
	min-width: 80%;
}
.header
{
	background-color: #646464;
	font-family: Arial;
	color: White;
	border: none 0px transparent;
	height: 25px;
	text-align: center;
	font-size: 12px;
}

.rows
{
	background-color: #fff;
	font-family: Arial;
	font-size: 11px;
	color: #000;
	min-height: 25px;
	text-align: left;
	border: none 0px transparent;
}
.rows:hover
{
	background-color: #ff8000;
	font-family: Arial;
	color: #fff;
	text-align: left;
}
.selectedrow
{
	background-color: #ff80ff;
	font-family: Arial;
	color: #fff;
	font-weight: bold;
	text-align: left;
}
.mydatagrid a /** FOR THE PAGING ICONS  **/
{
	background-color: Transparent;
	padding: 5px 5px 5px 5px;
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}

.mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
{
	background-color: #000;
	color: #fff;
}
.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
	background-color: #c9c9c9;
	color: #000;
	padding: 5px 5px 5px 5px;
}
.pager
{
	background-color: #646464;
	font-family: Arial;
	color: White;
	height: 30px;
	text-align: left;
}

.mydatagrid td
{
	padding: 5px;
}
.mydatagrid th
{
	padding: 5px;
}



    </style>


</head>
<body>
    <form id="form1" runat="server">
    <div>

                <table align="center" width="800">
            <tr>
                <td colspan="3" align="center">
                    <h3>QUERY PANE</h3>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td valign="top">
                    SQL
                </td>
                <td>
                </td>
                <td>
                    <asp:TextBox ID="txtSQL" TextMode="MultiLine" runat="server" Height="280px" Width="550px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                </td>
                <td>
                    <font color="RED"><asp:Label ID="lbMessage" runat="server" Text="&nbsp;"></asp:Label></font>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnPreview" runat="server" Text="Preview" />&nbsp;
                    <asp:Button ID="btnExport" runat="server" Text="Export" />&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Reset" />&nbsp;<br />
                </td>
                </tr>

                <tr>
                <td colspan="3" align="left">
                     <font color="BLUE"><asp:Label ID="lbResult" runat="server" Text="&nbsp;"></asp:Label></font>
                </td>
                </tr>           
                    

                <tr>
                <td colspan="3" align="left">
                <asp:GridView ID="grvData" 
                    CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" 
                    runat="server">
                </asp:GridView>
                </td>
                </tr>
        </table>



        <br />
        <br />
        
    </div>
    </form>
</body>
</html>
