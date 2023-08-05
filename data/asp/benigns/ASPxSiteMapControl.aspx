<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected SiteMapProvider CreateUnboundProvider(bool categorized) {
        UnboundSiteMapProvider provider = new UnboundSiteMapProvider();
        SiteMapNode node = provider.CreateNode("#_1", "SiteMap Node (root level)");
        provider.AddSiteMapNode(node);

        CreateNodeSubNodes(provider, node, 1);

        if(categorized) {
            node = provider.CreateNode("#_2", "SiteMap Node (root level)");
            provider.AddSiteMapNode(node);

            CreateNodeSubNodes(provider, node, 1);
        }
        return provider;
    }
    protected void CreateNodeSubNodes(UnboundSiteMapProvider provider, SiteMapNode parentNode, int level) {
        int maxLevelCount = 7;
        string nodeName = "SiteMap Node (level " + level + ")";

        SiteMapNode node = provider.CreateNode("", nodeName);
        provider.AddSiteMapNode(node, parentNode);

        node = provider.CreateNode("#" + Guid.NewGuid().ToString(), nodeName + " (with link)");
        provider.AddSiteMapNode(node, parentNode);
        
        if(level < maxLevelCount)
            CreateNodeSubNodes(provider, node, level + 1);
    }
    protected void Page_Load(object sender, EventArgs e) {
        ASPxSiteMapControl1.Enabled = !chbDisabled.Checked;
        ASPxSiteMapControl1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxSiteMapControl1.RightToLeft;
        
        ASPxSiteMapControl1.Categorized = chbCategorized.Checked;
        ASPxSiteMapControl1.FlowLayoutLevel = chbFlowLayout.Checked ? 1 : -1;
        
        ASPxSiteMapDataSource1.Provider = CreateUnboundProvider(chbCategorized.Checked || chbFlowLayout.Checked);
        ASPxSiteMapControl1.DataSource = ASPxSiteMapDataSource1;
        ASPxSiteMapControl1.DataBind();

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Categorized", delegate(bool value) { chbCategorized.Checked = value; }, false);
        LoadOption<bool>("FlowLayout", delegate(bool value) { chbFlowLayout.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Categorized", delegate() { return chbCategorized.Checked; });
        SaveOption<bool>("FlowLayout", delegate() { return chbFlowLayout.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxSiteMapControl ID="ASPxSiteMapControl1" runat="server" EnableViewState="false">
    </dx:ASPxSiteMapControl>
    <dx:ASPxSiteMapDataSource ID="ASPxSiteMapDataSource1" runat="server">
    </dx:ASPxSiteMapDataSource>
</asp:Content>
 
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
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
                <dx:ASPxLabel runat="server" ID="lblFlowLayout" CssClass="label" SkinID="Option" Text="Flow layout:"
                    AssociatedControlID="chbFlowLayout">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbFlowLayout"  CssClass="editor" SkinID="Option" AutoPostBack="true">
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
                <dx:ASPxLabel runat="server" ID="lblRtl" SkinID="Option" CssClass="label" Text="Right to left:">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbRtl" SkinID="Option" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
