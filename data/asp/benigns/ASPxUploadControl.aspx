<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxUploadControl1.Enabled = !chbDisabled.Checked;
        ASPxUploadControl1.Native = chbNative.Checked;
        ASPxUploadControl1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxUploadControl1.RightToLeft;
        
        ShowOptions();
    }
</script>

<asp:Content ID="Content3" ContentPlaceHolderID="phHead" runat="Server">
    <script type="text/javascript" src="Scripts/PreviewHelpers/UploadControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/ProgressBar.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ShowAddRemoveButtons="true" ShowUploadButton="true"
        ShowProgressPanel="true" Width="300px" ClientInstanceName="uc">
        <ClientSideEvents Init="function(s,e) { new ASPxUploadControlPreviewHelper(s); }"/>
    </dx:ASPxUploadControl>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblNative" CssClass="label" SkinID="Option" Text="Native:"
                    AssociatedControlID="chbNative">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbNative" CssClass="editor" SkinID="Option" AutoPostBack="true"></dx:ASPxCheckBox>
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
                <dx:ASPxLabel runat="server" ID="lblShowProgressPanel" CssClass="label" SkinID="Option" Text="Show progress bar:"
                    AssociatedControlID="chbShowProgressPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowProgressPanel" CssClass="editor" SkinID="Option" AutoPostBack="false">
                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxTBHelper.GetControlPreviewHelper(uc.name).SetProgressInfoPanelVisibility(s.GetChecked()); }"/>
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
