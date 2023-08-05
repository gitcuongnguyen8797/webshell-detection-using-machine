<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxPageControl1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        ASPxPageControl1.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), (string)cbxRenderMode.Value);
        ASPxPageControl1.TabPosition = (TabPosition)Enum.Parse(typeof(TabPosition), cbxTabPosition.SelectedItem.Value.ToString());
        ASPxPageControl1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxPageControl1.RightToLeft;
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<TabPosition>("TabPosition", delegate(TabPosition value) { cbxTabPosition.Value = Enum.GetName(typeof(TabPosition), value); }, TabPosition.Top);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxRenderMode.Value.ToString()); });
        SaveOption<TabPosition>("TabPosition", delegate() { return (TabPosition)Enum.Parse(typeof(TabPosition), cbxTabPosition.Value.ToString()); });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/TabControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PageControl.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Height="155px"
        Width="500px" EnableCallBacks="true" EnableTabScrolling="true" TabAlign="Center" ClientInstanceName="pc">
        <ClientSideEvents Init="function(s, e) { new ASPxPageControlPreviewHelper(s); }" />
        <TabPages>
            <dx:TabPage Text="TabPage">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        Sample content
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="TabPage (with image)" TabImage-Url="~/Images/sample-image14x14.gif">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        Sample content
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="TabPage (disabled)" Enabled="false">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        Sample content
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="TabPage" NewLine="true">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                        Sample content
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="TabPage">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                        Sample content
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="TabPage">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                        Sample content
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>

    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function(selectionMode) {
            if(!ASPxClientControl.GetControlCollection().GetByName('chbShowLoadingPanel'))
                return;

            if(!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" SkinID="Option" CssClass="label" Text="Render mode:"
                    AssociatedControlID="cbxRenderMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxRenderMode" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Classic" Value="Classic"></dx:ListEditItem>
                        <dx:ListEditItem Text="Lightweight" Value="Lightweight"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblTabPosition" runat="server" SkinID="Option" CssClass="label"
                    Text="Tab position:" AssociatedControlID="cbxTabPosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox SelectedIndex="0" ID="cbxTabPosition" runat="server" SkinID="Option"
                    CssClass="editor dropDown" AutoPostBack="True">
                    <Items>
                        <dx:ListEditItem Value="Top" Text="Top" />
                        <dx:ListEditItem Value="Bottom" Text="Bottom" />
                        <dx:ListEditItem Value="Left" Text="Left" />
                        <dx:ListEditItem Value="Right" Text="Right" />
                    </Items>
                </dx:ASPxComboBox>
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
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" SkinID="Option" CssClass="label" Text="Show loading panel:"
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" SkinID="Option" CssClass="editor" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(pc, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(pc, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
