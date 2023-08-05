<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxPopupControl1.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), (string)cbxRenderMode.Value);

        ASPxPopupControl1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxPopupControl1.RightToLeft;
        
        if(chbHeaderAsLink.Checked) 
            ASPxPopupControl1.HeaderNavigateUrl = "#";
        if(chbFooterAsLink.Checked) 
            ASPxPopupControl1.FooterNavigateUrl = "#";

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<bool>("HeaderAsLink", delegate(bool value) { chbHeaderAsLink.Checked = value; }, false);
        LoadOption<bool>("FooterAsLink", delegate(bool value) { chbFooterAsLink.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxRenderMode.Value.ToString()); });
        SaveOption<bool>("HeaderAsLink", delegate() { return chbHeaderAsLink.Checked; });
        SaveOption<bool>("FooterAsLink", delegate() { return chbFooterAsLink.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>
<asp:Content ID="Content3" ContentPlaceHolderID="phHead" runat="Server">
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <div style="width: 300px; height: 200px">
    </div>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Sample Header Text" ClientInstanceName="pc"
        FooterText="Sample Footer Text" AllowDragging="false" ShowSizeGrip="True" ShowFooter="true" EnableHierarchyRecreation="true"
        CloseAction="None" ShowOnPageLoad="true" Top="10" Left="10" Width="400" Height="200"
        HeaderImage-Url="~/Images/sample-image14x14.gif" FooterImage-Url="~/Images/sample-image14x14.gif"
        EnableViewState="true">
        <ClientSideEvents Init="function(s, e) { new ASPxPopupControlPreviewHelper(s); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Sample Content
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function(selectionMode) {
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
                <dx:ASPxLabel runat="server" ID="lblHeaderAsLink" SkinID="Option" CssClass="label" Text="Show header as link:"
                    AssociatedControlID="chbHeaderAsLink">
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
                <dx:ASPxLabel runat="server" ID="lblFooterAsLink" SkinID="Option" CssClass="label" Text="Show footer as link:"
                    AssociatedControlID="chbFooterAsLink">
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

