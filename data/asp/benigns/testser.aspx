<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="testser.aspx.vb" Inherits="niengiam.testser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" src="Scripts/jquery-1.4.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container">
<asp:GridView ID="grdview_items" runat="server"
EnableViewState="false" Width="800">
<HeaderStyle  CssClass="grdview_headers"  />
 <Columns>
<asp:TemplateField HeaderStyle-Width="200px" ItemStyle-Width="200px"  HeaderText="Item1"><ItemTemplate></ItemTemplate></asp:TemplateField>
<asp:TemplateField HeaderStyle-Width="300px" ItemStyle-Width="300px"   HeaderText="Item2"><ItemTemplate></ItemTemplate></asp:TemplateField>
<asp:TemplateField HeaderStyle-Width="300px" ItemStyle-Width="300px"    HeaderText="Item3"><ItemTemplate></ItemTemplate></asp:TemplateField>
</Columns>
</asp:GridView>
</div>
<style>
.container 
{
    overflow:auto;
    margin-left:10px;
    height:300px; 
    width:710px;
 }

.grdview_headers
{
    color:#330000; 
    position:absolute;
    display:block;
    width:790px;
    margin-top:-1px;
}

</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('.container tr>td:nth-child(2)').css("background-color", "#EAEAEA").css("position", "absolute");
    });
</script>
    </div>
    </form>
</body>
</html>
