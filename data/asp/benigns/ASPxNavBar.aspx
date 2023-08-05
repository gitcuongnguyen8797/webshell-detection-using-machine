<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxNavBar1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        ASPxNavBar1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxNavBar1.RightToLeft;
        ASPxNavBar1.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), (string)cbxRenderMode.Value);
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxRenderMode.Value.ToString()); });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/NavBar.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxNavBar ID="ASPxNavBar1" runat="server" Width="230px" AllowSelectItem="true"
        EnableViewState="false" EnableCallBacks="true" ClientInstanceName="navBar">
        <ClientSideEvents Init="function(s, e) { new ASPxNavBarPreviewHelper(s); }" />
        <Groups>
            <dx:NavBarGroup Text="Group">
                <Items>
                    <dx:NavBarItem Text="Item" Selected="true">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (disabled)" Enabled="false">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="Group (with link)" NavigateUrl="#" Expanded="false">
                <Items>
                    <dx:NavBarItem Text="Item" NavigateUrl="#">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (disabled)" NavigateUrl="#" Enabled="false">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="Group (with left item image)" HeaderImage-Url="~/Images/sample-image14x14.gif"
                Expanded="false">
                <Items>
                    <dx:NavBarItem Text="Item" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (with link)" Image-Url="~/Images/sample-image14x14.gif"
                        NavigateUrl="#">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (disabled)" Enabled="false" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="Group (with right image)" ItemImagePosition="Right" HeaderImage-Url="~/Images/sample-image14x14.gif"
                Expanded="false">
                <Items>
                    <dx:NavBarItem Text="Item" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (with link)" Image-Url="~/Images/sample-image14x14.gif"
                        NavigateUrl="#">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (disabled)" Enabled="false" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="Group (with top image)" ItemImagePosition="Top" HeaderImage-Url="~/Images/sample-image14x14.gif"
                Expanded="false">
                <Items>
                    <dx:NavBarItem Text="Item" Image-Url="~/Images/sample-image50x50.gif">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (with link)" Image-Url="~/Images/sample-image50x50.gif"
                        NavigateUrl="#">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (disabled)" Enabled="false" Image-Url="~/Images/sample-image50x50.gif">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="Group (with bottom image)" ItemImagePosition="Bottom" HeaderImage-Url="~/Images/sample-image14x14.gif"
                Expanded="false">
                <Items>
                    <dx:NavBarItem Text="Item" Image-Url="~/Images/sample-image50x50.gif">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (with link)" Image-Url="~/Images/sample-image50x50.gif"
                        NavigateUrl="#">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (disabled)" Enabled="false" Image-Url="~/Images/sample-image50x50.gif">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="Group (bullet items)" ItemBulletStyle="Circle">
                <Items>
                    <dx:NavBarItem Text="Item" Selected="true">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (with link)" NavigateUrl="#">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item (disabled)" Enabled="false">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="Group (disabled)" Enabled="false">
                <Items>
                    <dx:NavBarItem Text="Item">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="Item">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>

    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function(selectionMode) {
            if(!ASPxClientControl.GetControlCollection().GetByName('chbShowLoadingPanel'))
                return;

            if(!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOptions" runat="server">
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
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option" Text="Show loading panel:"
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(navBar, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(navBar, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
