<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
    }
</script>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/TreeView.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/ReportDocumentMap.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
     <dx:ReportDocumentMap runat="server" ID="documentMap" ReportViewerID="report">
     </dx:ReportDocumentMap>
     <div style="visibility: hidden; height: 10px; overflow: hidden;">
        <dx:ReportViewer runat="server" ID="report" ReportName="Report"
         Report="<%# new XtraReport1() %>">
        </dx:ReportViewer>
     </div>
     <script type="text/javascript">
        new ASPxReportDocumentMapPreviewHelper(ASPxTBHelper.FindControlByName("documentMap"));
     </script>
</asp:Content>
