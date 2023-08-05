<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxTabControl1.Enabled = !chbDisabled.Checked;
        ASPxTabControl1.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), (string)cbxRenderMode.Value);
        ASPxTabControl1.TabPosition = (TabPosition)Enum.Parse(typeof(TabPosition), cbxTabPosition.SelectedItem.Value.ToString());
        ASPxTabControl1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxTabControl1.RightToLeft;
        
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxTabControl ID="ASPxTabControl1" runat="server" ActiveTabIndex="0" Width="700px"
        EnableTabScrolling="true" TabAlign="Center">
        <ClientSideEvents Init="function(s, e) { new ASPxTabControlPreviewHelper(s); }"/>
        <Tabs>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab (with link)" NavigateUrl="#">
            </dx:Tab>
            <dx:Tab Text="Tab (with image)" TabImage-Url="~/Images/sample-image14x14.gif">
            </dx:Tab>
            <dx:Tab Text="Tab (with link & image)" NavigateUrl="#" TabImage-Url="~/Images/sample-image14x14.gif">
            </dx:Tab>
            <dx:Tab Text="Tab (disabled)" Enabled="false" NavigateUrl="#">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
            <dx:Tab Text="Tab">
            </dx:Tab>
        </Tabs>
    </dx:ASPxTabControl>
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
    </table>
</asp:Content>
