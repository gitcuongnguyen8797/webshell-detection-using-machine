<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
    }
</script>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ReportParametersPanel runat="server" ID="parameterPanel" ReportViewerID="report"
        Width="200px">
    </dx:ReportParametersPanel>
     <div style="visibility: hidden; height: 10px; overflow: hidden;">
        <dx:ReportViewer runat="server" ID="report" ReportName="Report"
         Report="<%# new XtraReport1() %>">
        </dx:ReportViewer>
     </div>
     <script type="text/javascript">
        new ASPxControlPreviewHelper(ASPxTBHelper.FindControlByName("parameterPanel"));
     </script>
</asp:Content>
