<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxDockPanel1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxDockPanel1.RightToLeft;
        
        if(chbHeaderAsLink.Checked)
            ASPxDockPanel1.HeaderNavigateUrl = "#";
        if(chbFooterAsLink.Checked)
            ASPxDockPanel1.FooterNavigateUrl = "#";

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("HeaderAsLink", delegate(bool value) { chbHeaderAsLink.Checked = value; }, false);
        LoadOption<bool>("FooterAsLink", delegate(bool value) { chbFooterAsLink.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("HeaderAsLink", delegate() { return chbHeaderAsLink.Checked; });
        SaveOption<bool>("FooterAsLink", delegate() { return chbFooterAsLink.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>
<asp:Content ID="Content3" ContentPlaceHolderID="phHead" runat="Server">
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxDockPanel ID="ASPxDockPanel1" runat="server" HeaderText="Sample Header Text"
        FooterText="Sample Footer Text" AllowResize="false" ShowSizeGrip="True" AllowDragging="false"
        ShowFooter="true" ShowOnPageLoad="true" PanelUID="1" Top="10" Left="10" Width="400"
        Height="200" ClientInstanceName="dockPanel" EnableViewState="false">
        <ClientSideEvents Init="function(s, e) { new ASPxPopupControlPreviewHelper(s); }" />
        <Images>
            <Header Url="~/Images/sample-image14x14.gif" />
            <Footer Url="~/Images/sample-image14x14.gif" />
        </Images>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Sample Content
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ClientSideEvents Closing="function(s,e){ e.cancel=true; }" />
    </dx:ASPxDockPanel>
    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function (selectionMode) {
            if (!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
    </script>
</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="phOptions">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblHeaderAsLink" SkinID="Option" CssClass="label"
                    Text="Show header as link:" AssociatedControlID="chbHeaderAsLink">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbHeaderAsLink" SkinID="Option" CssClass="editor"
                    AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblFooterAsLink" SkinID="Option" CssClass="label"
                    Text="Show footer as link:" AssociatedControlID="chbFooterAsLink">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbFooterAsLink" SkinID="Option" CssClass="editor"
                    AutoPostBack="true">
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
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option"
                    Text="Show loading panel:" AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option"
                    ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(dockPanel, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(dockPanel, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
