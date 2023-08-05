<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="phHead" runat="Server">
    <script type="text/javascript" src="Scripts/PreviewHelpers/RadioButtonList.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dxsc:RecurrenceTypeEdit runat="server" ID="RecurrenceTypeEdit">
        <ClientSideEvents Init="function(s, e) { new ASPxRadioButtonListPreviewHelper(s); }" />
    </dxsc:RecurrenceTypeEdit>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOptions" runat="Server">
</asp:Content>
