<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="phHead" runat="Server">
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DropDownEdit.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/ComboBox.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dxsc:WeekOfMonthEdit runat="server" ID="WeekOfMonthEdit">
        <ClientSideEvents Init="function(s, e) { new ASPxComboBoxPreviewHelper(s); }" />
    </dxsc:WeekOfMonthEdit>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOptions" runat="Server">
</asp:Content>
