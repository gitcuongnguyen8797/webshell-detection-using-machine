<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Init(object sender, EventArgs e) {
        report.Report = XtraReport1.CreateSampleReport(20);
    }
</script>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/ReportToolbar.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ReportToolbar runat="server" ID="reportToolbar" ReportViewerID="report" ClientInstanceName="reportToolbar">
    </dx:ReportToolbar>
    <div style="visibility: hidden; height: 10px; overflow: hidden;">
        <dx:ReportViewer runat="server" ID="report" ReportName="Report">
        </dx:ReportViewer>
    </div>
    <script type="text/javascript">
        new ASPxReportToolbarPreviewHelper(reportToolbar);
    </script>
</asp:Content>
