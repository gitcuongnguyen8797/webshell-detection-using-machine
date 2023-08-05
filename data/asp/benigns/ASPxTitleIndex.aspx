<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public string Text { get; set; }
        public string Group { get; set; }
        public string NavigateUrl { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        ASPxTitleIndex1.Enabled = !chbDisabled.Checked;
        ASPxTitleIndex1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxTitleIndex1.RightToLeft;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;

        ASPxTitleIndex1.Categorized = chbCategorized.Checked;
        
        ASPxTitleIndex1.DataSource = CreateDataSource();
        ASPxTitleIndex1.DataBind();

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Categorized", delegate(bool value) { chbCategorized.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Categorized", delegate() { return chbCategorized.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
    protected DataObject[] CreateDataSource() {
        int recordCount = 8;
        DataObject[] data = new DataObject[recordCount];
        for(int i = 0; i < recordCount; i++){
            data[i] = new DataObject { Text = i % 2 == 0 ? "Sample Text" : "Sample Text (with link)", Group =  i < recordCount / 2 ? "A" : "B", NavigateUrl =  i % 2 == 0 ? "" : "#" };
        }
        
        return data;
    }
</script>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/TitleIndex.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxTitleIndex ID="ASPxTitleIndex1" runat="server" TextField="Text" GroupingField="Group" NavigateUrlField="NavigateUrl" ClientInstanceName="ASPxTitleIndex1"
        ShowBackToTop="true" IndexPanel-Behavior="Filtering" Width="600px">
        <ClientSideEvents Init="function(s,e) { new ASPxTitleIndexPreviewHelper(s); }"/>
    </dx:ASPxTitleIndex>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblCategorized" CssClass="label" SkinID="Option" Text="Categorized:"
                    AssociatedControlID="chbCategorized">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbCategorized"  CssClass="editor" SkinID="Option" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblRtl" SkinID="Option" CssClass="label" Text="Right to left:"
                    AssociatedControlID="chbRtl">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbRtl" SkinID="Option" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblEnabled" SkinID="Option" CssClass="label" Text="Disabled:"
                    AssociatedControlID="chbDisabled">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option" Text="Show loading panel: " 
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(ASPxTitleIndex1, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(ASPxTitleIndex1, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>