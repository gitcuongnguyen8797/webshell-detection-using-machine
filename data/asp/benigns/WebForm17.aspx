<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm17.aspx.vb" Inherits="niengiam.WebForm17" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <telerik:RadGrid ID="RadGrid1" runat="server">
        </telerik:RadGrid>
<%--    <telerik:RadGridView.ColumnGroups runat="server">
    <telerik:GridViewColumnGroup  Name="Data" Header="Data">
        <telerik:GridViewColumnGroup  Name="VehicleInfo" Header="Vehicle info" />
        <telerik:GridViewColumnGroup  Name="Dimensions" Header="Dimensions" />
    </telerik:GridViewColumnGroup>
</telerik:RadGridView.ColumnGroups>--%>
<%--<telerik:RadGridView x:Name="RadGridView1" GridLinesVisibility="Vertical" Width="450" CanUserFreezeColumns="False" AutoGenerateColumns="False" IsFilteringAllowed="False"  ShowGroupPanel="False" RowIndicatorVisibility="Collapsed">
            <telerik:RadGridView.ColumnGroups>
                <telerik:GridViewColumnGroup  Name="VehicleInfo" Header="Vehicle info" />
                <telerik:GridViewColumnGroup  Name="Dimensions" Header="Dimensions" />
            </telerik:RadGridView.ColumnGroups>
            <telerik:RadGridView.Columns>
                <telerik:GridViewDataColumn DataMemberBinding="{Binding Make}" ColumnGroupName="VehicleInfo" />
                <telerik:GridViewDataColumn DataMemberBinding="{Binding Model}" ColumnGroupName="VehicleInfo" />
                <telerik:GridViewDataColumn  DataMemberBinding="{Binding Length}" ColumnGroupName="Dimensions" />
                <telerik:GridViewDataColumn  DataMemberBinding="{Binding Width}"  ColumnGroupName="Dimensions" />
                <telerik:GridViewDataColumn  DataMemberBinding="{Binding Heigth}" ColumnGroupName="Dimensions" />
            </telerik:RadGridView.Columns>
</telerik:RadGridView>--%>

    </div>
    </form>
</body>
</html>
