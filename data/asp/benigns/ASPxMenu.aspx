<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxMenu1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        ASPxMenu1.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), (string)cbxRenderMode.Value);
        ASPxMenu1.Orientation = (Orientation)Enum.Parse(typeof(Orientation), (string)cbxOrientation.Value);
        SetItemImagesVisibility(ASPxMenu1.RootItem, chbShowItemImages.Checked);
        ASPxMenu1.ItemImagePosition = (DevExpress.Web.ASPxClasses.ImagePosition)Enum.Parse(typeof(DevExpress.Web.ASPxClasses.ImagePosition),
                cbxImagePosition.Value.ToString());
        ASPxMenu1.ShowPopOutImages = chbShowPopoutImages.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        ASPxMenu1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxMenu1.RightToLeft;
        
        //HACK: add div after horizontal menu to provide necessary space
        if(ASPxMenu1.Orientation == Orientation.Vertical) {
            ASPxMenu1.Width = 240;
        } else {
            ASPxMenu1.Width = 1320;
            Control container = ASPxMenu1.Parent;
            WebControl spacer = new WebControl(HtmlTextWriterTag.Div);
            spacer.Width = ASPxMenu1.Width;
            spacer.Height = 1;
            container.Controls.Add(spacer);
        }
        
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<Orientation>("Orientation", delegate(Orientation value) { cbxOrientation.Value = Enum.GetName(typeof(Orientation), value); }, Orientation.Vertical);
        LoadOption<DevExpress.Web.ASPxClasses.ImagePosition>("ImagePosition", delegate(DevExpress.Web.ASPxClasses.ImagePosition value) { cbxImagePosition.Value = Enum.GetName(typeof(DevExpress.Web.ASPxClasses.ImagePosition), value); }, DevExpress.Web.ASPxClasses.ImagePosition.Left);
        LoadOption<bool>("ShowItemImages", delegate(bool value) { chbShowItemImages.Checked = value; }, true);
        LoadOption<DefaultBoolean>("ShowPopOutImages", delegate(DefaultBoolean value) { chbShowPopoutImages.Checked = value == DefaultBoolean.True; }, DefaultBoolean.True);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxRenderMode.Value.ToString()); });
        SaveOption<Orientation>("Orientation", delegate() { return (Orientation)Enum.Parse(typeof(Orientation), cbxOrientation.Value.ToString()); });
        SaveOption<DevExpress.Web.ASPxClasses.ImagePosition>("ImagePosition", delegate() { return (DevExpress.Web.ASPxClasses.ImagePosition)Enum.Parse(typeof(DevExpress.Web.ASPxClasses.ImagePosition), cbxImagePosition.Value.ToString()); });
        SaveOption<bool>("ShowItemImages", delegate() { return chbShowItemImages.Checked; });
        SaveOption<DefaultBoolean>("ShowPopOutImages", delegate() { return chbShowPopoutImages.Checked ? DefaultBoolean.True : DefaultBoolean.False; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
    void SetItemImagesVisibility(DevExpress.Web.ASPxMenu.MenuItem item, bool visible) {
        if(item.Text.Contains("with image"))
            item.Image.Url = visible ? "~/Images/sample-image14x14.gif" : "";
        foreach(DevExpress.Web.ASPxMenu.MenuItem childItem in item.Items)
            SetItemImagesVisibility(childItem, visible);
    }
</script>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxMenu ID="ASPxMenu1" runat="server" ClientInstanceName="menu" EnableCallBacks="true"
        EnableViewState="false" EnableSubMenuScrolling="true" DisappearAfter="1000" Orientation="Vertical" ShowPopOutImages="True">
        <ClientSideEvents Init="function(s,e) { new ASPxMenuPreviewHelper(s); }" />
        <Items>
            <dx:MenuItem Text="Root Item">
                <Items>
                    <dx:MenuItem Text="Item">
                        <Items>
                            <dx:MenuItem Text="Item">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item">
                            </dx:MenuItem>
                        </Items>
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (checked)" GroupName="Group0" Checked="true">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (disabled)" Enabled="false">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Root Item (with link)" NavigateUrl="#">                
                <Items>
                    <dx:MenuItem Text="Item (with link)" NavigateUrl="#">
                        <Items>
                            <dx:MenuItem Text="Item" NavigateUrl="#">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item" NavigateUrl="#">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item" NavigateUrl="#">
                            </dx:MenuItem>
                        </Items>
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (checked with link)" NavigateUrl="#" GroupName="Group1"
                        Checked="true">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (disabled with link)" NavigateUrl="#" Enabled="false">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Root Item (with image)" Image-Url="~/Images/sample-image14x14.gif">
                <Items>
                    <dx:MenuItem Text="Item (with image)" Image-Url="~/Images/sample-image14x14.gif">
                        <Items>
                            <dx:MenuItem Text="Item" Image-Url="~/Images/sample-image14x14.gif">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item" Image-Url="~/Images/sample-image14x14.gif">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item" Image-Url="~/Images/sample-image14x14.gif">
                            </dx:MenuItem>
                        </Items>
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (checked with image)" GroupName="Group2" Checked="true" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (disabled with image)" Enabled="false" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Root Item (with image & link)" Image-Url="~/Images/sample-image14x14.gif"
                NavigateUrl="#">
                <Items>
                    <dx:MenuItem Text="Item (with image & link)" Image-Url="~/Images/sample-image14x14.gif"
                        NavigateUrl="#">
                        <Items>
                            <dx:MenuItem Text="Item" Image-Url="~/Images/sample-image14x14.gif" NavigateUrl="#">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item" Image-Url="~/Images/sample-image14x14.gif" NavigateUrl="#">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Item" Image-Url="~/Images/sample-image14x14.gif" NavigateUrl="#">
                            </dx:MenuItem>
                        </Items>
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (checked with image & link)" GroupName="Group3" Checked="true"
                        Image-Url="~/Images/sample-image14x14.gif" NavigateUrl="#">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item (disabled wWith image & link)" Enabled="false" Image-Url="~/Images/sample-image14x14.gif"
                        NavigateUrl="#">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
            <dx:MenuItem Text="Root Item (checked)" GroupName="Group4" Checked="true">
            </dx:MenuItem>
            <dx:MenuItem Text="Root Item (disabled)" Enabled="false">
            </dx:MenuItem>
            <dx:MenuItem Text="Root Item (selected)" Selected="true">
            </dx:MenuItem>
            <dx:MenuItem Text="Root Item (with scrolling)">
                <Items>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                    <dx:MenuItem Text="Item">
                    </dx:MenuItem>
                </Items>
            </dx:MenuItem>
        </Items>
    </dx:ASPxMenu>
    <script type="text/javascript">
        ASPxTBHelper.OnPreviewHelpersReady = function () {
            var menuInstance = ASPxClientControl.GetControlCollection().GetByName('menu');
            if(menuInstance)
                ASPxTBHelper.GetControlPreviewHelper(menuInstance.name).SetSubMenuVisibility('0', true); 
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
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" SkinID="Option" CssClass="label" Text="Orientation:"
                    AssociatedControlID="cbxOrientation">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxOrientation" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="1">
                    <Items>
                        <dx:ListEditItem Text="Horizontal" Value="Horizontal"></dx:ListEditItem>
                        <dx:ListEditItem Text="Vertical" Value="Vertical"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblShowItemImages" runat="server" SkinID="Option" CssClass="label" Text="Show item images:"
                    AssociatedControlID="chbShowItemImages">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowItemImages" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" Checked="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblImagePosition" runat="server" SkinID="Option" CssClass="label" Text="Item image position:"
                    AssociatedControlID="cbxImagePosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxImagePosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Left" Value="Left"></dx:ListEditItem>
                        <dx:ListEditItem Text="Right" Value="Right"></dx:ListEditItem>
                        <dx:ListEditItem Text="Top" Value="Top"></dx:ListEditItem>
                        <dx:ListEditItem Text="Bottom" Value="Bottom"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblShowPopoutImages" runat="server" SkinID="Option" CssClass="label" Text="Show popout images:"
                    AssociatedControlID="chbShowPopoutImages">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowPopoutImages" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" Checked="true">
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
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" SkinID="Option" CssClass="label" Text="Show loading panel:"
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(menu, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(menu, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
