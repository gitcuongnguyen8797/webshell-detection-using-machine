<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxPopupMenu1.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), (string)cbxRenderMode.Value);
        ASPxPopupMenu1.ShowPopOutImages = chbShowPopoutImages.Checked ? DefaultBoolean.True : DefaultBoolean.False;

        ASPxPopupMenu1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxPopupMenu1.RightToLeft;
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<DefaultBoolean>("ShowPopOutImages", delegate(DefaultBoolean value) { chbShowPopoutImages.Checked = value == DefaultBoolean.True; }, DefaultBoolean.True);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxRenderMode.Value.ToString()); });
        SaveOption<DefaultBoolean>("ShowPopOutImages", delegate() { return chbShowPopoutImages.Checked ? DefaultBoolean.True : DefaultBoolean.False; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupMenu.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <div style="width: 250px; height: 200px; padding: 8px">
        <a href="javascript:ASPxPopupMenu1.ShowAtPos(10, 10);">Show Popup Menu</a></div>
    <dx:ASPxPopupMenu ID="ASPxPopupMenu1" runat="server" ClientInstanceName="ASPxPopupMenu1" EnableScrolling="true" DisappearAfter="1000">
        <ClientSideEvents Init="function(s,e){ new ASPxPopupMenuPreviewHelper(s); s.ShowAtPos(10, 10); }" />
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
    </dx:ASPxPopupMenu>
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
    </table>
</asp:Content>
